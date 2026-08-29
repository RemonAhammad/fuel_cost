import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/fuel_entry.dart';

/// Date presets offered above the fuel history list.
enum DateFilterPreset { all, thisMonth, lastThreeMonths, thisYear, custom }

extension DateFilterPresetLabel on DateFilterPreset {
  String get label {
    switch (this) {
      case DateFilterPreset.all:
        return 'All';
      case DateFilterPreset.thisMonth:
        return 'This Month';
      case DateFilterPreset.lastThreeMonths:
        return 'Last 3 Months';
      case DateFilterPreset.thisYear:
        return 'This Year';
      case DateFilterPreset.custom:
        return 'Custom';
    }
  }

  /// Concrete range for this preset, relative to [now]. Null means unbounded
  /// ([DateFilterPreset.all]) or user-supplied ([DateFilterPreset.custom]).
  DateTimeRange? rangeFrom(DateTime now) {
    switch (this) {
      case DateFilterPreset.all:
      case DateFilterPreset.custom:
        return null;
      case DateFilterPreset.thisMonth:
        return DateTimeRange(
          start: DateTime(now.year, now.month, 1),
          end: now,
        );
      case DateFilterPreset.lastThreeMonths:
        return DateTimeRange(
          start: DateTime(now.year, now.month - 2, 1),
          end: now,
        );
      case DateFilterPreset.thisYear:
        return DateTimeRange(start: DateTime(now.year, 1, 1), end: now);
    }
  }
}

/// Filters fuel entries by vehicle, date range and a free-text query.
///
/// Pure on purpose — the history screen delegates to this so the filter rules
/// can be unit tested without pumping widgets or touching Isar.
///
/// [query] is matched case-insensitively against the entry's numbers (total
/// cost, quantity, price per unit, odometer), its formatted date, and the name
/// of the vehicle it belongs to. `FuelEntry` has no notes field — the Isar
/// schema is frozen — so this deliberately is not free-text search.
List<FuelEntry> filterEntries({
  required List<FuelEntry> entries,
  Map<String, String> entryVehicleMap = const {},
  Map<String, String> vehicleNames = const {},
  String? vehicleId,
  DateTimeRange? range,
  String query = '',
}) {
  final normalizedQuery = query.trim().toLowerCase();

  return entries.where((entry) {
    if (vehicleId != null && entryVehicleMap[entry.id] != vehicleId) {
      return false;
    }

    if (range != null && !_withinRange(entry.dateTime, range)) return false;

    if (normalizedQuery.isEmpty) return true;
    return _matchesQuery(
      entry,
      normalizedQuery,
      vehicleNames[entryVehicleMap[entry.id]] ?? '',
    );
  }).toList();
}

/// Inclusive at both ends: a range's end date is usually picked as a whole day,
/// so comparing raw timestamps would drop entries logged later that day.
bool _withinRange(DateTime when, DateTimeRange range) {
  final day = DateTime(when.year, when.month, when.day);
  final start =
      DateTime(range.start.year, range.start.month, range.start.day);
  final end = DateTime(range.end.year, range.end.month, range.end.day);
  return !day.isBefore(start) && !day.isAfter(end);
}

bool _matchesQuery(FuelEntry entry, String query, String vehicleName) {
  final haystack = <String>[
    entry.totalCost.toStringAsFixed(2),
    entry.totalCost.toStringAsFixed(0),
    entry.liters.toStringAsFixed(2),
    entry.pricePerLiter.toStringAsFixed(2),
    if (entry.odometerReading != null)
      entry.odometerReading!.toStringAsFixed(0),
    DateFormat('MMM dd, yyyy').format(entry.dateTime),
    vehicleName,
  ];

  for (final field in haystack) {
    if (field.toLowerCase().contains(query)) return true;
  }
  return false;
}
