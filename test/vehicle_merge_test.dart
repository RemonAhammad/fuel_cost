import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fuel_cost/models/vehicle.dart';
import 'package:fuel_cost/services/vehicle_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('mergeVehicles: backup wins on id, local-only kept', () async {
    SharedPreferences.setMockInitialValues({
      'vehicles': Vehicle.listToJson([
        Vehicle(id: 'a', name: 'Old Name'),
        Vehicle(id: 'local', name: 'Local Only'),
      ]),
    });

    await VehicleService.mergeVehicles([
      Vehicle(id: 'a', name: 'From Backup'),
      Vehicle(id: 'b', name: 'New From Backup'),
    ]);

    final result = await VehicleService.getVehicles();
    final byId = {for (final v in result) v.id: v.name};
    expect(byId.length, 3);
    expect(byId['a'], 'From Backup');
    expect(byId['local'], 'Local Only');
    expect(byId['b'], 'New From Backup');
  });

  test('mergeEntryVehicleMap: incoming wins, local-only kept', () async {
    SharedPreferences.setMockInitialValues({
      'entry_vehicle_map': jsonEncode({'e1': 'old', 'e2': 'localOnly'}),
    });

    await VehicleService.mergeEntryVehicleMap({'e1': 'fromBackup', 'e3': 'new'});

    final map = await VehicleService.getEntryVehicleMap();
    expect(map, {'e1': 'fromBackup', 'e2': 'localOnly', 'e3': 'new'});
  });
}
