// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Fuel Cost';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonSave => 'Save';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonClear => 'Clear';

  @override
  String get commonAll => 'All';

  @override
  String get commonNotAvailable => 'N/A';

  @override
  String get commonNotSet => 'Not set';

  @override
  String get homeTotalCost => 'Total Cost';

  @override
  String get homeTotalFuels => 'Total Fuels';

  @override
  String get homeTotalDistance => 'Total Distance';

  @override
  String homeTotalOf(String unit) {
    return 'Total $unit';
  }

  @override
  String get homeLastTripMileage => 'Last Trip Mileage';

  @override
  String get homeOverallMileage => 'Overall Mileage';

  @override
  String get homeMaxMileage => 'Max Mileage';

  @override
  String get homeMinMileage => 'Min Mileage';

  @override
  String get homeThisMonth => 'This Month';

  @override
  String get homeAddFuel => 'Add Fuel';

  @override
  String get homeHistory => 'History';

  @override
  String get homeSettings => 'Settings';

  @override
  String get addFuelTitle => 'Add Fuel Entry';

  @override
  String get addFuelEditTitle => 'Edit Fuel Entry';

  @override
  String addFuelAmountLabel(String unit) {
    return 'Fuel Amount ($unit)';
  }

  @override
  String addFuelChargeAmountLabel(String unit) {
    return 'Charge Amount ($unit)';
  }

  @override
  String addFuelPricePerUnit(String unit) {
    return 'Price per $unit';
  }

  @override
  String get addFuelOdometer => 'Odometer Reading';

  @override
  String get addFuelVehicle => 'Vehicle';

  @override
  String get addFuelFuelType => 'Fuel Type';

  @override
  String get addFuelPetrol => 'Petrol';

  @override
  String get addFuelCharge => 'Charge';

  @override
  String get addFuelSelectVehicle => 'Please select a vehicle';

  @override
  String get addFuelSaved => 'Fuel entry saved successfully!';

  @override
  String get addFuelUpdated => 'Fuel entry updated!';

  @override
  String addFuelLastRecorded(String value) {
    return 'Last recorded: $value km';
  }

  @override
  String get historyTitle => 'Fuel History';

  @override
  String get historyRecentEntries => 'Recent Entries';

  @override
  String get historySearchHint => 'Search amount, odometer or vehicle';

  @override
  String get historyExportTooltip => 'Export these entries';

  @override
  String historyEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entries',
      one: '1 entry',
    );
    return '$_temp0';
  }

  @override
  String historyFilteredCount(int shown, int total) {
    return '$shown of $total entries';
  }

  @override
  String historyExported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entries exported',
      one: '1 entry exported',
    );
    return '$_temp0';
  }

  @override
  String get historyNoEntriesYet => 'No fuel entries yet';

  @override
  String get historyNoMatches => 'No entries match your filters';

  @override
  String get historyNoEntriesSubtitle =>
      'Add your first fuel entry to start\ntracking your fuel costs!';

  @override
  String get historyNoMatchesSubtitle =>
      'Try a wider date range, or clear your filters';

  @override
  String get dateAll => 'All';

  @override
  String get dateThisMonth => 'This Month';

  @override
  String get dateLastThreeMonths => 'Last 3 Months';

  @override
  String get dateThisYear => 'This Year';

  @override
  String get dateCustom => 'Custom';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsCurrency => 'Currency';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsLanguageSystem => 'System default';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get settingsMonthlyBudget => 'Monthly Budget';

  @override
  String settingsBudgetPerMonth(String amount) {
    return '$amount per month';
  }

  @override
  String get settingsBackupToDrive => 'Backup to Google Drive';

  @override
  String get settingsRestoreFromDrive => 'Restore from Google Drive';

  @override
  String get settingsExportCsv => 'Export CSV';

  @override
  String get settingsImportCsv => 'Import CSV';

  @override
  String get settingsReplayTutorial => 'Replay Tutorial';

  @override
  String settingsVersion(String version, String build) {
    return 'Version $version (Build $build)';
  }

  @override
  String get settingsRestoreCancelled => 'Restore cancelled';

  @override
  String get settingsBackupSuccess => 'Backup successful!';
}
