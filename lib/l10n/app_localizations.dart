import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Fuel Cost'**
  String get appTitle;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get commonSave;

  /// No description provided for @commonDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get commonDelete;

  /// No description provided for @commonEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get commonEdit;

  /// No description provided for @commonClear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get commonClear;

  /// No description provided for @commonAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get commonAll;

  /// No description provided for @commonNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get commonNotAvailable;

  /// No description provided for @commonNotSet.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get commonNotSet;

  /// No description provided for @homeTotalCost.
  ///
  /// In en, this message translates to:
  /// **'Total Cost'**
  String get homeTotalCost;

  /// No description provided for @homeTotalFuels.
  ///
  /// In en, this message translates to:
  /// **'Total Fuels'**
  String get homeTotalFuels;

  /// No description provided for @homeTotalDistance.
  ///
  /// In en, this message translates to:
  /// **'Total Distance'**
  String get homeTotalDistance;

  /// No description provided for @homeTotalOf.
  ///
  /// In en, this message translates to:
  /// **'Total {unit}'**
  String homeTotalOf(String unit);

  /// No description provided for @homeLastTripMileage.
  ///
  /// In en, this message translates to:
  /// **'Last Trip Mileage'**
  String get homeLastTripMileage;

  /// No description provided for @homeOverallMileage.
  ///
  /// In en, this message translates to:
  /// **'Overall Mileage'**
  String get homeOverallMileage;

  /// No description provided for @homeMaxMileage.
  ///
  /// In en, this message translates to:
  /// **'Max Mileage'**
  String get homeMaxMileage;

  /// No description provided for @homeMinMileage.
  ///
  /// In en, this message translates to:
  /// **'Min Mileage'**
  String get homeMinMileage;

  /// No description provided for @homeThisMonth.
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get homeThisMonth;

  /// No description provided for @homeAddFuel.
  ///
  /// In en, this message translates to:
  /// **'Add Fuel'**
  String get homeAddFuel;

  /// No description provided for @homeHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get homeHistory;

  /// No description provided for @homeSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get homeSettings;

  /// No description provided for @addFuelTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Fuel Entry'**
  String get addFuelTitle;

  /// No description provided for @addFuelEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Fuel Entry'**
  String get addFuelEditTitle;

  /// No description provided for @addFuelAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Fuel Amount ({unit})'**
  String addFuelAmountLabel(String unit);

  /// No description provided for @addFuelChargeAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Charge Amount ({unit})'**
  String addFuelChargeAmountLabel(String unit);

  /// No description provided for @addFuelPricePerUnit.
  ///
  /// In en, this message translates to:
  /// **'Price per {unit}'**
  String addFuelPricePerUnit(String unit);

  /// No description provided for @addFuelOdometer.
  ///
  /// In en, this message translates to:
  /// **'Odometer Reading'**
  String get addFuelOdometer;

  /// No description provided for @addFuelVehicle.
  ///
  /// In en, this message translates to:
  /// **'Vehicle'**
  String get addFuelVehicle;

  /// No description provided for @addFuelFuelType.
  ///
  /// In en, this message translates to:
  /// **'Fuel Type'**
  String get addFuelFuelType;

  /// No description provided for @addFuelPetrol.
  ///
  /// In en, this message translates to:
  /// **'Petrol'**
  String get addFuelPetrol;

  /// No description provided for @addFuelCharge.
  ///
  /// In en, this message translates to:
  /// **'Charge'**
  String get addFuelCharge;

  /// No description provided for @addFuelSelectVehicle.
  ///
  /// In en, this message translates to:
  /// **'Please select a vehicle'**
  String get addFuelSelectVehicle;

  /// No description provided for @addFuelSaved.
  ///
  /// In en, this message translates to:
  /// **'Fuel entry saved successfully!'**
  String get addFuelSaved;

  /// No description provided for @addFuelUpdated.
  ///
  /// In en, this message translates to:
  /// **'Fuel entry updated!'**
  String get addFuelUpdated;

  /// No description provided for @addFuelLastRecorded.
  ///
  /// In en, this message translates to:
  /// **'Last recorded: {value} km'**
  String addFuelLastRecorded(String value);

  /// No description provided for @historyTitle.
  ///
  /// In en, this message translates to:
  /// **'Fuel History'**
  String get historyTitle;

  /// No description provided for @historyRecentEntries.
  ///
  /// In en, this message translates to:
  /// **'Recent Entries'**
  String get historyRecentEntries;

  /// No description provided for @historySearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search amount, odometer or vehicle'**
  String get historySearchHint;

  /// No description provided for @historyExportTooltip.
  ///
  /// In en, this message translates to:
  /// **'Export these entries'**
  String get historyExportTooltip;

  /// No description provided for @historyEntryCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 entry} other{{count} entries}}'**
  String historyEntryCount(int count);

  /// No description provided for @historyFilteredCount.
  ///
  /// In en, this message translates to:
  /// **'{shown} of {total} entries'**
  String historyFilteredCount(int shown, int total);

  /// No description provided for @historyExported.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 entry exported} other{{count} entries exported}}'**
  String historyExported(int count);

  /// No description provided for @historyNoEntriesYet.
  ///
  /// In en, this message translates to:
  /// **'No fuel entries yet'**
  String get historyNoEntriesYet;

  /// No description provided for @historyNoMatches.
  ///
  /// In en, this message translates to:
  /// **'No entries match your filters'**
  String get historyNoMatches;

  /// No description provided for @historyNoEntriesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add your first fuel entry to start\ntracking your fuel costs!'**
  String get historyNoEntriesSubtitle;

  /// No description provided for @historyNoMatchesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Try a wider date range, or clear your filters'**
  String get historyNoMatchesSubtitle;

  /// No description provided for @dateAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get dateAll;

  /// No description provided for @dateThisMonth.
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get dateThisMonth;

  /// No description provided for @dateLastThreeMonths.
  ///
  /// In en, this message translates to:
  /// **'Last 3 Months'**
  String get dateLastThreeMonths;

  /// No description provided for @dateThisYear.
  ///
  /// In en, this message translates to:
  /// **'This Year'**
  String get dateThisYear;

  /// No description provided for @dateCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get dateCustom;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsCurrency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get settingsCurrency;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsLanguageSystem.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get settingsLanguageSystem;

  /// No description provided for @settingsTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// No description provided for @settingsMonthlyBudget.
  ///
  /// In en, this message translates to:
  /// **'Monthly Budget'**
  String get settingsMonthlyBudget;

  /// No description provided for @settingsBudgetPerMonth.
  ///
  /// In en, this message translates to:
  /// **'{amount} per month'**
  String settingsBudgetPerMonth(String amount);

  /// No description provided for @settingsBackupToDrive.
  ///
  /// In en, this message translates to:
  /// **'Backup to Google Drive'**
  String get settingsBackupToDrive;

  /// No description provided for @settingsRestoreFromDrive.
  ///
  /// In en, this message translates to:
  /// **'Restore from Google Drive'**
  String get settingsRestoreFromDrive;

  /// No description provided for @settingsExportCsv.
  ///
  /// In en, this message translates to:
  /// **'Export CSV'**
  String get settingsExportCsv;

  /// No description provided for @settingsImportCsv.
  ///
  /// In en, this message translates to:
  /// **'Import CSV'**
  String get settingsImportCsv;

  /// No description provided for @settingsReplayTutorial.
  ///
  /// In en, this message translates to:
  /// **'Replay Tutorial'**
  String get settingsReplayTutorial;

  /// No description provided for @settingsVersion.
  ///
  /// In en, this message translates to:
  /// **'Version {version} (Build {build})'**
  String settingsVersion(String version, String build);

  /// No description provided for @settingsRestoreCancelled.
  ///
  /// In en, this message translates to:
  /// **'Restore cancelled'**
  String get settingsRestoreCancelled;

  /// No description provided for @settingsBackupSuccess.
  ///
  /// In en, this message translates to:
  /// **'Backup successful!'**
  String get settingsBackupSuccess;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['bn', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
