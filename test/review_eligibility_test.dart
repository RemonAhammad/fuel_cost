import 'package:flutter_test/flutter_test.dart';
import 'package:fuel_cost/services/review_service.dart';

/// Builds an `entryId -> vehicleId` map assigning [count] entries to
/// [vehicleId], with ids prefixed so calls can be combined without collisions.
Map<String, String> mappings(String vehicleId, int count) => {
      for (var i = 0; i < count; i++) '$vehicleId-entry-$i': vehicleId,
    };

bool eligible({
  required Map<String, String> entryVehicleMap,
  Set<String>? liveEntryIds,
  Set<String>? existingVehicleIds,
}) =>
    ReviewService.meetsEntryThreshold(
      liveEntryIds: liveEntryIds ?? entryVehicleMap.keys.toSet(),
      existingVehicleIds:
          existingVehicleIds ?? entryVehicleMap.values.toSet(),
      entryVehicleMap: entryVehicleMap,
    );

void main() {
  group('ReviewService.meetsEntryThreshold', () {
    test('four entries on one vehicle is not enough', () {
      expect(eligible(entryVehicleMap: mappings('car', 4)), isFalse);
    });

    test('five entries on one vehicle qualifies', () {
      expect(eligible(entryVehicleMap: mappings('car', 5)), isTrue);
    });

    test('the threshold is per vehicle, not app-wide', () {
      // Eight entries in total, but neither vehicle reaches five on its own.
      final map = {...mappings('car', 4), ...mappings('bike', 4)};
      expect(map.length, 8);
      expect(eligible(entryVehicleMap: map), isFalse);
    });

    test('one qualifying vehicle among several is enough', () {
      final map = {...mappings('car', 5), ...mappings('bike', 1)};
      expect(eligible(entryVehicleMap: map), isTrue);
    });

    test('mappings left behind by a cleared database do not count', () {
      // clearFuelEntries() wipes Isar but leaves entry_vehicle_map intact.
      expect(
        eligible(entryVehicleMap: mappings('car', 6), liveEntryIds: {}),
        isFalse,
      );
    });

    test('mappings to a deleted vehicle do not count', () {
      // deleteVehicle() does not clean up the entries mapped to it.
      expect(
        eligible(
          entryVehicleMap: mappings('car', 5),
          existingVehicleIds: {'bike'},
        ),
        isFalse,
      );
    });

    test('unmapped entries count toward no vehicle', () {
      // Four mapped entries plus live-but-unassigned ones stays under the bar.
      expect(
        eligible(
          entryVehicleMap: mappings('car', 4),
          liveEntryIds: {...mappings('car', 4).keys, 'loose-1', 'loose-2'},
        ),
        isFalse,
      );
    });

    test('an empty map is never eligible', () {
      expect(eligible(entryVehicleMap: {}), isFalse);
    });

    test('threshold is configurable', () {
      expect(
        ReviewService.meetsEntryThreshold(
          liveEntryIds: mappings('car', 3).keys.toSet(),
          existingVehicleIds: {'car'},
          entryVehicleMap: mappings('car', 3),
          threshold: 3,
        ),
        isTrue,
      );
    });
  });
}
