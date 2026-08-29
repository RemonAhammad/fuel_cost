import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/language_service.dart';

/// Active locale, or null to follow the device.
///
/// Plain Riverpod (no code-gen), matching the convention for providers added
/// after the original two.
class LanguageNotifier extends StateNotifier<Locale?> {
  LanguageNotifier() : super(null) {
    _load();
  }

  Future<void> _load() async {
    final code = await LanguageService.getLanguageCode();
    state = code == null ? null : Locale(code);
  }

  Future<void> setLanguage(String? code) async {
    await LanguageService.setLanguageCode(code);
    state = code == null ? null : Locale(code);
  }

  /// Re-reads the stored language. Called after a restore writes one.
  Future<void> reload() => _load();
}

final languageProvider =
    StateNotifierProvider<LanguageNotifier, Locale?>((ref) {
  return LanguageNotifier();
});
