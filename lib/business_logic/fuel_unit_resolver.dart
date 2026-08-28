import '../models/fuel_entry.dart';
import '../models/fuel_unit.dart';
import '../models/vehicle.dart';
import '../services/fuel_unit_service.dart';
import '../services/vehicle_service.dart';

/// Resolves which unit each fuel entry was recorded in.
///
/// Resolution order, and the reason this change needs no migration:
///   1. the entry's own snapshot (`entry_unit_map`)
///   2. else the unit of the vehicle the entry is mapped to
///   3. else [FuelUnit.liter]
///
/// Every entry logged before units existed has no snapshot and (typically) a
/// petrol vehicle, so it resolves to liters — exactly what the app showed
/// before.
///
/// Loading is async but resolution is synchronous, so widgets can call
/// [unitFor] while building a list.
class FuelUnitResolver {
  final Map<String, String> _entryUnits;
  final Map<String, String> _entryVehicles;
  final Map<String, Vehicle> _vehiclesById;

  const FuelUnitResolver._(
    this._entryUnits,
    this._entryVehicles,
    this._vehiclesById,
  );

  /// Empty resolver: everything falls back to liters. Useful as a synchronous
  /// default while the real one loads.
  static const FuelUnitResolver empty =
      FuelUnitResolver._({}, {}, {});

  static Future<FuelUnitResolver> load() async {
    return FuelUnitResolver._(
      await FuelUnitService.getEntryUnitMap(),
      await VehicleService.getEntryVehicleMap(),
      {for (final v in await VehicleService.getVehicles()) v.id: v},
    );
  }

  FuelUnit unitFor(String entryId) {
    final snapshot = _entryUnits[entryId];
    if (snapshot != null) return FuelUnit.fromId(snapshot);

    final vehicleId = _entryVehicles[entryId];
    final vehicle = vehicleId == null ? null : _vehiclesById[vehicleId];
    return vehicle?.fuelUnit ?? FuelUnit.liter;
  }

  FuelUnit unitForEntry(FuelEntry entry) => unitFor(entry.id);

  /// Unit a new entry on [vehicle] should be logged in.
  static FuelUnit unitForVehicle(Vehicle? vehicle) =>
      vehicle?.fuelUnit ?? FuelUnit.liter;

  /// Distinct units across [entries] — the basis for deciding whether a
  /// quantity total is meaningful.
  Set<FuelUnit> unitsIn(Iterable<FuelEntry> entries) =>
      {for (final e in entries) unitFor(e.id)};
}
