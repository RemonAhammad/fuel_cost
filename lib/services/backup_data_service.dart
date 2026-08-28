import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../models/fuel_entry.dart';
import '../models/vehicle.dart';
import 'fuel_storage_service.dart';
import 'vehicle_service.dart';

/// Counts reported back to the UI after a restore.
class BackupRestoreResult {
  final int entries;
  final int vehicles;

  /// Conflicts where the user chose to keep the local version.
  final int keptLocal;

  const BackupRestoreResult({
    required this.entries,
    required this.vehicles,
    this.keptLocal = 0,
  });
}

/// A fuel entry that exists both locally and in the backup with different
/// values. The mapped vehicle counts as part of the entry: an entry reassigned
/// to another vehicle conflicts even when its numbers are unchanged.
class EntryConflict {
  final FuelEntry local;
  final FuelEntry backup;
  final String? localVehicleId;
  final String? backupVehicleId;

  const EntryConflict({
    required this.local,
    required this.backup,
    this.localVehicleId,
    this.backupVehicleId,
  });

  String get id => backup.id;
  bool get vehicleChanged => localVehicleId != backupVehicleId;
}

/// A vehicle that exists both locally and in the backup with different values.
class VehicleConflict {
  final Vehicle local;
  final Vehicle backup;

  const VehicleConflict({required this.local, required this.backup});

  String get id => backup.id;
}

/// What a restore would do, computed before anything is written so the user
/// can resolve conflicts first.
class RestorePreview {
  final List<FuelEntry> newEntries;
  final List<EntryConflict> entryConflicts;
  final List<Vehicle> newVehicles;
  final List<VehicleConflict> vehicleConflicts;

  /// Backup's entry -> vehicle mapping, applied for entries the user does not
  /// keep local.
  final Map<String, String> entryVehicleMap;
  final String? selectedVehicleId;

  /// Records present in both copies with identical values — skipped silently.
  final int identicalEntries;
  final int identicalVehicles;

  const RestorePreview({
    required this.newEntries,
    required this.entryConflicts,
    required this.newVehicles,
    required this.vehicleConflicts,
    required this.entryVehicleMap,
    required this.selectedVehicleId,
    required this.identicalEntries,
    required this.identicalVehicles,
  });

  bool get hasConflicts =>
      entryConflicts.isNotEmpty || vehicleConflicts.isNotEmpty;

  int get conflictCount => entryConflicts.length + vehicleConflicts.length;
  int get newCount => newEntries.length + newVehicles.length;
  int get identicalCount => identicalEntries + identicalVehicles;
}

/// Owns the backup payload format, so DriveBackupService only has to deal with
/// Google Drive I/O.
///
/// Restore runs in three steps — [analyzeJson] diffs the backup against local
/// data, the UI resolves any conflicts, then [applyRestore] writes. Nothing is
/// written until apply, so abandoning the review leaves local data untouched.
///
/// Version 2 payload carries fuel entries, vehicles and the entry-vehicle
/// mapping together. Version 1 was a bare fuel-entry CSV with no vehicle data —
/// see [analyzeLegacyCsv].
class BackupDataService {
  static const int payloadVersion = 2;

  // --- Export ---

  static Future<String> buildBackupJson() async {
    final entries = await FuelStorageService.getFuelEntries();
    final vehicles = await VehicleService.getVehicles();
    final entryVehicleMap = await VehicleService.getEntryVehicleMap();
    final selectedVehicleId = await VehicleService.getSelectedVehicleId();

    return jsonEncode({
      'version': payloadVersion,
      'exportedAt': DateTime.now().toIso8601String(),
      'fuelEntries': entries.map((e) => e.toJson()).toList(),
      'vehicles': vehicles.map((v) => v.toJson()).toList(),
      'entryVehicleMap': entryVehicleMap,
      'selectedVehicleId': selectedVehicleId,
    });
  }

  // --- Analyze ---

