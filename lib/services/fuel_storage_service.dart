import 'package:flutter/foundation.dart';
import 'package:isar_community/isar.dart';
import '../models/fuel_entry.dart';
import 'database_service.dart';
import 'vehicle_service.dart';
import 'fuel_unit_service.dart';
import '../models/fuel_unit.dart';
import '../models/vehicle.dart';

class FuelStorageService {
  static Future<List<FuelEntry>> getFuelEntries() async {
    final isar = await DatabaseService.database;
    return await isar.fuelEntrys.where().sortByDateTime().findAll();
  }

  static Future<void> saveFuelEntry(FuelEntry entry) async {
    final isar = await DatabaseService.database;
    await isar.writeTxn(() async {
      await isar.fuelEntrys.putById(entry);
    });

    if (entry.odometerReading != null) {
      await setCurrentOdometer(entry.odometerReading!);
    }
  }

  static Future<void> deleteFuelEntry(String id) async {
    final isar = await DatabaseService.database;
    await isar.writeTxn(() async {
      await isar.fuelEntrys.deleteById(id);
    });

    // The vehicle and unit mappings live outside Isar, so they have to be
    // cleaned up by hand or they accumulate for deleted entries.
    await VehicleService.removeEntryMapping(id);
    await FuelUnitService.removeEntryUnit(id);
  }

  static Future<double> getTotalFuelCost() async {
    final isar = await DatabaseService.database;
    final sum = await isar.fuelEntrys.where().totalCostProperty().sum();
    return sum;
  }

  static Future<double> getTotalLiters() async {
    final isar = await DatabaseService.database;
    final sum = await isar.fuelEntrys.where().litersProperty().sum();
    return sum;
  }

  static Future<double> getAveragePricePerLiter() async {
    final totalCost = await getTotalFuelCost();
    final totalLiters = await getTotalLiters();
    return totalLiters > 0 ? totalCost / totalLiters : 0.0;
  }

  static Future<double?> getAverageMileage() async {
    final entries = await getFuelEntries();
    if (entries.length < 2) return null;

    List<double> mileages = [];
    for (int i = 1; i < entries.length; i++) {
      final mileage = FuelEntry.calculateMileage(entries[i], entries[i - 1]);
      if (mileage != null) {
        mileages.add(mileage);
      }
    }

    if (mileages.isEmpty) return null;
    return mileages.reduce((a, b) => a + b) / mileages.length;
  }

  static Future<double?> getLastMileage() async {
    final entries = await getFuelEntries();
    if (entries.length < 2) return null;
    return FuelEntry.calculateMileage(entries.last, entries[entries.length - 2]);
  }

  static Future<double?> getCurrentOdometer() async {
    final isar = await DatabaseService.database;
    final lastEntry = await isar.fuelEntrys
        .filter()
        .odometerReadingIsNotNull()
        .sortByDateTimeDesc()
        .findFirst();
    return lastEntry?.odometerReading;
  }

  static Future<double?> getLastOdometerForVehicle(String? vehicleId) async {
    if (vehicleId == null) return getCurrentOdometer();
    final entryIds = await VehicleService.getEntryIdsForVehicle(vehicleId);
    if (entryIds.isEmpty) return null;
    final isar = await DatabaseService.database;
    final entries = await isar.fuelEntrys
        .filter()
        .odometerReadingIsNotNull()
        .sortByDateTimeDesc()
        .findAll();
    for (final entry in entries) {
      if (entryIds.contains(entry.id)) {
        return entry.odometerReading;
      }
    }
    return null;
  }

  static Future<void> setCurrentOdometer(double odometer) async {
    // Odometer is now tracked via entries, no separate storage needed
  }

  static Future<double?> calculateCurrentMileage(double liters, double? currentOdometer) async {
    if (currentOdometer == null) return null;

    final isar = await DatabaseService.database;
    final lastEntry = await isar.fuelEntrys
        .filter()
        .odometerReadingIsNotNull()
        .sortByDateTimeDesc()
        .findFirst();

    if (lastEntry == null || lastEntry.odometerReading == null) return null;

    final distance = currentOdometer - lastEntry.odometerReading!;
    if (distance > 0) {
      // Fuel at last entry was consumed during this trip
      return distance / lastEntry.liters;
    }
    return null;
  }

  static Future<Map<String, dynamic>?> getMileageCalculationDetails(double liters, double? currentOdometer) async {
    if (currentOdometer == null) return null;

    final isar = await DatabaseService.database;
    final lastEntry = await isar.fuelEntrys
        .filter()
        .odometerReadingIsNotNull()
        .sortByDateTimeDesc()
        .findFirst();

    if (lastEntry == null || lastEntry.odometerReading == null) return null;

    final distance = currentOdometer - lastEntry.odometerReading!;
    if (distance > 0) {
      // Fuel at last entry was consumed during this trip
      final mileage = distance / lastEntry.liters;
      return {
        'currentOdometer': currentOdometer,
        'lastOdometer': lastEntry.odometerReading!,
        'distance': distance,
        'liters': lastEntry.liters,
        'mileage': mileage,
        'lastFuelDate': lastEntry.dateTime,
      };
    }
    return null;
  }

