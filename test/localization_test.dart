import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fuel_cost/services/language_service.dart';

Map<String, dynamic> arb(String code) =>
    jsonDecode(File('lib/l10n/app_$code.arb').readAsStringSync());

List<String> keysOf(Map<String, dynamic> m) =>
    m.keys.where((k) => !k.startsWith('@')).toList();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ARB completeness', () {
    final en = arb('en');
    final enKeys = keysOf(en).toSet();

    test('every supported code has an ARB file', () {
      for (final code in LanguageService.supportedCodes) {
        expect(File('lib/l10n/app_$code.arb').existsSync(), isTrue,
            reason: 'missing app_$code.arb');
      }
    });

    test('every language translates every key', () {
      for (final code in LanguageService.supportedCodes) {
        final keys = keysOf(arb(code)).toSet();
        expect(enKeys.difference(keys), isEmpty,
            reason: '$code is missing keys');
      }
    });

    test('no language carries keys English does not have', () {
      // A stray key is dead weight and usually a typo.
      for (final code in LanguageService.supportedCodes) {
        final keys = keysOf(arb(code)).toSet();
        expect(keys.difference(enKeys), isEmpty,
            reason: '$code has unknown keys');
      }
    });

    test('placeholders match English in every language', () {
      final placeholder = RegExp(r'\{(\w+)\}');
      for (final code in LanguageService.supportedCodes) {
        final other = arb(code);
        for (final key in enKeys) {
          final want = placeholder
              .allMatches(en[key] as String)
              .map((m) => m.group(1))
              .where((p) => p != 'count')
              .toSet();
          final got = placeholder
              .allMatches(other[key] as String)
              .map((m) => m.group(1))
              .where((p) => p != 'count')
              .toSet();
          expect(got, want, reason: '$code/$key placeholder mismatch');
        }
      }
    });

    test('the app name is never translated', () {
      // "Fuel Cost" is a brand, not prose. Strings that mention it use an
      // {app} placeholder so the surrounding text stays translated while the
      // name itself is injected verbatim.
      for (final code in LanguageService.supportedCodes) {
        expect(arb(code)['appTitle'], 'Fuel Cost',
            reason: '$code translated the app name');
        for (final key in ['howToWelcome', 'rateTitle', 'settingsRateSubtitle']) {
          expect(arb(code)[key], contains('{app}'),
              reason: '$code/$key should reference the brand by placeholder');
        }
      }
    });

    test('Arabic supplies the plural categories its grammar needs', () {
      // Arabic has six ICU categories; two would render counts wrongly.
      final ar = arb('ar');
      for (final key in ['historyEntryCount', 'historyExported', 'restoreConflictCount']) {
        final value = ar[key] as String;
        expect(value, contains('plural'));
        for (final cat in ['zero', 'one', 'two', 'few', 'many', 'other']) {
          expect(value, contains('$cat{'), reason: 'ar/$key lacks "$cat"');
        }
      }
    });
  });

  group('LanguageService', () {
    test('null means follow the device', () async {
      SharedPreferences.setMockInitialValues({});
      expect(await LanguageService.getLanguageCode(), isNull);
    });

    test('round-trips a stored code', () async {
      SharedPreferences.setMockInitialValues({});
      await LanguageService.setLanguageCode('ar');
      expect(await LanguageService.getLanguageCode(), 'ar');
    });

    test('clearing returns to the device language', () async {
      SharedPreferences.setMockInitialValues({'app_language': 'fr'});
      await LanguageService.setLanguageCode(null);
      expect(await LanguageService.getLanguageCode(), isNull);
    });

    test('an unsupported stored code degrades to the device language', () async {
      // Guards against a stale value left by a build that dropped a locale.
      SharedPreferences.setMockInitialValues({'app_language': 'kl'});
      expect(await LanguageService.getLanguageCode(), isNull);
    });

    test('names every supported language in its own script', () {
      for (final code in LanguageService.supportedCodes) {
        expect(LanguageService.languageNames[code], isNotNull,
            reason: 'no endonym for $code');
      }
      expect(LanguageService.languageNames['ar'], 'العربية');
      expect(LanguageService.languageNames['bn'], 'বাংলা');
    });

    test('flags exactly the right-to-left locales', () {
      expect(LanguageService.isRtl('ar'), isTrue);
      expect(LanguageService.isRtl('fa'), isTrue);
      expect(LanguageService.isRtl('en'), isFalse);
      expect(LanguageService.isRtl(null), isFalse);
    });
  });
}