  /// Diffs a v2 payload against local data. Writes nothing.
  static Future<RestorePreview> analyzeJson(String jsonContent) async {
    final Map<String, dynamic> data = jsonDecode(jsonContent);

    final vehicles = <Vehicle>[];
    for (final raw in (data['vehicles'] as List?) ?? const []) {
      try {
        vehicles.add(Vehicle.fromJson(Map<String, dynamic>.from(raw)));
      } catch (e) {
        debugPrint('Skipping invalid vehicle in backup: $e');
      }
    }

    final entries = <FuelEntry>[];
    for (final raw in (data['fuelEntries'] as List?) ?? const []) {
      try {
        entries.add(FuelEntry.fromJson(Map<String, dynamic>.from(raw)));
      } catch (e) {
        debugPrint('Skipping invalid fuel entry in backup: $e');
      }
    }

    final rawMap = data['entryVehicleMap'];
    final entryVehicleMap =
        rawMap is Map ? Map<String, String>.from(rawMap) : <String, String>{};

    return _analyze(
      backupEntries: entries,
      backupVehicles: vehicles,
      backupEntryVehicleMap: entryVehicleMap,
      selectedVehicleId: data['selectedVehicleId'] as String?,
    );
  }

  /// Diffs a v1 backup (fuel-entry CSV). Those backups predate vehicle support,
  /// so no vehicles or mappings come back — but entries are still reviewed.
  static Future<RestorePreview> analyzeLegacyCsv(String csvContent) async {
    return _analyze(
      backupEntries: parseLegacyCsv(csvContent),
      backupVehicles: const [],
      backupEntryVehicleMap: const {},
      selectedVehicleId: null,
    );
  }

  static Future<RestorePreview> _analyze({
    required List<FuelEntry> backupEntries,
    required List<Vehicle> backupVehicles,
    required Map<String, String> backupEntryVehicleMap,
    required String? selectedVehicleId,
  }) async {
    return diff(
      backupEntries: backupEntries,
      backupVehicles: backupVehicles,
      backupEntryVehicleMap: backupEntryVehicleMap,
      selectedVehicleId: selectedVehicleId,
      localEntries: await FuelStorageService.getFuelEntries(),
      localVehicles: await VehicleService.getVehicles(),
      localEntryVehicleMap: await VehicleService.getEntryVehicleMap(),
    );
  }

  /// Pure diff of a backup against a snapshot of local data. Kept free of
  /// storage calls so the conflict rules can be unit tested without Isar.
  static RestorePreview diff({
    required List<FuelEntry> backupEntries,
    required List<Vehicle> backupVehicles,
    required Map<String, String> backupEntryVehicleMap,
    required String? selectedVehicleId,
    required List<FuelEntry> localEntries,
    required List<Vehicle> localVehicles,
    required Map<String, String> localEntryVehicleMap,
  }) {
    final localEntriesById = {for (final e in localEntries) e.id: e};
    final localVehiclesById = {for (final v in localVehicles) v.id: v};
    final localMap = localEntryVehicleMap;

    final newVehicles = <Vehicle>[];
    final vehicleConflicts = <VehicleConflict>[];
    int identicalVehicles = 0;
    for (final backup in backupVehicles) {
      final local = localVehiclesById[backup.id];
      if (local == null) {
        newVehicles.add(backup);
      } else if (_vehiclesEqual(local, backup)) {
        identicalVehicles++;
      } else {
        vehicleConflicts.add(VehicleConflict(local: local, backup: backup));
      }
    }

    final newEntries = <FuelEntry>[];
    final entryConflicts = <EntryConflict>[];
    int identicalEntries = 0;
    for (final backup in backupEntries) {
      final local = localEntriesById[backup.id];
      if (local == null) {
        newEntries.add(backup);
        continue;
      }
      final localVehicleId = localMap[backup.id];
      // A legacy CSV carries no mapping; don't treat that as a reassignment.
      final backupVehicleId = backupEntryVehicleMap.isEmpty
          ? localVehicleId
          : backupEntryVehicleMap[backup.id];

      if (_entriesEqual(local, backup) && localVehicleId == backupVehicleId) {
        identicalEntries++;
      } else {
        entryConflicts.add(EntryConflict(
          local: local,
          backup: backup,
          localVehicleId: localVehicleId,
          backupVehicleId: backupVehicleId,
        ));
      }
    }

    return RestorePreview(
      newEntries: newEntries,
      entryConflicts: entryConflicts,
      newVehicles: newVehicles,
      vehicleConflicts: vehicleConflicts,
      entryVehicleMap: backupEntryVehicleMap,
      selectedVehicleId: selectedVehicleId,
      identicalEntries: identicalEntries,
      identicalVehicles: identicalVehicles,
    );
  }

