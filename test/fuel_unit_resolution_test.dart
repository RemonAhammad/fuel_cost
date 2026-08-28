import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fuel_cost/business_logic/fuel_calculations.dart';
import 'package:fuel_cost/business_logic/fuel_unit_resolver.dart';
import 'package:fuel_cost/models/fuel_entry.dart';
import 'package:fuel_cost/models/fuel_unit.dart';
import 'package:fuel_cost/models/vehicle.dart';
import 'package:fuel_cost/services/backup_data_service.dart';

FuelEntry entry(String id, {double liters = 30}) => FuelEntry()
  ..id = id
  ..liters = liters
  ..pricePerLiter = 100
  ..totalCost = liters * 100
  ..dateTime = DateTime(2026, 8, 12)
  ..odometerReading = 45000;

void seed({
  Map<String, String> entryUnits = const {},
  Map<String, String> entryVehicles = const {},
  List<Vehicle> vehicles = const [],
}) {
  SharedPreferences.setMockInitialValues({
    'entry_unit_map': jsonEncode(entryUnits),
    'entry_vehicle_map': jsonEncode(entryVehicles),
    'vehicles': Vehicle.listToJson(vehicles),
  });
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('resolution order', () {
    test('an entry with no snapshot and no vehicle is liters', () async {
      seed();
      final resolver = await FuelUnitResolver.load();
      expect(resolver.unitFor('e1'), FuelUnit.liter);
    });

    test('falls back to the mapped vehicle when there is no snapshot', () async {
      seed(
        entryVehicles: {'e1': 'ev'},
        vehicles: [Vehicle(id: 'ev', name: 'EV', fuelType: 'electric')],
      );
      final resolver = await FuelUnitResolver.load();
      expect(resolver.unitFor('e1'), FuelUnit.kilowattHour);
    });

    test('the snapshot wins over the vehicle — the conversion case', () async {
      // Car was petrol when e1 was logged, later converted to CNG.
      seed(
        entryUnits: {'e1': 'L'},
        entryVehicles: {'e1': 'car', 'e2': 'car'},
        vehicles: [Vehicle(id: 'car', name: 'Car', fuelType: 'cng')],
      );
      final resolver = await FuelUnitResolver.load();
      expect(resolver.unitFor('e1'), FuelUnit.liter,
          reason: 'history must not be rewritten by a later conversion');
      expect(resolver.unitFor('e2'), FuelUnit.kilogram,
          reason: 'entries without a snapshot follow the vehicle');
    });

    test("honours a vehicle's unit override", () async {
      seed(
        entryVehicles: {'e1': 'taxi'},
        vehicles: [
          Vehicle(id: 'taxi', name: 'Taxi', fuelType: 'cng', unitId: 'm3')
        ],
      );
      final resolver = await FuelUnitResolver.load();
      expect(resolver.unitFor('e1'), FuelUnit.cubicMeter);
    });

    test('a mapping to a deleted vehicle degrades to liters', () async {
      seed(entryVehicles: {'e1': 'gone'});
      final resolver = await FuelUnitResolver.load();
      expect(resolver.unitFor('e1'), FuelUnit.liter);
    });
  });

  group('aggregation', () {
    test('groups quantity per unit instead of summing across them', () async {
      seed(entryUnits: {'a': 'L', 'b': 'L', 'c': 'kWh'});
      final resolver = await FuelUnitResolver.load();
      final entries = [entry('a', liters: 30), entry('b', liters: 20), entry('c', liters: 45)];

      final totals = FuelCalculations.quantityByUnit(entries, resolver);
      expect(totals[FuelUnit.liter], 50);
      expect(totals[FuelUnit.kilowattHour], 45);
      expect(FuelCalculations.hasMixedUnits(entries, resolver), isTrue);
    });

    test('a single-unit scope is not flagged as mixed', () async {
      seed(entryUnits: {'a': 'L', 'b': 'L'});
      final resolver = await FuelUnitResolver.load();
      final entries = [entry('a'), entry('b')];
      expect(FuelCalculations.hasMixedUnits(entries, resolver), isFalse);
    });

    test('formats a breakdown largest first', () {
      expect(
        FuelCalculations.formatQuantityByUnit(
            {FuelUnit.kilowattHour: 45.0, FuelUnit.liter: 120.5}),
        '120.5 L · 45.0 kWh',
      );
    });
  });

  group('backup compatibility', () {
    RestorePreview diff({
      Map<String, String> backupUnits = const {},
      Map<String, String> localUnits = const {},
    }) =>
        BackupDataService.diff(
          backupEntries: [entry('e1')],
          backupVehicles: const [],
          backupEntryVehicleMap: const {},
          backupEntryUnitMap: backupUnits,
          selectedVehicleId: null,
          localEntries: [entry('e1')],
          localVehicles: const [],
          localEntryVehicleMap: const {},
          localEntryUnitMap: localUnits,
        );

    test('a v2 backup with no unit map reports no conflict', () {
      // The compatibility guarantee: older backups must not look like every
      // entry was switched to liters.
      final preview = diff(localUnits: {'e1': 'kWh'});
      expect(preview.hasConflicts, isFalse);
      expect(preview.identicalEntries, 1);
    });

    test('a changed unit alone is a conflict', () {
      final preview = diff(backupUnits: {'e1': 'kWh'}, localUnits: {'e1': 'L'});
      expect(preview.entryConflicts, hasLength(1));
      final conflict = preview.entryConflicts.single;
      expect(conflict.unitChanged, isTrue);
      expect(conflict.localUnit, FuelUnit.liter);
      expect(conflict.backupUnit, FuelUnit.kilowattHour);
    });

    test('matching units are not a conflict', () {
      final preview = diff(backupUnits: {'e1': 'kg'}, localUnits: {'e1': 'kg'});
      expect(preview.hasConflicts, isFalse);
    });
  });
}
