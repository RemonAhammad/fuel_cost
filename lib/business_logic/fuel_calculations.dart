import '../models/fuel_entry.dart';
import '../models/fuel_unit.dart';
import 'fuel_unit_resolver.dart';

class FuelCalculations {
  /// Calculate mileage metrics:
  /// - Fuel at entry i is consumed between entry i and entry i+1
  /// - Per trip (i to i+1): (odo[i+1] - odo[i]) / liters[i]
  /// - Last entry fuel is excluded (not yet consumed)
  /// - Overall: total distance / (total fuel - last entry fuel)
  static Map<String, double> calculateMileageMetrics(
    List<FuelEntry> entries,
    double totalLiters,
  ) {
    final sortedEntries = List<FuelEntry>.from(entries)
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));

    double lastTripMileage = 0.0;
    double overallMileage = 0.0;
    double totalDistance = 0.0;
    double maxMileage = 0.0;
    double minMileage = double.infinity;

    if (sortedEntries.length > 1) {
      final tripMileages = <double>[];

      for (int i = 1; i < sortedEntries.length; i++) {
        if (sortedEntries[i].odometerReading != null &&
            sortedEntries[i - 1].odometerReading != null) {
          final distance = sortedEntries[i].odometerReading! -
                          sortedEntries[i - 1].odometerReading!;
          if (distance > 0) {
            totalDistance += distance;
            // Fuel at entry i-1 was consumed during this trip
            final tripMileage = distance / sortedEntries[i - 1].liters;
            tripMileages.add(tripMileage);
          }
        }
      }

      if (totalDistance > 0) {
        if (tripMileages.isNotEmpty) {
          maxMileage = tripMileages.reduce((a, b) => a > b ? a : b);
          minMileage = tripMileages.reduce((a, b) => a < b ? a : b);
        }

        // Last trip mileage
        if (sortedEntries.length >= 2) {
          final lastEntry = sortedEntries.last;
          final secondLastEntry = sortedEntries[sortedEntries.length - 2];

          if (lastEntry.odometerReading != null &&
              secondLastEntry.odometerReading != null) {
            final lastTripDistance = lastEntry.odometerReading! -
                                   secondLastEntry.odometerReading!;
            if (lastTripDistance > 0) {
              lastTripMileage = lastTripDistance / secondLastEntry.liters;
            }
          }
        }

        // Overall: total distance / (total fuel - last entry fuel)
        // Last entry fuel hasn't been consumed yet
        final totalFuelExcludingLast = totalLiters - sortedEntries.last.liters;
        if (totalFuelExcludingLast > 0) {
          overallMileage = totalDistance / totalFuelExcludingLast;
        }
      }
    }

    if (minMileage == double.infinity) {
      minMileage = 0.0;
    }

    return {
      'lastTripMileage': lastTripMileage,
      'overallMileage': overallMileage,
      'totalDistance': totalDistance,
      'maxMileage': maxMileage,
      'minMileage': minMileage,
    };
  }

  /// Calculate efficiency chart data using cumulative mileage
  static List<double> calculateEfficiencyChartData(List<FuelEntry> entries) {
    final sortedEntries = List<FuelEntry>.from(entries)
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));

    final chartData = <double>[];

    for (int i = 0; i < sortedEntries.length; i++) {
      if (i > 0) {
        double totalDistance = 0;
        for (int j = 1; j <= i; j++) {
          if (sortedEntries[j].odometerReading != null &&
              sortedEntries[j - 1].odometerReading != null) {
            final distance = sortedEntries[j].odometerReading! -
                           sortedEntries[j - 1].odometerReading!;
            if (distance > 0) {
              totalDistance += distance;
            }
          }
        }

        // Total fuel up to this point, minus last entry (not yet consumed)
        double totalFuel = 0;
        for (int j = 0; j <= i; j++) {
          totalFuel += sortedEntries[j].liters;
        }
        final totalFuelMinusLast = totalFuel - sortedEntries[i].liters;

        final mileage = totalFuelMinusLast > 0 ? totalDistance / totalFuelMinusLast : 0.0;
        chartData.add(mileage);
      } else {
        chartData.add(0);
      }
    }

    return chartData;
  }

  /// Calculate total distance from all entries
  static double calculateTotalDistance(List<FuelEntry> entries) {
    final sortedEntries = List<FuelEntry>.from(entries)
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));
    
    double totalDistance = 0.0;
    
    for (int i = 1; i < sortedEntries.length; i++) {
      if (sortedEntries[i].odometerReading != null && 
          sortedEntries[i - 1].odometerReading != null) {
        final distance = sortedEntries[i].odometerReading! - 
                        sortedEntries[i - 1].odometerReading!;
        if (distance > 0) {
          totalDistance += distance;
        }
      }
    }
    
    return totalDistance;
  }

  /// Totals quantity per unit. Adding liters to kWh is meaningless, so any
  /// screen aggregating across vehicles must group rather than sum.
  static Map<FuelUnit, double> quantityByUnit(
    List<FuelEntry> entries,
    FuelUnitResolver resolver,
  ) {
    final totals = <FuelUnit, double>{};
    for (final entry in entries) {
      final unit = resolver.unitFor(entry.id);
      totals[unit] = (totals[unit] ?? 0) + entry.liters;
    }
    return totals;
  }

  /// True when [entries] span more than one unit, in which case a single
  /// quantity total or efficiency figure would be fabricated.
  static bool hasMixedUnits(
    List<FuelEntry> entries,
    FuelUnitResolver resolver,
  ) =>
      resolver.unitsIn(entries).length > 1;

  /// All-in running cost per km: fuel **and** maintenance over the distance
  /// covered. Fuel-only cost/km understates what a vehicle actually costs to
  /// run, which is what the vehicle comparison used to show.
  ///
  /// Returns 0 when no distance has been recorded, and is identical to the
  /// fuel-only figure when there is no maintenance.
  static double runningCostPerKm({
    required double fuelCost,
    required double maintenanceCost,
    required double distance,
  }) {
    if (distance <= 0) return 0.0;
    return (fuelCost + maintenanceCost) / distance;
  }

  /// Renders a per-unit breakdown, e.g. `120.5 L · 340.0 kWh`.
  static String formatQuantityByUnit(Map<FuelUnit, double> totals) {
    if (totals.isEmpty) return '0';
    final parts = totals.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return parts
        .map((e) => '${e.value.toStringAsFixed(1)} ${e.key.short}')
        .join(' · ');
  }
}