  static Future<void> updateFuelEntry(FuelEntry entry) async {
    final isar = await DatabaseService.database;
    await isar.writeTxn(() async {
      await isar.fuelEntrys.putById(entry);
    });
  }

  /// Header of every CSV the app writes. `unit` and the vehicle columns are
  /// appended after the original six, so older parsers reading fixed indices
  /// 0-5 (including `BackupDataService.parseLegacyCsv`) still read new files.
  static const csvHeader =
      'id,liters,pricePerLiter,totalCost,dateTime,odometerReading,unit,'
      'vehicleId,vehicleName,vehicleIcon,vehicleFuelType,vehicleTankCapacity,vehicleUnit';

  /// The single CSV writer for the app. Every export path must go through this
  /// — a duplicated inline copy is how the `unit` column came to be missing
  /// from the Settings export.
  ///
  /// Each row carries its vehicle's full definition, so importing on another
  /// device can recreate the vehicles rather than leaving every entry
  /// unassigned.
  static String buildCsv(
    List<FuelEntry> entries,
    Map<String, String> unitsByEntryId, {
    required Map<String, String> vehicleIdByEntryId,
    required List<Vehicle> vehicles,
  }) {
    final vehiclesById = {for (final v in vehicles) v.id: v};
    final buffer = StringBuffer();
    buffer.writeln(csvHeader);
    for (final entry in entries) {
      final unit = unitsByEntryId[entry.id] ?? FuelUnit.liter.id;
      final vehicle = vehiclesById[vehicleIdByEntryId[entry.id]];
      final fields = [
        entry.id,
        '${entry.liters}',
        '${entry.pricePerLiter}',
        '${entry.totalCost}',
        entry.dateTime.toIso8601String(),
        '${entry.odometerReading ?? ''}',
        unit,
        vehicle?.id ?? '',
        vehicle?.name ?? '',
        vehicle?.iconName ?? '',
        vehicle?.fuelType ?? '',
        '${vehicle?.tankCapacity ?? ''}',
        vehicle?.unitId ?? '',
      ];
      buffer.writeln(fields.map(_csvField).join(','));
    }
    return buffer.toString();
  }

  /// Quotes a field only when it needs it. Only user-typed text (the vehicle
  /// name) can contain a comma or quote, and it sits after index 6, so
  /// naive `split(',')` parsers still see the first seven columns intact.
  static String _csvField(String value) {
    if (!value.contains(',') && !value.contains('"') && !value.contains('\n')) {
      return value;
    }
    return '"${value.replaceAll('"', '""')}"';
  }

  /// Splits one CSV line, honouring double-quoted fields.
  static List<String> _splitCsvLine(String line) {
    final fields = <String>[];
    final current = StringBuffer();
    var inQuotes = false;
    for (var i = 0; i < line.length; i++) {
      final c = line[i];
      if (inQuotes) {
        if (c == '"') {
          if (i + 1 < line.length && line[i + 1] == '"') {
            current.write('"');
            i++;
          } else {
            inQuotes = false;
          }
        } else {
          current.write(c);
        }
      } else if (c == '"') {
        inQuotes = true;
      } else if (c == ',') {
        fields.add(current.toString());
        current.clear();
      } else {
        current.write(c);
      }
    }
    fields.add(current.toString());
    return fields;
  }

  /// Pure parser for app CSVs — no storage calls, so it is unit-testable
  /// without Isar. Reads files from every app version: 6 columns (pre-units),
  /// 7 (with unit) and 13 (with vehicle). Invalid rows are skipped.
  static ParsedCsv parseCsv(String csvContent) {
    final lines = csvContent.trim().split('\n');
    final entries = <FuelEntry>[];
    final units = <String, String>{};
    final vehicleIdByEntry = <String, String>{};
    final vehicles = <String, Vehicle>{};

    for (var i = 1; i < lines.length; i++) {
      final line = lines[i].trim();
      if (line.isEmpty) continue;
      final parts = _splitCsvLine(line);
      if (parts.length < 5) continue;
      try {
        final entry = FuelEntry()
          ..id = parts[0]
          ..liters = double.parse(parts[1])
          ..pricePerLiter = double.parse(parts[2])
          ..totalCost = double.parse(parts[3])
          ..dateTime = DateTime.parse(parts[4])
          ..odometerReading = parts.length > 5 && parts[5].isNotEmpty ? double.parse(parts[5]) : null;
        entries.add(entry);

        if (parts.length > 6 && parts[6].isNotEmpty) {
          // fromId falls back to liters for junk, so only keep known ids.
          final unit = FuelUnit.fromId(parts[6]);
          if (unit.id == parts[6]) units[entry.id] = unit.id;
        }

        if (parts.length > 8 && parts[7].isNotEmpty && parts[8].isNotEmpty) {
          final vehicleId = parts[7];
          vehicleIdByEntry[entry.id] = vehicleId;
          vehicles.putIfAbsent(
            vehicleId,
            () => Vehicle(
              id: vehicleId,
              name: parts[8],
              iconName: parts.length > 9 && Vehicle.vehicleIcons.containsKey(parts[9])
                  ? parts[9]
                  : 'directions_car',
              fuelType: parts.length > 10 && Vehicle.fuelTypes.containsKey(parts[10])
                  ? parts[10]
                  : 'petrol',
              tankCapacity: parts.length > 11 ? double.tryParse(parts[11]) : null,
              unitId: parts.length > 12 && parts[12].isNotEmpty ? parts[12] : null,
            ),
          );
        }
      } catch (e) {
        debugPrint('Skipping invalid CSV row $i: $e');
      }
    }
    return ParsedCsv(
      entries: entries,
      unitByEntryId: units,
      vehicleIdByEntryId: vehicleIdByEntry,
      vehicles: vehicles.values.toList(),
    );
  }

