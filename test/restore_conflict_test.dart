import 'package:flutter_test/flutter_test.dart';
import 'package:fuel_cost/models/fuel_entry.dart';
import 'package:fuel_cost/models/vehicle.dart';
import 'package:fuel_cost/services/backup_data_service.dart';

FuelEntry entry(
  String id, {
  double liters = 30,
  double pricePerLiter = 100,
  double totalCost = 3000,
  double? odometer = 45000,
  DateTime? at,
}) =>
    FuelEntry()
      ..id = id
      ..liters = liters
      ..pricePerLiter = pricePerLiter
      ..totalCost = totalCost
      ..dateTime = at ?? DateTime(2026, 8, 12, 9, 30)
      ..odometerReading = odometer;

RestorePreview run({
  List<FuelEntry> backupEntries = const [],
  List<Vehicle> backupVehicles = const [],
  Map<String, String> backupMap = const {},
  List<FuelEntry> localEntries = const [],
  List<Vehicle> localVehicles = const [],
  Map<String, String> localMap = const {},
}) =>
    BackupDataService.diff(
      backupEntries: backupEntries,
      backupVehicles: backupVehicles,
      backupEntryVehicleMap: backupMap,
      selectedVehicleId: null,
      localEntries: localEntries,
      localVehicles: localVehicles,
      localEntryVehicleMap: localMap,
    );

void main() {
  group('entry conflicts', () {
    test('identical entries are skipped, not surfaced', () {
      final preview = run(
        backupEntries: [entry('e1')],
        localEntries: [entry('e1')],
      );

      expect(preview.hasConflicts, isFalse);
      expect(preview.identicalEntries, 1);
      expect(preview.newEntries, isEmpty);
    });

    test('a changed price is a conflict', () {
      final preview = run(
        backupEntries: [entry('e1', pricePerLiter: 110, totalCost: 3300)],
        localEntries: [entry('e1')],
      );

      expect(preview.entryConflicts, hasLength(1));
      final conflict = preview.entryConflicts.single;
      expect(conflict.local.pricePerLiter, 100);
      expect(conflict.backup.pricePerLiter, 110);
    });

    test('a changed odometer is a conflict, including null <-> value', () {
      expect(
        run(
          backupEntries: [entry('e1', odometer: null)],
          localEntries: [entry('e1')],
        ).entryConflicts,
        hasLength(1),
      );
    });

    test('same values but a different vehicle is still a conflict', () {
      final preview = run(
        backupEntries: [entry('e1')],
        backupMap: {'e1': 'bike'},
        localEntries: [entry('e1')],
        localMap: {'e1': 'car'},
      );

      expect(preview.entryConflicts, hasLength(1));
      final conflict = preview.entryConflicts.single;
      expect(conflict.vehicleChanged, isTrue);
      expect(conflict.localVehicleId, 'car');
      expect(conflict.backupVehicleId, 'bike');
    });

    test('backup-only entries are added without asking', () {
      final preview = run(backupEntries: [entry('new1')]);

      expect(preview.hasConflicts, isFalse);
      expect(preview.newEntries.single.id, 'new1');
    });

    test('local-only entries are left alone entirely', () {
      final preview = run(localEntries: [entry('mine')]);

      expect(preview.hasConflicts, isFalse);
      expect(preview.newEntries, isEmpty);
      expect(preview.identicalEntries, 0);
    });
  });

  group('vehicle conflicts', () {
    test('a renamed vehicle is a conflict', () {
      final preview = run(
        backupVehicles: [Vehicle(id: 'v1', name: 'Backup Name')],
        localVehicles: [Vehicle(id: 'v1', name: 'Local Name')],
      );

      expect(preview.vehicleConflicts, hasLength(1));
      expect(preview.vehicleConflicts.single.local.name, 'Local Name');
      expect(preview.vehicleConflicts.single.backup.name, 'Backup Name');
    });

    test('identical vehicles are skipped', () {
      final preview = run(
        backupVehicles: [Vehicle(id: 'v1', name: 'Car', tankCapacity: 40)],
        localVehicles: [Vehicle(id: 'v1', name: 'Car', tankCapacity: 40)],
      );

      expect(preview.hasConflicts, isFalse);
      expect(preview.identicalVehicles, 1);
    });

    test('a changed fuel type is a conflict', () {
      final preview = run(
        backupVehicles: [Vehicle(id: 'v1', name: 'Car', fuelType: 'diesel')],
        localVehicles: [Vehicle(id: 'v1', name: 'Car', fuelType: 'petrol')],
      );

      expect(preview.vehicleConflicts, hasLength(1));
    });
  });

  group('legacy CSV', () {
    test('parses rows and tolerates junk', () {
      final entries = BackupDataService.parseLegacyCsv(
        'id,liters,pricePerLiter,totalCost,dateTime,odometerReading\n'
        'e1,30.0,100.0,3000.0,2026-08-12T09:30:00.000,45000.0\n'
        'broken,row\n'
        'e2,25.0,102.0,2550.0,2026-08-20T09:30:00.000,\n',
      );

      expect(entries, hasLength(2));
      expect(entries.first.id, 'e1');
      expect(entries.last.odometerReading, isNull);
    });

    test('carries no mapping, so it never reports a vehicle reassignment', () {
      // A v1 backup has no entryVehicleMap; a locally assigned entry must not
      // look like it was moved to "unassigned".
      final preview = run(
        backupEntries: [entry('e1')],
        backupMap: const {},
        localEntries: [entry('e1')],
        localMap: {'e1': 'car'},
      );

      expect(preview.hasConflicts, isFalse);
      expect(preview.identicalEntries, 1);
    });
  });

  group('summary counts', () {
    test('tallies conflicts, new and unchanged across both types', () {
      final preview = run(
        backupEntries: [
          entry('same'),
          entry('changed', liters: 31),
          entry('fresh'),
        ],
        backupVehicles: [
          Vehicle(id: 'v1', name: 'Renamed'),
          Vehicle(id: 'v2', name: 'New Car'),
        ],
        localEntries: [entry('same'), entry('changed')],
        localVehicles: [Vehicle(id: 'v1', name: 'Original')],
      );

      expect(preview.conflictCount, 2); // 1 entry + 1 vehicle
      expect(preview.newCount, 2); // 1 entry + 1 vehicle
      expect(preview.identicalCount, 1);
      expect(preview.hasConflicts, isTrue);
    });
  });
}
