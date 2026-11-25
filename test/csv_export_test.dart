import 'package:flutter_test/flutter_test.dart';
import 'package:fuel_cost/models/fuel_entry.dart';
import 'package:fuel_cost/services/backup_data_service.dart';
import 'package:fuel_cost/models/vehicle.dart';
import 'package:fuel_cost/services/fuel_storage_service.dart';

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

String build(
  List<FuelEntry> entries,
  Map<String, String> units, {
  Map<String, String> vehicleIdByEntryId = const {},
  List<Vehicle> vehicles = const [],
}) =>
    FuelStorageService.buildCsv(entries, units,
        vehicleIdByEntryId: vehicleIdByEntryId, vehicles: vehicles);

void main() {
  group('buildCsv', () {
    test('writes the 7-column header including unit', () {
      final csv = build([], {});
      expect(
          csv.trim(),
          'id,liters,pricePerLiter,totalCost,dateTime,odometerReading,unit,'
          'vehicleId,vehicleName,vehicleIcon,vehicleFuelType,vehicleTankCapacity,vehicleUnit');
    });

    test('writes each entry unit', () {
      // The regression this pins: an export that drops the unit turns a kWh
      // or m³ log into bare numbers.
      final csv = build([entry('e1'), entry('e2')], {'e1': 'kWh', 'e2': 'm3'});
      final lines = csv.trim().split('\n');
      expect(lines[1], contains(',kWh,'));
      expect(lines[2], contains(',m3,'));
    });

    test('defaults to liters for entries with no unit snapshot', () {
      final csv = build([entry('legacy')], {});
      expect(csv.trim().split('\n')[1], contains(',L,'));
    });

    test('leaves the odometer column empty when unset', () {
      final csv = build([entry('e1', odometer: null)], {});
      expect(csv.trim().split('\n')[1], contains(',,L'));
    });

    test('round-trips through the legacy parser', () {
      // Appending `unit` last must not break parsers reading indices 0-5.
      final original = entry('e1', liters: 32.5, totalCost: 3250);
      final csv = build([original], {'e1': 'kWh'});

      final parsed = BackupDataService.parseLegacyCsv(csv);
      expect(parsed, hasLength(1));
      expect(parsed.single.id, 'e1');
      expect(parsed.single.liters, 32.5);
      expect(parsed.single.totalCost, 3250);
      expect(parsed.single.odometerReading, 45000);
    });
  });

  group('parseCsv', () {
    final car = Vehicle(
      id: 'v1',
      name: 'Dad\'s "Car", blue',
      iconName: 'two_wheeler',
      fuelType: 'cng',
      tankCapacity: 12,
      unitId: 'm3',
    );

    test('round-trips entries, units and vehicles', () {
      // The regression this pins: export carried no vehicles, so importing
      // on another device left every entry unassigned.
      final csv = build(
        [entry('e1'), entry('e2', odometer: null)],
        {'e1': 'm3'},
        vehicleIdByEntryId: {'e1': 'v1'},
        vehicles: [car],
      );
      final parsed = FuelStorageService.parseCsv(csv);

      expect(parsed.entries.map((e) => e.id), ['e1', 'e2']);
      expect(parsed.entries[1].odometerReading, isNull);
      expect(parsed.unitByEntryId, {'e1': 'm3', 'e2': 'L'});
      expect(parsed.vehicleIdByEntryId, {'e1': 'v1'});
      final v = parsed.vehicles.single;
      expect(v.toJson(), car.toJson());
    });

    test('a quoted vehicle name does not shift the legacy columns', () {
      final csv = build([entry('e1', liters: 32.5)], {'e1': 'kWh'},
          vehicleIdByEntryId: {'e1': 'v1'}, vehicles: [car]);
      final legacy = BackupDataService.parseLegacyCsv(csv);
      expect(legacy.single.liters, 32.5);
    });

    test('reads 6- and 7-column files from older versions', () {
      const old6 = 'id,liters,pricePerLiter,totalCost,dateTime,odometerReading\n'
          'a,10,100,1000,2026-01-01T00:00:00.000,500\n';
      const old7 = 'id,liters,pricePerLiter,totalCost,dateTime,odometerReading,unit\n'
          'b,10,100,1000,2026-01-01T00:00:00.000,,kg\n';
      final p6 = FuelStorageService.parseCsv(old6);
      expect(p6.entries.single.id, 'a');
      expect(p6.unitByEntryId, isEmpty);
      expect(p6.vehicles, isEmpty);
      final p7 = FuelStorageService.parseCsv(old7);
      expect(p7.unitByEntryId, {'b': 'kg'});
    });

    test('skips invalid rows and ignores unknown units', () {
      const csv = 'header\n'
          'bad,x,1,1,2026-01-01T00:00:00.000\n'
          'ok,1,1,1,2026-01-01T00:00:00.000,,gallons\n';
      final parsed = FuelStorageService.parseCsv(csv);
      expect(parsed.entries.single.id, 'ok');
      expect(parsed.unitByEntryId, isEmpty);
    });
  });
}
