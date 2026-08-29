import 'package:flutter_test/flutter_test.dart';
import 'package:fuel_cost/models/fuel_entry.dart';
import 'package:fuel_cost/services/backup_data_service.dart';
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

void main() {
  group('buildCsv', () {
    test('writes the 7-column header including unit', () {
      final csv = FuelStorageService.buildCsv([], {});
      expect(csv.trim(),
          'id,liters,pricePerLiter,totalCost,dateTime,odometerReading,unit');
    });

    test('writes each entry unit', () {
      // The regression this pins: an export that drops the unit turns a kWh
      // or m³ log into bare numbers.
      final csv = FuelStorageService.buildCsv(
        [entry('e1'), entry('e2')],
        {'e1': 'kWh', 'e2': 'm3'},
      );
      final lines = csv.trim().split('\n');
      expect(lines[1], endsWith(',kWh'));
      expect(lines[2], endsWith(',m3'));
    });

    test('defaults to liters for entries with no unit snapshot', () {
      final csv = FuelStorageService.buildCsv([entry('legacy')], {});
      expect(csv.trim().split('\n')[1], endsWith(',L'));
    });

    test('leaves the odometer column empty when unset', () {
      final csv = FuelStorageService.buildCsv([entry('e1', odometer: null)], {});
      expect(csv.trim().split('\n')[1], contains(',,L'));
    });

    test('round-trips through the legacy parser', () {
      // Appending `unit` last must not break parsers reading indices 0-5.
      final original = entry('e1', liters: 32.5, totalCost: 3250);
      final csv = FuelStorageService.buildCsv([original], {'e1': 'kWh'});

      final parsed = BackupDataService.parseLegacyCsv(csv);
      expect(parsed, hasLength(1));
      expect(parsed.single.id, 'e1');
      expect(parsed.single.liters, 32.5);
      expect(parsed.single.totalCost, 3250);
      expect(parsed.single.odometerReading, 45000);
    });
  });
}
