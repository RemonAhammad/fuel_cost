import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fuel_cost/business_logic/entry_filter.dart';
import 'package:fuel_cost/business_logic/fuel_calculations.dart';
import 'package:fuel_cost/models/fuel_entry.dart';

FuelEntry entry(
  String id, {
  double liters = 30,
  double pricePerLiter = 100,
  double totalCost = 3000,
  double? odometer = 45000,
  required DateTime at,
}) =>
    FuelEntry()
      ..id = id
      ..liters = liters
      ..pricePerLiter = pricePerLiter
      ..totalCost = totalCost
      ..dateTime = at
      ..odometerReading = odometer;

void main() {
  final march = entry('march', at: DateTime(2026, 3, 15), totalCost: 2500);
  final june = entry('june', at: DateTime(2026, 6, 10), totalCost: 4000, odometer: 51000);
  final august = entry('august', at: DateTime(2026, 8, 20), totalCost: 3200);
  final all = [march, june, august];

  const vehicleMap = {'march': 'car', 'june': 'bike', 'august': 'car'};
  const vehicleNames = {'car': 'Family Car', 'bike': 'Red Bike'};

  List<String> ids(List<FuelEntry> result) => result.map((e) => e.id).toList();

  group('vehicle filter', () {
    test('null vehicle returns everything', () {
      expect(ids(filterEntries(entries: all)), ['march', 'june', 'august']);
    });

    test('filters to one vehicle', () {
      final result = filterEntries(
        entries: all,
        entryVehicleMap: vehicleMap,
        vehicleId: 'car',
      );
      expect(ids(result), ['march', 'august']);
    });
  });

  group('date range', () {
    test('is inclusive at both ends', () {
      final result = filterEntries(
        entries: all,
        range: DateTimeRange(
          start: DateTime(2026, 3, 15),
          end: DateTime(2026, 6, 10),
        ),
      );
      expect(ids(result), ['march', 'june']);
    });

    test('includes an entry logged later on the end day', () {
      // The picker hands back a midnight end date; a 6pm fill-up that day
      // must not be dropped.
      final evening = entry('evening', at: DateTime(2026, 6, 10, 18, 30));
      final result = filterEntries(
        entries: [evening],
        range: DateTimeRange(
          start: DateTime(2026, 6, 1),
          end: DateTime(2026, 6, 10),
        ),
      );
      expect(ids(result), ['evening']);
    });

    test('an empty window returns nothing rather than throwing', () {
      final result = filterEntries(
        entries: all,
        range: DateTimeRange(
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 1, 31),
        ),
      );
      expect(result, isEmpty);
    });
  });

  group('search', () {
    test('an empty or whitespace query filters nothing', () {
      expect(ids(filterEntries(entries: all, query: '')), hasLength(3));
      expect(ids(filterEntries(entries: all, query: '   ')), hasLength(3));
    });

    test('matches on cost', () {
      expect(ids(filterEntries(entries: all, query: '2500')), ['march']);
    });

    test('matches on odometer', () {
      expect(ids(filterEntries(entries: all, query: '51000')), ['june']);
    });

    test('matches on vehicle name, case-insensitively', () {
      final result = filterEntries(
        entries: all,
        entryVehicleMap: vehicleMap,
        vehicleNames: vehicleNames,
        query: 'red bike',
      );
      expect(ids(result), ['june']);
    });

    test('matches on formatted month', () {
      expect(ids(filterEntries(entries: all, query: 'Aug')), ['august']);
    });

    test('a query matching nothing returns empty', () {
      expect(filterEntries(entries: all, query: 'zzzz'), isEmpty);
    });
  });

  group('composition', () {
    test('vehicle, date and search apply together', () {
      final result = filterEntries(
        entries: all,
        entryVehicleMap: vehicleMap,
        vehicleNames: vehicleNames,
        vehicleId: 'car',
        range: DateTimeRange(
          start: DateTime(2026, 1, 1),
          end: DateTime(2026, 12, 31),
        ),
        query: '3200',
      );
      expect(ids(result), ['august']);
    });

    test('a contradictory combination returns empty', () {
      final result = filterEntries(
        entries: all,
        entryVehicleMap: vehicleMap,
        vehicleId: 'bike',
        query: '2500', // that cost belongs to the car's entry
      );
      expect(result, isEmpty);
    });
  });

  group('date presets', () {
    final now = DateTime(2026, 8, 29);

    test('all and custom have no implicit range', () {
      expect(DateFilterPreset.all.rangeFrom(now), isNull);
      expect(DateFilterPreset.custom.rangeFrom(now), isNull);
    });

    test('this month starts on the first', () {
      expect(DateFilterPreset.thisMonth.rangeFrom(now)!.start,
          DateTime(2026, 8, 1));
    });

    test('last 3 months spans the current plus two prior', () {
      expect(DateFilterPreset.lastThreeMonths.rangeFrom(now)!.start,
          DateTime(2026, 6, 1));
    });

    test('this year starts in January', () {
      expect(
          DateFilterPreset.thisYear.rangeFrom(now)!.start, DateTime(2026, 1, 1));
    });
  });

  group('runningCostPerKm', () {
    test('folds maintenance into the per-km figure', () {
      expect(
        FuelCalculations.runningCostPerKm(
            fuelCost: 10000, maintenanceCost: 5000, distance: 1000),
        15.0,
      );
    });

    test('matches the fuel-only figure when there is no maintenance', () {
      // Regression guarantee: vehicles with no service history must show
      // exactly what they showed before this change.
      expect(
        FuelCalculations.runningCostPerKm(
            fuelCost: 10000, maintenanceCost: 0, distance: 1000),
        10.0,
      );
    });

    test('returns 0 when no distance has been recorded', () {
      expect(
        FuelCalculations.runningCostPerKm(
            fuelCost: 10000, maintenanceCost: 5000, distance: 0),
        0.0,
      );
    });
  });
}
