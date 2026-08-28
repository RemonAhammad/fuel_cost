import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/fuel_unit.dart';

/// Per-entry fuel-unit snapshots, stored as `entryId -> unit id`.
///
/// Mirrors the entry-vehicle mapping in [VehicleService]: `FuelEntry` is an
/// Isar collection with a pre-generated `.g.dart`, so a unit column cannot be
/// added to it. Snapshotting on save (rather than reading the vehicle's unit
/// live) keeps history truthful when a vehicle is converted — a petrol car
/// retrofitted to CNG keeps its old entries in liters.
class FuelUnitService {
  static const String _entryUnitMapKey = 'entry_unit_map';

  static Future<Map<String, String>> getEntryUnitMap() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_entryUnitMapKey);
    if (json == null || json.isEmpty) return {};
    return Map<String, String>.from(jsonDecode(json));
  }

  static Future<void> setUnitForEntry(String entryId, FuelUnit unit) async {
    final map = await getEntryUnitMap();
    map[entryId] = unit.id;
    await _save(map);
  }

  static Future<FuelUnit?> getUnitForEntry(String entryId) async {
    final map = await getEntryUnitMap();
    final id = map[entryId];
    return id == null ? null : FuelUnit.fromId(id);
  }

  static Future<void> removeEntryUnit(String entryId) async {
    final map = await getEntryUnitMap();
    map.remove(entryId);
    await _save(map);
  }

  /// Merges a mapping from a backup: incoming keys win, local-only kept.
  static Future<void> mergeEntryUnitMap(Map<String, String> incoming) async {
    final map = await getEntryUnitMap();
    map.addAll(incoming);
    await _save(map);
  }

  static Future<void> _save(Map<String, String> map) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_entryUnitMapKey, jsonEncode(map));
  }
}
