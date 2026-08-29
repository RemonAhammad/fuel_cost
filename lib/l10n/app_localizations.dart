import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_pt.dart';

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
    Locale('ar'),
    Locale('bn'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('fr'),
    Locale('pt'),
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

  /// No description provided for @commonAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get commonAdd;

  /// No description provided for @commonUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get commonUpdate;

  /// No description provided for @commonRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get commonRemove;

  /// No description provided for @commonOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get commonOther;

  /// No description provided for @commonError.
  ///
  /// In en, this message translates to:
  /// **'Error: {message}'**
  String commonError(String message);

  /// No description provided for @commonNoData.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get commonNoData;

  /// No description provided for @commonTotalCost.
  ///
  /// In en, this message translates to:
  /// **'Total Cost'**
  String get commonTotalCost;

  /// No description provided for @commonDistance.
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get commonDistance;

  /// No description provided for @commonMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get commonMonth;

  /// No description provided for @commonLiters.
  ///
  /// In en, this message translates to:
  /// **'Liters'**
  String get commonLiters;

  /// No description provided for @splashTagline.
  ///
  /// In en, this message translates to:
  /// **'TRACK  •  CALCULATE  •  SAVE'**
  String get splashTagline;

  /// No description provided for @splashLoading.
  ///
  /// In en, this message translates to:
  /// **'Starting your journey…'**
  String get splashLoading;

  /// No description provided for @splashTrackFuel.
  ///
  /// In en, this message translates to:
  /// **'Track Fuel'**
  String get splashTrackFuel;

  /// No description provided for @splashDriveSmart.
  ///
  /// In en, this message translates to:
  /// **'Drive Smart'**
  String get splashDriveSmart;

  /// No description provided for @splashSaveMoney.
  ///
  /// In en, this message translates to:
  /// **'Save Money'**
  String get splashSaveMoney;

  /// No description provided for @onboardingSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboardingGetStarted;

  /// No description provided for @onboardingTrackTitle.
  ///
  /// In en, this message translates to:
  /// **'Track Every Fill-Up'**
  String get onboardingTrackTitle;

  /// No description provided for @onboardingTrackBody.
  ///
  /// In en, this message translates to:
  /// **'Log your fuel purchases with liters, price, and odometer readings. Never lose track of your fuel expenses again.'**
  String get onboardingTrackBody;

  /// No description provided for @onboardingVehiclesTitle.
  ///
  /// In en, this message translates to:
  /// **'Multiple Vehicles'**
  String get onboardingVehiclesTitle;

  /// No description provided for @onboardingVehiclesBody.
  ///
  /// In en, this message translates to:
  /// **'Manage your car, bike, truck, or any vehicle separately. Switch between them anytime to see individual stats.'**
  String get onboardingVehiclesBody;

  /// No description provided for @onboardingMileageTitle.
  ///
  /// In en, this message translates to:
  /// **'Smart Mileage Calculation'**
  String get onboardingMileageTitle;

  /// No description provided for @onboardingMileageBody.
  ///
  /// In en, this message translates to:
  /// **'We automatically calculate your fuel efficiency from your odometer readings. See trends over time.'**
  String get onboardingMileageBody;

  /// No description provided for @onboardingBudgetTitle.
  ///
  /// In en, this message translates to:
  /// **'Budget & Reports'**
  String get onboardingBudgetTitle;

  /// No description provided for @onboardingBudgetBody.
  ///
  /// In en, this message translates to:
  /// **'Set a monthly fuel budget and visualize your spending with beautiful charts. Stay in control of your costs.'**
  String get onboardingBudgetBody;

  /// No description provided for @onboardingBackupTitle.
  ///
  /// In en, this message translates to:
  /// **'Backup to Cloud'**
  String get onboardingBackupTitle;

  /// No description provided for @onboardingBackupBody.
  ///
  /// In en, this message translates to:
  /// **'Sync your data securely to Google Drive. Restore anytime on any device — your fuel history is always safe.'**
  String get onboardingBackupBody;

  /// No description provided for @tripTitle.
  ///
  /// In en, this message translates to:
  /// **'Trip Cost Calculator'**
  String get tripTitle;

  /// No description provided for @tripSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Estimate your trip fuel cost'**
  String get tripSubtitle;

  /// No description provided for @tripDetails.
  ///
  /// In en, this message translates to:
  /// **'Trip Details'**
  String get tripDetails;

  /// No description provided for @tripDistanceLabel.
  ///
  /// In en, this message translates to:
  /// **'Trip Distance (km)'**
  String get tripDistanceLabel;

  /// No description provided for @tripRoundTrip.
  ///
  /// In en, this message translates to:
  /// **'Round Trip'**
  String get tripRoundTrip;

  /// No description provided for @tripUseCustomMileage.
  ///
  /// In en, this message translates to:
  /// **'Use custom mileage'**
  String get tripUseCustomMileage;

  /// No description provided for @tripUseCustomPrice.
  ///
  /// In en, this message translates to:
  /// **'Use custom fuel price'**
  String get tripUseCustomPrice;

  /// No description provided for @tripMileageLabel.
  ///
  /// In en, this message translates to:
  /// **'Mileage ({unit})'**
  String tripMileageLabel(String unit);

  /// No description provided for @tripFuelPriceLabel.
  ///
  /// In en, this message translates to:
  /// **'Fuel Price ({currency}/{unit})'**
  String tripFuelPriceLabel(String currency, String unit);

  /// No description provided for @tripEstimate.
  ///
  /// In en, this message translates to:
  /// **'Trip Estimate'**
  String get tripEstimate;

  /// No description provided for @tripEstimatedTotal.
  ///
  /// In en, this message translates to:
  /// **'Estimated Total Cost'**
  String get tripEstimatedTotal;

  /// No description provided for @tripFuelNeeded.
  ///
  /// In en, this message translates to:
  /// **'Fuel Needed'**
  String get tripFuelNeeded;

  /// No description provided for @tripChargeNeeded.
  ///
  /// In en, this message translates to:
  /// **'Charge Needed'**
  String get tripChargeNeeded;

  /// No description provided for @tripMileageUsed.
  ///
  /// In en, this message translates to:
  /// **'Mileage Used'**
  String get tripMileageUsed;

  /// No description provided for @tripFuelPrice.
  ///
  /// In en, this message translates to:
  /// **'Fuel Price'**
  String get tripFuelPrice;

  /// No description provided for @tripCostPerKm.
  ///
  /// In en, this message translates to:
  /// **'Cost per km'**
  String get tripCostPerKm;

  /// No description provided for @tripEnterDistance.
  ///
  /// In en, this message translates to:
  /// **'Enter trip distance to calculate'**
  String get tripEnterDistance;

  /// No description provided for @tripNoPriceData.
  ///
  /// In en, this message translates to:
  /// **'No fuel price data available. Enter a custom price.'**
  String get tripNoPriceData;

  /// No description provided for @vehiclesTitle.
  ///
  /// In en, this message translates to:
  /// **'My Vehicles'**
  String get vehiclesTitle;

  /// No description provided for @vehiclesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage your vehicles'**
  String get vehiclesSubtitle;

  /// No description provided for @vehiclesAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Vehicle'**
  String get vehiclesAdd;

  /// No description provided for @vehiclesEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Vehicle'**
  String get vehiclesEdit;

  /// No description provided for @vehiclesDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete Vehicle'**
  String get vehiclesDelete;

  /// No description provided for @vehiclesNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Name'**
  String get vehiclesNameLabel;

  /// No description provided for @vehiclesTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Type'**
  String get vehiclesTypeLabel;

  /// No description provided for @vehiclesFuelTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Fuel Type'**
  String get vehiclesFuelTypeLabel;

  /// No description provided for @vehiclesSoldBy.
  ///
  /// In en, this message translates to:
  /// **'Sold By'**
  String get vehiclesSoldBy;

  /// No description provided for @vehiclesTankCapacity.
  ///
  /// In en, this message translates to:
  /// **'Tank Capacity ({unit}) - Optional'**
  String vehiclesTankCapacity(String unit);

  /// No description provided for @vehiclesBatteryCapacity.
  ///
  /// In en, this message translates to:
  /// **'Battery Capacity (kWh) - Optional'**
  String get vehiclesBatteryCapacity;

  /// No description provided for @vehiclesNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a vehicle name'**
  String get vehiclesNameRequired;

  /// No description provided for @vehiclesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No vehicles added yet'**
  String get vehiclesEmpty;

  /// No description provided for @vehiclesEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Tap + to add your first vehicle'**
  String get vehiclesEmptyHint;

  /// No description provided for @vehiclesTankSuffix.
  ///
  /// In en, this message translates to:
  /// **'{amount}{unit} tank'**
  String vehiclesTankSuffix(String amount, String unit);

  /// No description provided for @vehiclesBatterySuffix.
  ///
  /// In en, this message translates to:
  /// **'{amount}{unit} battery'**
  String vehiclesBatterySuffix(String amount, String unit);

  /// No description provided for @maintenanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Maintenance Log'**
  String get maintenanceTitle;

  /// No description provided for @maintenanceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track your vehicle services'**
  String get maintenanceSubtitle;

  /// No description provided for @maintenanceAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Service'**
  String get maintenanceAdd;

  /// No description provided for @maintenanceEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Service'**
  String get maintenanceEdit;

  /// No description provided for @maintenanceDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete Record'**
  String get maintenanceDelete;

  /// No description provided for @maintenanceDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{type}\"?'**
  String maintenanceDeleteConfirm(String type);

  /// No description provided for @maintenanceServiceType.
  ///
  /// In en, this message translates to:
  /// **'Service Type'**
  String get maintenanceServiceType;

  /// No description provided for @maintenanceVehicleRequired.
  ///
  /// In en, this message translates to:
  /// **'Vehicle *'**
  String get maintenanceVehicleRequired;

  /// No description provided for @maintenanceSelectVehicle.
  ///
  /// In en, this message translates to:
  /// **'Please select a vehicle'**
  String get maintenanceSelectVehicle;

  /// No description provided for @maintenanceCostLabel.
  ///
  /// In en, this message translates to:
  /// **'Cost ({currency})'**
  String maintenanceCostLabel(String currency);

  /// No description provided for @maintenanceDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get maintenanceDate;

  /// No description provided for @maintenanceNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get maintenanceNotes;

  /// No description provided for @maintenanceNotesHint.
  ///
  /// In en, this message translates to:
  /// **'Any additional notes...'**
  String get maintenanceNotesHint;

  /// No description provided for @maintenanceSummary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get maintenanceSummary;

  /// No description provided for @maintenanceRecords.
  ///
  /// In en, this message translates to:
  /// **'Records'**
  String get maintenanceRecords;

  /// No description provided for @maintenanceLastService.
  ///
  /// In en, this message translates to:
  /// **'Last Service'**
  String get maintenanceLastService;

  /// No description provided for @maintenanceEmpty.
  ///
  /// In en, this message translates to:
  /// **'No maintenance records yet'**
  String get maintenanceEmpty;

  /// No description provided for @maintenanceEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Tap + to add your first service record'**
  String get maintenanceEmptyHint;

  /// No description provided for @budgetTitle.
  ///
  /// In en, this message translates to:
  /// **'Budget & Reports'**
  String get budgetTitle;

  /// No description provided for @budgetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track your fuel spending'**
  String get budgetSubtitle;

  /// No description provided for @budgetSetTitle.
  ///
  /// In en, this message translates to:
  /// **'Set Monthly Budget'**
  String get budgetSetTitle;

  /// No description provided for @budgetSetAction.
  ///
  /// In en, this message translates to:
  /// **'Set Budget'**
  String get budgetSetAction;

  /// No description provided for @budgetRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove Budget'**
  String get budgetRemove;

  /// No description provided for @budgetAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Budget ({currency})'**
  String budgetAmountLabel(String currency);

  /// No description provided for @budgetSpent.
  ///
  /// In en, this message translates to:
  /// **'Spent'**
  String get budgetSpent;

  /// No description provided for @budgetAvgPerDay.
  ///
  /// In en, this message translates to:
  /// **'Avg/Day'**
  String get budgetAvgPerDay;

  /// No description provided for @budgetFills.
  ///
  /// In en, this message translates to:
  /// **'Fills'**
  String get budgetFills;

  /// No description provided for @budgetMonthlySpending.
  ///
  /// In en, this message translates to:
  /// **'Monthly Spending'**
  String get budgetMonthlySpending;

  /// No description provided for @budgetWeeklyBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Weekly Breakdown'**
  String get budgetWeeklyBreakdown;

  /// No description provided for @budgetMonthlyComparison.
  ///
  /// In en, this message translates to:
  /// **'Monthly Comparison'**
  String get budgetMonthlyComparison;

  /// No description provided for @budgetDayRange.
  ///
  /// In en, this message translates to:
  /// **'Day {range}'**
  String budgetDayRange(String range);

  /// No description provided for @budgetOverBy.
  ///
  /// In en, this message translates to:
  /// **'{amount} over budget'**
  String budgetOverBy(String amount);

  /// No description provided for @budgetRemaining.
  ///
  /// In en, this message translates to:
  /// **'{amount} remaining'**
  String budgetRemaining(String amount);

  /// No description provided for @spendingTitle.
  ///
  /// In en, this message translates to:
  /// **'Spending Comparison'**
  String get spendingTitle;

  /// No description provided for @spendingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Compare periods side by side'**
  String get spendingSubtitle;

  /// No description provided for @spendingDetailed.
  ///
  /// In en, this message translates to:
  /// **'Detailed Comparison'**
  String get spendingDetailed;

  /// No description provided for @spendingMetric.
  ///
  /// In en, this message translates to:
  /// **'Metric'**
  String get spendingMetric;

  /// No description provided for @spendingTotalSpent.
  ///
  /// In en, this message translates to:
  /// **'Total Spent'**
  String get spendingTotalSpent;

  /// No description provided for @spendingTotalLiters.
  ///
  /// In en, this message translates to:
  /// **'Total Liters'**
  String get spendingTotalLiters;

  /// No description provided for @spendingFillUps.
  ///
  /// In en, this message translates to:
  /// **'Fill-ups'**
  String get spendingFillUps;

  /// No description provided for @spendingAvgPerFill.
  ///
  /// In en, this message translates to:
  /// **'Avg/Fill'**
  String get spendingAvgPerFill;

  /// No description provided for @spendingSelectPeriod.
  ///
  /// In en, this message translates to:
  /// **'Select {label}'**
  String spendingSelectPeriod(String label);

  /// No description provided for @spendingPeriod.
  ///
  /// In en, this message translates to:
  /// **'Period {letter}'**
  String spendingPeriod(String letter);

  /// No description provided for @comparisonTitle.
  ///
  /// In en, this message translates to:
  /// **'Compare Vehicles'**
  String get comparisonTitle;

  /// No description provided for @comparisonNeedTwo.
  ///
  /// In en, this message translates to:
  /// **'Add at least 2 vehicles to compare'**
  String get comparisonNeedTwo;

  /// No description provided for @comparisonMaintenance.
  ///
  /// In en, this message translates to:
  /// **'Maintenance'**
  String get comparisonMaintenance;

  /// No description provided for @comparisonTotalFuel.
  ///
  /// In en, this message translates to:
  /// **'Total Fuel'**
  String get comparisonTotalFuel;

  /// No description provided for @comparisonFillUps.
  ///
  /// In en, this message translates to:
  /// **'Fill-ups'**
  String get comparisonFillUps;

  /// No description provided for @comparisonEfficiency.
  ///
  /// In en, this message translates to:
  /// **'Efficiency'**
  String get comparisonEfficiency;

  /// No description provided for @comparisonCostPerKmAllIn.
  ///
  /// In en, this message translates to:
  /// **'Cost per km · all-in'**
  String get comparisonCostPerKmAllIn;

  /// No description provided for @comparisonCostPerKmNote.
  ///
  /// In en, this message translates to:
  /// **'fuel + maintenance ÷ distance'**
  String get comparisonCostPerKmNote;

  /// No description provided for @comparisonCostPerKmShort.
  ///
  /// In en, this message translates to:
  /// **'Cost/km'**
  String get comparisonCostPerKmShort;

  /// No description provided for @comparisonMixedUnits.
  ///
  /// In en, this message translates to:
  /// **'These vehicles use different units — compare each bar to itself, not to the others.'**
  String get comparisonMixedUnits;

  /// No description provided for @howToTitle.
  ///
  /// In en, this message translates to:
  /// **'How to Use'**
  String get howToTitle;

  /// No description provided for @howToWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Fuel Cost!'**
  String get howToWelcome;

  /// No description provided for @howToWelcomeBody.
  ///
  /// In en, this message translates to:
  /// **'Track your fuel consumption, costs, and calculate efficiency with ease.'**
  String get howToWelcomeBody;

  /// No description provided for @howToGettingStarted.
  ///
  /// In en, this message translates to:
  /// **'How to Get Started'**
  String get howToGettingStarted;

  /// No description provided for @howToStep1.
  ///
  /// In en, this message translates to:
  /// **'Add your first fuel entry by tapping \"Add Fuel Entry\"'**
  String get howToStep1;

  /// No description provided for @howToStep2.
  ///
  /// In en, this message translates to:
  /// **'Enter fuel amount and price per unit'**
  String get howToStep2;

  /// No description provided for @howToStep3.
  ///
  /// In en, this message translates to:
  /// **'Optionally add your odometer reading for mileage tracking'**
  String get howToStep3;

  /// No description provided for @howToStep4.
  ///
  /// In en, this message translates to:
  /// **'View your fuel history and statistics on the main screen'**
  String get howToStep4;

  /// No description provided for @howToMileageTitle.
  ///
  /// In en, this message translates to:
  /// **'How Mileage Calculation Works'**
  String get howToMileageTitle;

  /// No description provided for @howToMileageFormulaTitle.
  ///
  /// In en, this message translates to:
  /// **'Mileage Formula'**
  String get howToMileageFormulaTitle;

  /// No description provided for @howToMileageFormula.
  ///
  /// In en, this message translates to:
  /// **'Mileage = Distance Traveled ÷ Fuel Added'**
  String get howToMileageFormula;

  /// No description provided for @howToDistanceFormula.
  ///
  /// In en, this message translates to:
  /// **'Distance = Current Odometer - Previous Odometer'**
  String get howToDistanceFormula;

  /// No description provided for @howToExample.
  ///
  /// In en, this message translates to:
  /// **'Example Calculation:'**
  String get howToExample;

  /// No description provided for @howToPreviousOdometer.
  ///
  /// In en, this message translates to:
  /// **'Previous Odometer:'**
  String get howToPreviousOdometer;

  /// No description provided for @howToCurrentOdometer.
  ///
  /// In en, this message translates to:
  /// **'Current Odometer:'**
  String get howToCurrentOdometer;

  /// No description provided for @howToDistanceTraveled.
  ///
  /// In en, this message translates to:
  /// **'Distance Traveled:'**
  String get howToDistanceTraveled;

  /// No description provided for @howToFuelAdded.
  ///
  /// In en, this message translates to:
  /// **'Fuel Added:'**
  String get howToFuelAdded;

  /// No description provided for @howToMileageResult.
  ///
  /// In en, this message translates to:
  /// **'Mileage:'**
  String get howToMileageResult;

  /// No description provided for @howToKeyFeatures.
  ///
  /// In en, this message translates to:
  /// **'Key Features'**
  String get howToKeyFeatures;

  /// No description provided for @howToFeatureDashboard.
  ///
  /// In en, this message translates to:
  /// **'Smart Dashboard'**
  String get howToFeatureDashboard;

  /// No description provided for @howToFeatureDashboardBody.
  ///
  /// In en, this message translates to:
  /// **'View total costs, fuel consumption, and efficiency at a glance'**
  String get howToFeatureDashboardBody;

  /// No description provided for @howToFeatureHistory.
  ///
  /// In en, this message translates to:
  /// **'Detailed History'**
  String get howToFeatureHistory;

  /// No description provided for @howToFeatureHistoryBody.
  ///
  /// In en, this message translates to:
  /// **'Track all your fuel entries with dates, amounts, and costs'**
  String get howToFeatureHistoryBody;

  /// No description provided for @howToFeatureEfficiency.
  ///
  /// In en, this message translates to:
  /// **'Efficiency Tracking'**
  String get howToFeatureEfficiency;

  /// No description provided for @howToFeatureEfficiencyBody.
  ///
  /// In en, this message translates to:
  /// **'Monitor your vehicle\'s fuel efficiency over time'**
  String get howToFeatureEfficiencyBody;

  /// No description provided for @howToFeatureData.
  ///
  /// In en, this message translates to:
  /// **'Data Management'**
  String get howToFeatureData;

  /// No description provided for @howToFeatureDataBody.
  ///
  /// In en, this message translates to:
  /// **'Easily manage and clear your fuel data when needed'**
  String get howToFeatureDataBody;

  /// No description provided for @howToTips.
  ///
  /// In en, this message translates to:
  /// **'Tips for Better Tracking'**
  String get howToTips;

  /// No description provided for @howToTip1.
  ///
  /// In en, this message translates to:
  /// **'Always fill up your tank completely for accurate measurements'**
  String get howToTip1;

  /// No description provided for @howToTip2.
  ///
  /// In en, this message translates to:
  /// **'Record your odometer reading after each fuel entry'**
  String get howToTip2;

  /// No description provided for @howToTip3.
  ///
  /// In en, this message translates to:
  /// **'Add fuel entries immediately after filling up'**
  String get howToTip3;

  /// No description provided for @howToTip4.
  ///
  /// In en, this message translates to:
  /// **'Check your efficiency trends regularly to identify patterns'**
  String get howToTip4;

  /// No description provided for @howToTip5.
  ///
  /// In en, this message translates to:
  /// **'Use the pull-to-refresh feature to update your data'**
  String get howToTip5;

  /// No description provided for @restoreTitle.
  ///
  /// In en, this message translates to:
  /// **'Review Conflicts'**
  String get restoreTitle;

  /// No description provided for @restoreConfirm.
  ///
  /// In en, this message translates to:
  /// **'CONFIRM'**
  String get restoreConfirm;

  /// No description provided for @restoreUseBackupAll.
  ///
  /// In en, this message translates to:
  /// **'Use backup for all'**
  String get restoreUseBackupAll;

  /// No description provided for @restoreKeepAllMine.
  ///
  /// In en, this message translates to:
  /// **'Keep all mine'**
  String get restoreKeepAllMine;

  /// No description provided for @restoreMine.
  ///
  /// In en, this message translates to:
  /// **'Mine'**
  String get restoreMine;

  /// No description provided for @restoreBackup.
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get restoreBackup;

  /// No description provided for @restoreExplainer.
  ///
  /// In en, this message translates to:
  /// **'These records changed on both sides. Pick which version to keep — new records are added automatically.'**
  String get restoreExplainer;

  /// No description provided for @restoreSectionVehicles.
  ///
  /// In en, this message translates to:
  /// **'Vehicles'**
  String get restoreSectionVehicles;

  /// No description provided for @restoreSectionSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get restoreSectionSettings;

  /// No description provided for @restoreSectionMaintenance.
  ///
  /// In en, this message translates to:
  /// **'Maintenance'**
  String get restoreSectionMaintenance;

  /// No description provided for @restoreSectionEntries.
  ///
  /// In en, this message translates to:
  /// **'Fuel Entries'**
  String get restoreSectionEntries;

  /// No description provided for @restoreUnchanged.
  ///
  /// In en, this message translates to:
  /// **'unchanged'**
  String get restoreUnchanged;

  /// No description provided for @restoreConflictCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 conflict} other{{count} conflicts}}'**
  String restoreConflictCount(int count);

  /// No description provided for @restoreNewCount.
  ///
  /// In en, this message translates to:
  /// **'{count} new'**
  String restoreNewCount(int count);

  /// No description provided for @restoreUnchangedCount.
  ///
  /// In en, this message translates to:
  /// **'{count} unchanged'**
  String restoreUnchangedCount(int count);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bn',
    'en',
    'es',
    'fa',
    'fr',
    'pt',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fr':
      return AppLocalizationsFr();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
