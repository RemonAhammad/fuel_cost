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
  /// Widget parameters whose string values are shown to the user.
  final uiString = RegExp(
    r'''(?:\bText\(\s*|\b(?:label|labelText|title|subtitle|hintText|hint|helperText'''
    r'''|tooltip|message|confirmText|description|errorText|semanticLabel'''
    r'''|prefixText|suffixText)\s*:\s*)\s*'((?:[^'\\]|\\.)*)' ''' .trimRight(),
    dotAll: true,
  );

  /// Values that are not prose: stored ids, format patterns, units, symbols.
  final notUserFacing = RegExp(
    r'''^(?:[\d\s.,:/%+\-*×÷()\[\]{}<>|#@&_='"]*'''
    r'''|[a-z][a-z0-9_]*'''
    r'''|(?:MMM|MMMM|yyyy|HH|dd|d|y|EEE|w)[\sa-zA-Z,:'\-/]*'''
    r'''|\$.*'''
    r'''|.*\.(?:png|jpg|svg|csv|json|dart)'''
    r'''|[A-Z]{2,4}'''
    r'''|km|kWh|L|kg|m3|N/A)$''',
  );

  final hasLetters = RegExp(r'[A-Za-z]{2}');
  final lineComment = RegExp(r'//[^\n]*');

  test('no user-facing string is hardcoded outside the ARB files', () {
    final offenders = <String>[];

    for (final file in Directory('lib').listSync(recursive: true)) {
      if (file is! File || !file.path.endsWith('.dart')) continue;
      // Generated localizations and Isar output are not hand-written UI.
      if (file.path.contains('/l10n/') || file.path.endsWith('.g.dart')) continue;

      final source = file.readAsStringSync().replaceAll(lineComment, '');
      for (final match in uiString.allMatches(source)) {
        final value = match.group(1)!;
        if (notUserFacing.hasMatch(value)) continue;
        if (!hasLetters.hasMatch(value)) continue;
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
    ''';
    const good = '''
      Text(AppLocalizations.of(context).commonTotalCost),
      DateFormat('MMM dd, yyyy'),
      prefs.getString('selected_currency'),
    ''';

    List<String> flag(String source) => uiString
        .allMatches(source)
        .map((m) => m.group(1)!)
        .where((v) => !notUserFacing.hasMatch(v) && hasLetters.hasMatch(v))
        .toList();

    expect(flag(bad), containsAll(['Total Cost', 'Vehicle Name']));
    expect(flag(good), isEmpty);
  });
}
