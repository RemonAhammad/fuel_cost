import 'package:flutter/foundation.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fuel_storage_service.dart';
import 'vehicle_service.dart';

/// Decides when to ask the user for a store rating, and performs the ask.
///
/// A user qualifies once a *single* vehicle has [minEntriesPerVehicle] fuel
/// entries — 5 entries spread over 5 vehicles is not a habit, 5 on one is.
class ReviewService {
  static const String _doneKey = 'review_prompt_done';
  static const String _snoozeUntilKey = 'review_prompt_snooze_until';
  static const String _askCountKey = 'review_prompt_ask_count';

  static const int minEntriesPerVehicle = 5;
  static const int maxAsks = 3;
  static const Duration snoozeDuration = Duration(days: 30);

  // ─── Eligibility ───

  /// Pure form of the eligibility rule — no storage calls, so the counting
  /// rules stay unit-testable without Isar or SharedPreferences.
  ///
  /// Mappings are filtered against [liveEntryIds] and [existingVehicleIds]
  /// because `entry_vehicle_map` is not self-cleaning: clearing fuel entries
  /// or deleting a vehicle both leave stale mappings behind, and counting
  /// those would make a user who just erased everything look eligible.
  static bool meetsEntryThreshold({
    required Set<String> liveEntryIds,
    required Set<String> existingVehicleIds,
    required Map<String, String> entryVehicleMap,
    int threshold = minEntriesPerVehicle,
  }) {
    final counts = <String, int>{};
    for (final mapping in entryVehicleMap.entries) {
      if (!liveEntryIds.contains(mapping.key)) continue;
      if (!existingVehicleIds.contains(mapping.value)) continue;
      final count = (counts[mapping.value] ?? 0) + 1;
      if (count >= threshold) return true;
      counts[mapping.value] = count;
    }
    return false;
  }

  /// Whether the prompt should be shown right now.
  static Future<bool> isEligible() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getBool(_doneKey) ?? false) return false;
    if ((prefs.getInt(_askCountKey) ?? 0) >= maxAsks) return false;

    final snoozeUntil = prefs.getInt(_snoozeUntilKey);
    if (snoozeUntil != null &&
        DateTime.now().millisecondsSinceEpoch < snoozeUntil) {
      return false;
    }

    final entries = await FuelStorageService.getFuelEntries();
    final vehicles = await VehicleService.getVehicles();
    final entryVehicleMap = await VehicleService.getEntryVehicleMap();

    return meetsEntryThreshold(
      liveEntryIds: entries.map((e) => e.id).toSet(),
      existingVehicleIds: vehicles.map((v) => v.id).toSet(),
      entryVehicleMap: entryVehicleMap,
    );
  }

  // ─── Outcome recording ───

  /// The user went through the rating flow — never ask again.
  static Future<void> markRated() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_doneKey, true);
  }

  /// The user opted out — never ask again.
  static Future<void> markDeclined() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_doneKey, true);
  }

  /// The user deferred — back off for [snoozeDuration] and count the ask.
  static Future<void> markSnoozed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_askCountKey, (prefs.getInt(_askCountKey) ?? 0) + 1);
    await prefs.setInt(
      _snoozeUntilKey,
      DateTime.now().add(snoozeDuration).millisecondsSinceEpoch,
    );
  }

  // ─── The ask itself ───

  /// Show the platform review sheet, falling back to the store listing.
  ///
  /// On Android this is a silent no-op unless the build was installed from
  /// Play, and Play also enforces an undisclosed quota — neither case is an
  /// error, so failures are logged rather than surfaced.
  ///
  /// The listing fallback needs an `appStoreId` on iOS — pass one here once
  /// the app has an App Store listing.
  static Future<void> requestReview() async {
    final inAppReview = InAppReview.instance;
    try {
      if (await inAppReview.isAvailable()) {
        await inAppReview.requestReview();
      } else {
        await inAppReview.openStoreListing();
      }
    } catch (e) {
      debugPrint('In-app review request failed: $e');
    }
  }
}
