import 'dart:convert';

import 'fuel_unit.dart';

class Vehicle {
  final String id;
  final String name;
  final String iconName;
  final String fuelType; // petrol, diesel, cng, electric
  final double? tankCapacity;

  /// Overrides the unit implied by [fuelType]. Null means "follow the fuel
  /// type", which is what every vehicle stored before units existed.
  final String? unitId;

  Vehicle({
    required this.id,
    required this.name,
    this.iconName = 'directions_car',
    this.fuelType = 'petrol',
    this.tankCapacity,
    this.unitId,
  });

  /// Unit this vehicle's fuel is measured in.
  FuelUnit get fuelUnit =>
      unitId != null ? FuelUnit.fromId(unitId) : FuelUnit.defaultFor(fuelType);

  /// Label for a tank/battery capacity field, which is kWh for an EV.
  String get capacityLabel =>
      fuelUnit.isEnergy ? 'Battery Capacity (kWh)' : 'Tank Capacity (${fuelUnit.short})';

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'iconName': iconName,
        'fuelType': fuelType,
        'tankCapacity': tankCapacity,
        'unitId': unitId,
      };

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json['id'],
        name: json['name'],
        iconName: json['iconName'] ?? 'directions_car',
        fuelType: json['fuelType'] ?? 'petrol',
        tankCapacity: json['tankCapacity']?.toDouble(),
        unitId: json['unitId'],
      );

  static List<Vehicle> listFromJson(String jsonStr) {
    final list = jsonDecode(jsonStr) as List;
    return list.map((e) => Vehicle.fromJson(e)).toList();
  }

  static String listToJson(List<Vehicle> vehicles) {
    return jsonEncode(vehicles.map((v) => v.toJson()).toList());
  }

  Vehicle copyWith({
    String? name,
    String? iconName,
    String? fuelType,
    double? tankCapacity,
    String? unitId,
    bool clearTankCapacity = false,
    bool clearUnitId = false,
  }) =>
      Vehicle(
        id: id,
        name: name ?? this.name,
        iconName: iconName ?? this.iconName,
        fuelType: fuelType ?? this.fuelType,
        tankCapacity: clearTankCapacity ? null : (tankCapacity ?? this.tankCapacity),
        unitId: clearUnitId ? null : (unitId ?? this.unitId),
      );

  static const Map<String, String> fuelTypes = {
    'petrol': 'Petrol',
    'diesel': 'Diesel',
    'cng': 'CNG',
    'electric': 'Electric',
    'hybrid': 'Hybrid',
  };

  static const Map<String, IconInfo> vehicleIcons = {
    'directions_car': IconInfo('Car', 0xe1d7),
    'two_wheeler': IconInfo('Bike', 0xf23e),
    'local_shipping': IconInfo('Truck', 0xe401),
    'airport_shuttle': IconInfo('Van', 0xe19c),
    'electric_car': IconInfo('Electric Car', 0xeb1c),
    'pedal_bike': IconInfo('Bicycle', 0xeb29),
  };
}

class IconInfo {
  final String label;
  final int codePoint;
  const IconInfo(this.label, this.codePoint);
}