  static Future<String> exportToCsv() async {
    return buildCsv(
      await getFuelEntries(),
      await FuelUnitService.getEntryUnitMap(),
      vehicleIdByEntryId: await VehicleService.getEntryVehicleMap(),
      vehicles: await VehicleService.getVehicles(),
    );
  }

  /// Imports a CSV written by [buildCsv] (or any older version).
  ///
  /// [assignToVehicleId] null → use the vehicles recorded in the file,
  /// creating any this device doesn't have. A file vehicle whose id is unknown
  /// here but whose name matches a local vehicle is mapped onto that one,
  /// so importing into a device where the user re-created "My Car" by hand
  /// doesn't produce a duplicate. Existing local vehicles are never modified.
  ///
  /// [assignToVehicleId] set → every entry goes to that vehicle.
  /// [leaveUnassigned] → no vehicle mapping at all.
  static Future<CsvImportResult> importFromCsv(
    String csvContent, {
    String? assignToVehicleId,
    bool leaveUnassigned = false,
  }) async {
    final parsed = parseCsv(csvContent);
    var vehiclesCreated = 0;

    Map<String, String> mapping = {};
    if (leaveUnassigned) {
      mapping = {};
    } else if (assignToVehicleId != null) {
      mapping = {for (final e in parsed.entries) e.id: assignToVehicleId};
    } else if (parsed.vehicles.isNotEmpty) {
      final local = await VehicleService.getVehicles();
      final localIds = {for (final v in local) v.id};
      final localByName = {for (final v in local) v.name.trim().toLowerCase(): v.id};
      final resolvedId = <String, String>{};
      final toCreate = <Vehicle>[];
      for (final v in parsed.vehicles) {
        if (localIds.contains(v.id)) {
          resolvedId[v.id] = v.id;
        } else if (localByName.containsKey(v.name.trim().toLowerCase())) {
          resolvedId[v.id] = localByName[v.name.trim().toLowerCase()]!;
        } else {
          resolvedId[v.id] = v.id;
          toCreate.add(v);
        }
      }
      if (toCreate.isNotEmpty) {
        await VehicleService.mergeVehicles(toCreate);
        vehiclesCreated = toCreate.length;
      }
      mapping = {
        for (final e in parsed.vehicleIdByEntryId.entries) e.key: resolvedId[e.value]!,
      };
    }

    for (final entry in parsed.entries) {
      await saveFuelEntry(entry);
    }
    if (parsed.unitByEntryId.isNotEmpty) {
      await FuelUnitService.mergeEntryUnitMap(parsed.unitByEntryId);
    }
    if (mapping.isNotEmpty) {
      await VehicleService.mergeEntryVehicleMap(mapping);
    }
    return CsvImportResult(
      entriesImported: parsed.entries.length,
      vehiclesCreated: vehiclesCreated,
    );
  }

  static Future<void> clearAllData() async {
    final isar = await DatabaseService.database;
    await isar.writeTxn(() async {
      await isar.fuelEntrys.clear();
    });
  }

  static Future<void> clearFuelEntries() async {
    final isar = await DatabaseService.database;
    await isar.writeTxn(() async {
      await isar.fuelEntrys.clear();
    });
  }

  static Future<void> clearCurrentOdometer() async {
    // Odometer is tracked via entries - clearing it means nothing separate
  }

  static Future<void> clearAllSharedPreferences() async {
    final isar = await DatabaseService.database;
    await isar.writeTxn(() async {
      await isar.clear();
    });
  }
}

/// Result of [FuelStorageService.parseCsv].
class ParsedCsv {
  final List<FuelEntry> entries;
  final Map<String, String> unitByEntryId;
  final Map<String, String> vehicleIdByEntryId;
  final List<Vehicle> vehicles;

  const ParsedCsv({
    required this.entries,
    required this.unitByEntryId,
    required this.vehicleIdByEntryId,
    required this.vehicles,
  });
}

class CsvImportResult {
  final int entriesImported;
  final int vehiclesCreated;
  const CsvImportResult({required this.entriesImported, required this.vehiclesCreated});
}