  // --- Apply ---

  /// Writes a previously analyzed restore. New records always land; conflicted
  /// ones land only when their id is not in the keep-local sets.
  static Future<BackupRestoreResult> applyRestore(
    RestorePreview preview, {
    Set<String> keepLocalEntryIds = const {},
    Set<String> keepLocalVehicleIds = const {},
  }) async {
    // Vehicles first, so restored entries have something to map onto.
    final vehiclesToWrite = <Vehicle>[
      ...preview.newVehicles,
      ...preview.vehicleConflicts
          .where((c) => !keepLocalVehicleIds.contains(c.id))
          .map((c) => c.backup),
    ];
    if (vehiclesToWrite.isNotEmpty) {
      await VehicleService.mergeVehicles(vehiclesToWrite);
    }

    final entriesToWrite = <FuelEntry>[
      ...preview.newEntries,
      ...preview.entryConflicts
          .where((c) => !keepLocalEntryIds.contains(c.id))
          .map((c) => c.backup),
    ];
    int importedEntries = 0;
    for (final entry in entriesToWrite) {
      try {
        await FuelStorageService.saveFuelEntry(entry);
        importedEntries++;
      } catch (e) {
        debugPrint('Failed to restore fuel entry ${entry.id}: $e');
      }
    }

    // Keeping an entry local means keeping its vehicle assignment too, so drop
    // those ids from the incoming mapping.
    if (preview.entryVehicleMap.isNotEmpty) {
      final mapping = Map<String, String>.from(preview.entryVehicleMap)
        ..removeWhere((entryId, _) => keepLocalEntryIds.contains(entryId));
      if (mapping.isNotEmpty) {
        await VehicleService.mergeEntryVehicleMap(mapping);
      }
    }

    // Only adopt the backup's selection if this device has none, so a restore
    // never switches the vehicle out from under an active user.
    final backupSelectedId = preview.selectedVehicleId;
    if (backupSelectedId != null) {
      final localSelectedId = await VehicleService.getSelectedVehicleId();
      if (localSelectedId == null) {
        await VehicleService.setSelectedVehicleId(backupSelectedId);
      }
    }

    return BackupRestoreResult(
      entries: importedEntries,
      vehicles: vehiclesToWrite.length,
      keptLocal: keepLocalEntryIds.length + keepLocalVehicleIds.length,
    );
  }

  // --- Legacy CSV parsing ---

  /// Parses a v1 CSV into entries without writing them. Mirrors the column
  /// order of `FuelStorageService.exportToCsv` and skips unparseable rows.
  static List<FuelEntry> parseLegacyCsv(String csvContent) {
    final lines = csvContent.trim().split('\n');
    if (lines.length < 2) return [];

    final entries = <FuelEntry>[];
    for (int i = 1; i < lines.length; i++) {
      final line = lines[i].trim();
      if (line.isEmpty) continue;

      final parts = line.split(',');
      if (parts.length < 5) continue;

      try {
        entries.add(FuelEntry()
          ..id = parts[0]
          ..liters = double.parse(parts[1])
          ..pricePerLiter = double.parse(parts[2])
          ..totalCost = double.parse(parts[3])
          ..dateTime = DateTime.parse(parts[4])
          ..odometerReading = parts.length > 5 && parts[5].isNotEmpty
              ? double.parse(parts[5])
              : null);
      } catch (e) {
        debugPrint('Skipping invalid CSV row $i: $e');
      }
    }
    return entries;
  }

  // --- Value comparison ---

  static bool _entriesEqual(FuelEntry a, FuelEntry b) =>
      a.liters == b.liters &&
      a.pricePerLiter == b.pricePerLiter &&
      a.totalCost == b.totalCost &&
      a.dateTime.isAtSameMomentAs(b.dateTime) &&
      a.odometerReading == b.odometerReading;

  static bool _vehiclesEqual(Vehicle a, Vehicle b) =>
      a.name == b.name &&
      a.iconName == b.iconName &&
      a.fuelType == b.fuelType &&
      a.tankCapacity == b.tankCapacity;
}
