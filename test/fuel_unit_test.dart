import 'package:flutter_test/flutter_test.dart';
import 'package:fuel_cost/models/fuel_unit.dart';
import 'package:fuel_cost/models/vehicle.dart';

void main() {
  group('FuelUnit.defaultFor', () {
    test('liquid fuels default to liters', () {
      expect(FuelUnit.defaultFor('petrol'), FuelUnit.liter);
      expect(FuelUnit.defaultFor('diesel'), FuelUnit.liter);
    });

    test('electric defaults to kWh', () {
      expect(FuelUnit.defaultFor('electric'), FuelUnit.kilowattHour);
    });

    test('cng defaults to kg', () {
      expect(FuelUnit.defaultFor('cng'), FuelUnit.kilogram);
    });

    test('hybrid defaults to petrol, choosable per entry', () {
      expect(FuelUnit.defaultFor('hybrid'), FuelUnit.liter);
      expect(FuelUnit.optionsFor('hybrid'),
          containsAll([FuelUnit.liter, FuelUnit.kilowattHour]));
    });

    test('an unknown fuel type falls back to liters', () {
      expect(FuelUnit.defaultFor('rocket_fuel'), FuelUnit.liter);
    });
  });

  group('FuelUnit.fromId', () {
    test('null and empty resolve to liters — the pre-units default', () {
      expect(FuelUnit.fromId(null), FuelUnit.liter);
      expect(FuelUnit.fromId(''), FuelUnit.liter);
    });

    test('unrecognised ids resolve to liters rather than throwing', () {
      expect(FuelUnit.fromId('gallons'), FuelUnit.liter);
    });

    test('round-trips every unit through its stored id', () {
      for (final unit in FuelUnit.values) {
        expect(FuelUnit.fromId(unit.id), unit);
      }
    });

    test('stored ids stay ASCII so JSON and CSV are safe', () {
      expect(FuelUnit.cubicMeter.id, 'm3');
      expect(FuelUnit.cubicMeter.short, 'm³');
      for (final unit in FuelUnit.values) {
        expect(unit.id.codeUnits.every((c) => c < 128), isTrue,
            reason: '${unit.name} id must be ASCII');
      }
    });
  });

  group('Vehicle unit override', () {
    test('follows the fuel type when unitId is null', () {
      expect(Vehicle(id: 'v', name: 'EV', fuelType: 'electric').fuelUnit,
          FuelUnit.kilowattHour);
    });

    test('an explicit unitId wins — CNG by cubic meter', () {
      final v = Vehicle(id: 'v', name: 'Taxi', fuelType: 'cng', unitId: 'm3');
      expect(v.fuelUnit, FuelUnit.cubicMeter);
    });

    test('vehicles stored before units existed still parse', () {
      final legacy = Vehicle.fromJson({
        'id': 'v1',
        'name': 'Old Car',
        'iconName': 'directions_car',
        'fuelType': 'petrol',
        'tankCapacity': 40.0,
      });
      expect(legacy.unitId, isNull);
      expect(legacy.fuelUnit, FuelUnit.liter);
    });

    test('unitId survives a JSON round trip', () {
      final v = Vehicle(id: 'v', name: 'Taxi', fuelType: 'cng', unitId: 'm3');
      expect(Vehicle.fromJson(v.toJson()).fuelUnit, FuelUnit.cubicMeter);
    });

    test('copyWith can set and clear the override', () {
      final v = Vehicle(id: 'v', name: 'Taxi', fuelType: 'cng', unitId: 'm3');
      expect(v.copyWith(unitId: 'kg').fuelUnit, FuelUnit.kilogram);
      expect(v.copyWith(clearUnitId: true).fuelUnit, FuelUnit.kilogram,
          reason: 'clearing falls back to the cng default');
    });

    test('capacity label follows the unit', () {
      expect(Vehicle(id: 'v', name: 'EV', fuelType: 'electric').capacityLabel,
          'Battery Capacity (kWh)');
      expect(Vehicle(id: 'v', name: 'Car').capacityLabel, 'Tank Capacity (L)');
    });
  });

  group('labels', () {
    test('quantity and price labels adapt per unit', () {
      expect(FuelUnit.liter.quantityLabel, 'Fuel Amount (Liters)');
      expect(FuelUnit.liter.priceLabel, 'Price per Liter');
      expect(FuelUnit.kilowattHour.quantityLabel, 'Charge Amount (Kilowatt-hours)');
      expect(FuelUnit.kilowattHour.priceLabel, 'Price per kWh');
      expect(FuelUnit.cubicMeter.efficiencyLabel, 'km/m³');
    });
  });
}
