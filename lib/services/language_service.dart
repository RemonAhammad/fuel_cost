import 'package:shared_preferences/shared_preferences.dart';

/// Persists the user's language choice.
///
/// A null value means "follow the device", which is the default and what every
/// install had before languages existed.
class LanguageService {
  static const String _languageKey = 'app_language';

  /// Locales the app ships translations for.
  static const List<String> supportedCodes = ['en', 'bn'];

  static const Map<String, String> languageNames = {
    'en': 'English',
    'bn': 'বাংলা',
  };

  /// Stored code, or null when following the device. Also the raw getter the
  /// backup restore needs to tell "never set" from "set to English".
  static Future<String?> getLanguageCode() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_languageKey);
    if (code == null || !supportedCodes.contains(code)) return null;
    return code;
  }

  /// Pass null to follow the device.
  static Future<void> setLanguageCode(String? code) async {
    final prefs = await SharedPreferences.getInstance();
    if (code == null) {
      await prefs.remove(_languageKey);
    } else {
      await prefs.setString(_languageKey, code);
    }
  }

  static String displayName(String? code) =>
      code == null ? 'System default' : (languageNames[code] ?? code);
}
