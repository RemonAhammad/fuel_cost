import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Fails when a user-facing string is written directly into a widget instead of
/// going through `AppLocalizations`.
///
/// This exists because localization was previously done by hand-listing
/// substitutions per screen, which has no completeness check — anything missed
/// kept rendering in English and nobody noticed until the app was opened. This
/// turns "fully localized" into something the suite verifies.
void main() {
  // A quoted literal, allowing escaped characters inside.
  const literal = r"\s*'((?:[^'\\]|\\.)*)'";

  // Widget parameters whose value is shown to the user.
  const params = r"(?:\bText\(\s*"
      r"|\b(?:label|labelText|title|subtitle|hintText|hint|helperText"
      r"|tooltip|message|confirmText|description|errorText|semanticLabel"
      r"|prefixText|suffixText)\s*:\s*)";

  // Literals returned from a String helper or picked by a ternary. This is
  // where the chart titles and 'Total Fuel' hid from the first pass.
  const flowing = r"(?:\breturn\s+|\?\s*|:\s*)";

  /// Applied to every file.
  final widgetParams = RegExp(params + literal, dotAll: true);

  /// Applied only to widget code — services legitimately return API constants.
  final widgetParamsAndFlow =
      RegExp('(?:$params|$flowing)$literal', dotAll: true);

  /// Values that are not prose: stored ids, identifiers, format patterns,
  /// units, symbols, API field specs.
  final notUserFacing = RegExp(
    "^(?:" r"""[\d\s.,:/%+\-*×÷()\[\]{}<>|#@&_='"]*"""
    r"|[a-z][A-Za-z0-9_]*"
    r"|files\(.*\)"
    r"|(?:MMM|MMMM|yyyy|HH|dd|d|y|EEE|w)[\sa-zA-Z,:'\-/]*"
    r"|\s*\$.*"
    r"|.*\.(?:png|jpg|svg|csv|json|dart)"
    r"|[A-Z]{2,4}"
    r"|km|kWh|L|kg|m3|N/A)$",
  );

  final hasLetters = RegExp(r'[A-Za-z]{2}');
  final lineComment = RegExp(r'//[^\n]*');

  List<String> flag(String source, RegExp pattern) => pattern
      .allMatches(source)
      .map((m) => m.group(1)!)
      .where((v) => !notUserFacing.hasMatch(v) && hasLetters.hasMatch(v))
      .toList();

  test('no user-facing string is hardcoded outside the ARB files', () {
    final offenders = <String>[];

    for (final file in Directory('lib').listSync(recursive: true)) {
      if (file is! File || !file.path.endsWith('.dart')) continue;
      // Generated localizations and Isar output are not hand-written UI.
      if (file.path.contains('/l10n/') || file.path.endsWith('.g.dart')) {
        continue;
      }

      final isWidgetCode =
          file.path.contains('/screens/') || file.path.contains('/widgets/');
      final source = file.readAsStringSync().replaceAll(lineComment, '');

      for (final value
          in flag(source, isWidgetCode ? widgetParamsAndFlow : widgetParams)) {
        offenders.add('${file.path}: "$value"');
      }
    }

    expect(
      offenders,
      isEmpty,
      reason: 'Route these through AppLocalizations:\n${offenders.join('\n')}',
    );
  });

  test('the detector actually catches a hardcoded string', () {
    // A guard that cannot fail is worthless, so prove it fires on known-bad
    // input and stays quiet on the legitimate exclusions.
    const bad = '''
      Text('Total Cost'),
      TextField(decoration: InputDecoration(labelText: 'Vehicle Name')),
      String label() { return 'Fuel Trend'; }
      final t = mixed ? 'Total Fuel' : 'Total Liters';
    ''';
    const good = '''
      Text(AppLocalizations.of(context).commonTotalCost),
      DateFormat('MMM dd, yyyy'),
      prefs.getString('selected_currency'),
      spaces: 'appDataFolder',
    ''';

    expect(
      flag(bad, widgetParamsAndFlow),
      containsAll(['Total Cost', 'Vehicle Name', 'Fuel Trend', 'Total Fuel']),
    );
    expect(flag(good, widgetParamsAndFlow), isEmpty);
  });
}
