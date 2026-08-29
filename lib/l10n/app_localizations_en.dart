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

  @override
  String get commonAdd => 'Add';

  @override
  String get commonUpdate => 'Update';

  @override
  String get commonRemove => 'Remove';

  @override
  String get commonOther => 'Other';

  @override
  String commonError(String message) {
    return 'Error: $message';
  }

  @override
  String get commonNoData => 'No data';

  @override
  String get commonTotalCost => 'Total Cost';

  @override
  String get commonDistance => 'Distance';

  @override
  String get commonMonth => 'Month';

  @override
  String get commonLiters => 'Liters';

  @override
  String get splashTagline => 'TRACK  •  CALCULATE  •  SAVE';

  @override
  String get splashLoading => 'Starting your journey…';

  @override
  String get splashTrackFuel => 'Track Fuel';

  @override
  String get splashDriveSmart => 'Drive Smart';

  @override
  String get splashSaveMoney => 'Save Money';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingGetStarted => 'Get Started';

  @override
  String get onboardingTrackTitle => 'Track Every Fill-Up';

  @override
  String get onboardingTrackBody =>
      'Log your fuel purchases with liters, price, and odometer readings. Never lose track of your fuel expenses again.';

  @override
  String get onboardingVehiclesTitle => 'Multiple Vehicles';

  @override
  String get onboardingVehiclesBody =>
      'Manage your car, bike, truck, or any vehicle separately. Switch between them anytime to see individual stats.';

  @override
  String get onboardingMileageTitle => 'Smart Mileage Calculation';

  @override
  String get onboardingMileageBody =>
      'We automatically calculate your fuel efficiency from your odometer readings. See trends over time.';

  @override
  String get onboardingBudgetTitle => 'Budget & Reports';

  @override
  String get onboardingBudgetBody =>
      'Set a monthly fuel budget and visualize your spending with beautiful charts. Stay in control of your costs.';

  @override
  String get onboardingBackupTitle => 'Backup to Cloud';

  @override
  String get onboardingBackupBody =>
      'Sync your data securely to Google Drive. Restore anytime on any device — your fuel history is always safe.';

  @override
  String get tripTitle => 'Trip Cost Calculator';

  @override
  String get tripSubtitle => 'Estimate your trip fuel cost';

  @override
  String get tripDetails => 'Trip Details';

  @override
  String get tripDistanceLabel => 'Trip Distance (km)';

  @override
  String get tripRoundTrip => 'Round Trip';

  @override
  String get tripUseCustomMileage => 'Use custom mileage';

  @override
  String get tripUseCustomPrice => 'Use custom fuel price';

  @override
  String tripMileageLabel(String unit) {
    return 'Mileage ($unit)';
  }

  @override
  String tripFuelPriceLabel(String currency, String unit) {
    return 'Fuel Price ($currency/$unit)';
  }

  @override
  String get tripEstimate => 'Trip Estimate';

  @override
  String get tripEstimatedTotal => 'Estimated Total Cost';

  @override
  String get tripFuelNeeded => 'Fuel Needed';

  @override
  String get tripChargeNeeded => 'Charge Needed';

  @override
  String get tripMileageUsed => 'Mileage Used';

  @override
  String get tripFuelPrice => 'Fuel Price';

  @override
  String get tripCostPerKm => 'Cost per km';

  @override
  String get tripEnterDistance => 'Enter trip distance to calculate';

  @override
  String get tripNoPriceData =>
      'No fuel price data available. Enter a custom price.';

  @override
  String get vehiclesTitle => 'My Vehicles';

  @override
  String get vehiclesSubtitle => 'Manage your vehicles';

  @override
  String get vehiclesAdd => 'Add Vehicle';

  @override
  String get vehiclesEdit => 'Edit Vehicle';

  @override
  String get vehiclesDelete => 'Delete Vehicle';

  @override
  String get vehiclesNameLabel => 'Vehicle Name';

  @override
  String get vehiclesTypeLabel => 'Vehicle Type';

  @override
  String get vehiclesFuelTypeLabel => 'Fuel Type';

  @override
  String get vehiclesSoldBy => 'Sold By';

  @override
  String vehiclesTankCapacity(String unit) {
    return 'Tank Capacity ($unit) - Optional';
  }

  @override
  String get vehiclesBatteryCapacity => 'Battery Capacity (kWh) - Optional';

  @override
  String get vehiclesNameRequired => 'Please enter a vehicle name';

  @override
  String get vehiclesEmpty => 'No vehicles added yet';

  @override
  String get vehiclesEmptyHint => 'Tap + to add your first vehicle';

  @override
  String vehiclesTankSuffix(String amount, String unit) {
    return '$amount$unit tank';
  }

  @override
  String vehiclesBatterySuffix(String amount, String unit) {
    return '$amount$unit battery';
  }

  @override
  String get maintenanceTitle => 'Maintenance Log';

  @override
  String get maintenanceSubtitle => 'Track your vehicle services';

  @override
  String get maintenanceAdd => 'Add Service';

  @override
  String get maintenanceEdit => 'Edit Service';

  @override
  String get maintenanceDelete => 'Delete Record';

  @override
  String maintenanceDeleteConfirm(String type) {
    return 'Are you sure you want to delete \"$type\"?';
  }

  @override
  String get maintenanceServiceType => 'Service Type';

  @override
  String get maintenanceVehicleRequired => 'Vehicle *';

  @override
  String get maintenanceSelectVehicle => 'Please select a vehicle';

  @override
  String maintenanceCostLabel(String currency) {
    return 'Cost ($currency)';
  }

  @override
  String get maintenanceDate => 'Date';

  @override
  String get maintenanceNotes => 'Notes (optional)';

  @override
  String get maintenanceNotesHint => 'Any additional notes...';

  @override
  String get maintenanceSummary => 'Summary';

  @override
  String get maintenanceRecords => 'Records';

  @override
  String get maintenanceLastService => 'Last Service';

  @override
  String get maintenanceEmpty => 'No maintenance records yet';

  @override
  String get maintenanceEmptyHint => 'Tap + to add your first service record';

  @override
  String get budgetTitle => 'Budget & Reports';

  @override
  String get budgetSubtitle => 'Track your fuel spending';

  @override
  String get budgetSetTitle => 'Set Monthly Budget';

  @override
  String get budgetSetAction => 'Set Budget';

  @override
  String get budgetRemove => 'Remove Budget';

  @override
  String budgetAmountLabel(String currency) {
    return 'Budget ($currency)';
  }

  @override
  String get budgetSpent => 'Spent';

  @override
  String get budgetAvgPerDay => 'Avg/Day';

  @override
  String get budgetFills => 'Fills';

  @override
  String get budgetMonthlySpending => 'Monthly Spending';

  @override
  String get budgetWeeklyBreakdown => 'Weekly Breakdown';

  @override
  String get budgetMonthlyComparison => 'Monthly Comparison';

  @override
  String budgetDayRange(String range) {
    return 'Day $range';
  }

  @override
  String budgetOverBy(String amount) {
    return '$amount over budget';
  }

  @override
  String budgetRemaining(String amount) {
    return '$amount remaining';
  }

  @override
  String get spendingTitle => 'Spending Comparison';

  @override
  String get spendingSubtitle => 'Compare periods side by side';

  @override
  String get spendingDetailed => 'Detailed Comparison';

  @override
  String get spendingMetric => 'Metric';

  @override
  String get spendingTotalSpent => 'Total Spent';

  @override
  String get spendingTotalLiters => 'Total Liters';

  @override
  String get spendingFillUps => 'Fill-ups';

  @override
  String get spendingAvgPerFill => 'Avg/Fill';

  @override
  String spendingSelectPeriod(String label) {
    return 'Select $label';
  }

  @override
  String spendingPeriod(String letter) {
    return 'Period $letter';
  }

  @override
  String get comparisonTitle => 'Compare Vehicles';

  @override
  String get comparisonNeedTwo => 'Add at least 2 vehicles to compare';

  @override
  String get comparisonMaintenance => 'Maintenance';

  @override
  String get comparisonTotalFuel => 'Total Fuel';

  @override
  String get comparisonFillUps => 'Fill-ups';

  @override
  String get comparisonEfficiency => 'Efficiency';

  @override
  String get comparisonCostPerKmAllIn => 'Cost per km · all-in';

  @override
  String get comparisonCostPerKmNote => 'fuel + maintenance ÷ distance';

  @override
  String get comparisonCostPerKmShort => 'Cost/km';

  @override
  String get comparisonMixedUnits =>
      'These vehicles use different units — compare each bar to itself, not to the others.';

  @override
  String get howToTitle => 'How to Use';

  @override
  String howToWelcome(String app) {
    return 'Welcome to $app!';
  }

  @override
  String get howToWelcomeBody =>
      'Track your fuel consumption, costs, and calculate efficiency with ease.';

  @override
  String get howToGettingStarted => 'How to Get Started';

  @override
  String get howToStep1 =>
      'Add your first fuel entry by tapping \"Add Fuel Entry\"';

  @override
  String get howToStep2 => 'Enter fuel amount and price per unit';

  @override
  String get howToStep3 =>
      'Optionally add your odometer reading for mileage tracking';

  @override
  String get howToStep4 =>
      'View your fuel history and statistics on the main screen';

  @override
  String get howToMileageTitle => 'How Mileage Calculation Works';

  @override
  String get howToMileageFormulaTitle => 'Mileage Formula';

  @override
  String get howToMileageFormula => 'Mileage = Distance Traveled ÷ Fuel Added';

  @override
  String get howToDistanceFormula =>
      'Distance = Current Odometer - Previous Odometer';

  @override
  String get howToExample => 'Example Calculation:';

  @override
  String get howToPreviousOdometer => 'Previous Odometer:';

  @override
  String get howToCurrentOdometer => 'Current Odometer:';

  @override
  String get howToDistanceTraveled => 'Distance Traveled:';

  @override
  String get howToFuelAdded => 'Fuel Added:';

  @override
  String get howToMileageResult => 'Mileage:';

  @override
  String get howToKeyFeatures => 'Key Features';

  @override
  String get howToFeatureDashboard => 'Smart Dashboard';

  @override
  String get howToFeatureDashboardBody =>
      'View total costs, fuel consumption, and efficiency at a glance';

  @override
  String get howToFeatureHistory => 'Detailed History';

  @override
  String get howToFeatureHistoryBody =>
      'Track all your fuel entries with dates, amounts, and costs';

  @override
  String get howToFeatureEfficiency => 'Efficiency Tracking';

  @override
  String get howToFeatureEfficiencyBody =>
      'Monitor your vehicle\'s fuel efficiency over time';

  @override
  String get howToFeatureData => 'Data Management';

  @override
  String get howToFeatureDataBody =>
      'Easily manage and clear your fuel data when needed';

  @override
  String get howToTips => 'Tips for Better Tracking';

  @override
  String get howToTip1 =>
      'Always fill up your tank completely for accurate measurements';

  @override
  String get howToTip2 => 'Record your odometer reading after each fuel entry';

  @override
  String get howToTip3 => 'Add fuel entries immediately after filling up';

  @override
  String get howToTip4 =>
      'Check your efficiency trends regularly to identify patterns';

  @override
  String get howToTip5 => 'Use the pull-to-refresh feature to update your data';

  @override
  String get restoreTitle => 'Review Conflicts';

  @override
  String get restoreConfirm => 'CONFIRM';

  @override
  String get restoreUseBackupAll => 'Use backup for all';

  @override
  String get restoreKeepAllMine => 'Keep all mine';

  @override
  String get restoreMine => 'Mine';

  @override
  String get restoreBackup => 'Backup';

  @override
  String get restoreExplainer =>
      'These records changed on both sides. Pick which version to keep — new records are added automatically.';

  @override
  String get restoreSectionVehicles => 'Vehicles';

  @override
  String get restoreSectionSettings => 'Settings';

  @override
  String get restoreSectionMaintenance => 'Maintenance';

  @override
  String get restoreSectionEntries => 'Fuel Entries';

  @override
  String get restoreUnchanged => 'unchanged';

  @override
  String restoreConflictCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count conflicts',
      one: '1 conflict',
    );
    return '$_temp0';
  }

  @override
  String restoreNewCount(int count) {
    return '$count new';
  }

  @override
  String restoreUnchangedCount(int count) {
    return '$count unchanged';
  }

  @override
  String get commonRestore => 'Restore';

  @override
  String get commonSignIn => 'Sign In';

  @override
  String get commonDisconnect => 'Disconnect';

  @override
  String get commonProcessing => 'Processing...';

  @override
  String get commonNoThanks => 'No thanks';

  @override
  String get commonNotNow => 'Not Now';

  @override
  String get commonMileage => 'Mileage';

  @override
  String get settingsSubtitle => 'Manage your preferences and data';

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get settingsPreferences => 'Preferences';

  @override
  String get settingsDataManagement => 'Data Management';

  @override
  String get settingsExportImport => 'Export & Import';

  @override
  String get settingsAdvanced => 'Advanced';

  @override
  String get settingsAbout => 'About';

  @override
  String get settingsAccentColor => 'Accent Color';

  @override
  String get settingsAccentColorSubtitle => 'Customize app color';

  @override
  String get settingsChooseAccentColor => 'Choose Accent Color';

  @override
  String get settingsChooseTheme => 'Choose Theme';

  @override
  String settingsThemeCurrent(String theme) {
    return 'Current: $theme';
  }

  @override
  String settingsCurrencyCurrent(String symbol, String name) {
    return 'Current: $symbol ($name)';
  }

  @override
  String settingsCurrencyChanged(String symbol, String name) {
    return 'Currency changed to $symbol ($name)';
  }

  @override
  String settingsBudgetLabel(String currency) {
    return 'Budget ($currency)';
  }

  @override
  String get settingsBudgetHint => 'e.g. 5000';

  @override
  String get settingsGoogleDriveBackup => 'Google Drive Backup';

  @override
  String settingsSignedInAs(String email) {
    return 'Signed in as $email';
  }

  @override
  String get settingsSignOutSubtitle => 'Sign out from Google backup';

  @override
  String get settingsDisconnected => 'Disconnected from Google Drive';

  @override
  String get settingsBackupNow => 'Backup Now';

  @override
  String get settingsBackupNowSubtitle => 'Upload your data to Google Drive';

  @override
  String get settingsAutoBackup => 'Auto Backup';

  @override
  String get settingsAutoBackupSubtitle =>
      'Automatically backup after saving an entry';

  @override
  String get settingsAutoBackupOffWarning =>
      'Existing backups will remain. No new backups will be made.';

  @override
  String get settingsRestoreFromBackup => 'Restore from Backup';

  @override
  String get settingsRestoreSubtitle => 'Download and restore your data';

  @override
  String get settingsRestoreWarning =>
      'This will replace all current data with the backup. This cannot be undone.';

  @override
  String settingsRestoreFailed(String message) {
    return 'Restore failed: $message';
  }

  @override
  String settingsBackupFailed(String message) {
    return 'Backup failed: $message';
  }

  @override
  String get settingsExportData => 'Export Data';

  @override
  String get settingsExportToCsv => 'Export to CSV';

  @override
  String get settingsExportSubtitle => 'Export all fuel entries as a CSV file';

  @override
  String get settingsSelectExportVehicle =>
      'Select which vehicle data to export';

  @override
  String get settingsAllVehicles => 'All Vehicles';

  @override
  String get settingsIncludeAllVehicles => 'Include data from all vehicles';

  @override
  String get settingsNoVehicle => 'No Vehicle';

  @override
  String get settingsNoVehicleSubtitle => 'Don\'t assign to any vehicle';

  @override
  String get settingsNothingToExport => 'No entries to export for this vehicle';

  @override
  String settingsEntriesExported(int count) {
    return '$count entries exported';
  }

  @override
  String get settingsImportData => 'Import Data';

  @override
  String get settingsImportFromCsv => 'Import from CSV';

  @override
  String get settingsImportSubtitle => 'Import fuel entries from a CSV file';

  @override
  String get settingsAssignImported => 'Assign imported entries to a vehicle';

  @override
  String get settingsCsvInvalid => 'CSV file is empty or invalid';

  @override
  String settingsEntriesImported(int count) {
    return '$count entries imported';
  }

  @override
  String settingsExportFailed(String message) {
    return 'Error exporting CSV: $message';
  }

  @override
  String settingsImportFailed(String message) {
    return 'Error importing CSV: $message';
  }

  @override
  String get settingsClearEntries => 'Clear Fuel Entries';

  @override
  String get settingsClearEntriesAction => 'Clear Entries';

  @override
  String get settingsClearEntriesSubtitle => 'Remove all fuel entries';

  @override
  String get settingsClearEntriesWarning =>
      'This will permanently delete all your fuel entries.';

  @override
  String get settingsEntriesCleared => 'Fuel entries cleared successfully';

  @override
  String get settingsClearOdometer => 'Clear Odometer Data';

  @override
  String get settingsClearOdometerAction => 'Clear Odometer';

  @override
  String get settingsClearOdometerSubtitle => 'Reset current odometer reading';

  @override
  String get settingsClearOdometerWarning =>
      'This will reset your odometer reading.';

  @override
  String get settingsOdometerCleared => 'Odometer data cleared successfully';

  @override
  String get settingsClearAllData => 'Clear All Fuel Data';

  @override
  String get settingsClearAllAction => 'Clear All Data';

  @override
  String get settingsClearAllSubtitle => 'Remove all entries and odometer data';

  @override
  String get settingsClearAllWarning =>
      'This will permanently delete ALL fuel data. Cannot be undone.';

  @override
  String get settingsAllDataCleared => 'All fuel data cleared successfully';

  @override
  String get settingsResetApp => 'Reset App';

  @override
  String get settingsClearAllCache => 'Clear All Cache & Preferences';

  @override
  String get settingsClearCacheAction => 'Clear All Cache';

  @override
  String get settingsResetSubtitle =>
      'Reset the entire app to factory settings';

  @override
  String get settingsResetWarning =>
      'This will completely reset the app. ALL data will be lost.';

  @override
  String get settingsCacheCleared => 'All cache and preferences cleared';

  @override
  String settingsClearFailed(String message) {
    return 'Error clearing data: $message';
  }

  @override
  String get settingsAppVersion => 'App Version';

  @override
  String get settingsRateApp => 'Rate this App';

  @override
  String settingsRateSubtitle(String app) {
    return 'Enjoying $app? Leave a review';
  }

  @override
  String get settingsReplayTutorialSubtitle => 'Watch the intro and tour again';

  @override
  String get homeYourFuelStats => 'Your Fuel Stats';

  @override
  String get homeQuickActions => 'Quick Actions';

  @override
  String get homeAddFuelEntry => 'Add Fuel Entry';

  @override
  String get homeViewFuelHistory => 'View Fuel History';

  @override
  String get homeSwitchVehicles => 'Switch Vehicles';

  @override
  String get homeTripCalculator => 'Trip Cost Calculator';

  @override
  String get homeTripCalculatorSubtitle => 'Estimate fuel cost for a trip';

  @override
  String get homeBudgetReports => 'Budget & Reports';

  @override
  String get homeBudgetReportsSubtitle => 'Monthly spending & budget tracking';

  @override
  String get homeSpendingComparison => 'Spending Comparison';

  @override
  String get homeSpendingComparisonSubtitle => 'Compare months side by side';

  @override
  String get homeCompareVehicles => 'Compare Vehicles';

  @override
  String get homeCompareVehiclesSubtitle => 'Side-by-side efficiency analysis';

  @override
  String get homeMaintenanceLog => 'Maintenance Log';

  @override
  String get homeMaintenanceLogSubtitle => 'Track your vehicle services';

  @override
  String get homeThanksFeedback => 'Thanks for the feedback!';

  @override
  String get addFuelAddVehicle => 'Add Vehicle';

  @override
  String addFuelSaveFailed(String message) {
    return 'Error saving entry: $message';
  }

  @override
  String get addFuelAutoBackupOk => 'Auto backup successful!';

  @override
  String addFuelAutoBackupFailed(String message) {
    return 'Auto backup failed: $message';
  }

  @override
  String get addFuelBackupOk => 'Backup successful!';

  @override
  String get addFuelConnectedBackedUp => 'Connected & backed up!';

  @override
  String get historyEntryDeleted => 'Entry deleted locally';

  @override
  String get historyTimeUpdated => 'Entry time updated';

  @override
  String historyDeleteFailed(String message) {
    return 'Error deleting entry: $message';
  }

  @override
  String historyLoadFailed(String message) {
    return 'Error loading data: $message';
  }

  @override
  String historyExportFailed(String message) {
    return 'Error exporting CSV: $message';
  }

  @override
  String get entryCardEdit => 'Edit';

  @override
  String get entryCardDelete => 'Delete';

  @override
  String get entryCardChangeTime => 'Change Time';

  @override
  String get deleteEntryTitle => 'Delete Entry';

  @override
  String rateTitle(String app) {
    return 'Enjoying $app?';
  }

  @override
  String get rateNow => 'Rate now';

  @override
  String get rateLater => 'Not now';

  @override
  String get currencyDialogTitle => 'Select Currency';

  @override
  String get currencyDialogSearch => 'Search currencies...';

  @override
  String get chartNeedMoreData => 'Add more fuel entries to see trends';

  @override
  String summaryAvgPricePerUnit(String unit) {
    return 'Average Price per $unit';
  }

  @override
  String summaryAvgPriceShort(String unit) {
    return 'Avg Price/$unit';
  }

  @override
  String get mileageDistanceTraveled => 'Distance Traveled:';

  @override
  String get mileageFuelEfficiency => 'Fuel Efficiency:';

  @override
  String budgetWeekShort(int number) {
    return 'W$number';
  }

  @override
  String get vehiclesNameHint => 'e.g. My Car';

  @override
  String get maintenanceCostHint => 'e.g. 150';

  @override
  String vehiclesDeleteConfirm(String name) {
    return 'Are you sure you want to delete \"$name\"? Fuel entries will not be deleted.';
  }

  @override
  String get restoreLabelVehicle => 'Vehicle';

  @override
  String get restoreLabelSetting => 'Setting';

  @override
  String get fuelType_petrol => 'Petrol';

  @override
  String get fuelType_diesel => 'Diesel';

  @override
  String get fuelType_cng => 'CNG';

  @override
  String get fuelType_electric => 'Electric';

  @override
  String get fuelType_hybrid => 'Hybrid';

  @override
  String get vehicleType_directions_car => 'Car';

  @override
  String get vehicleType_two_wheeler => 'Bike';

  @override
  String get vehicleType_local_shipping => 'Truck';

  @override
  String get vehicleType_airport_shuttle => 'Van';

  @override
  String get vehicleType_electric_car => 'Electric Car';

  @override
  String get vehicleType_pedal_bike => 'Bicycle';

  @override
  String get maintenanceType_oil_change => 'Oil Change';

  @override
  String get maintenanceType_tire_rotation => 'Tire Rotation';

  @override
  String get maintenanceType_brake_service => 'Brake Service';

  @override
  String get maintenanceType_air_filter => 'Air Filter';

  @override
  String get maintenanceType_transmission => 'Transmission';

  @override
  String get maintenanceType_battery => 'Battery';

  @override
  String get maintenanceType_coolant => 'Coolant Flush';

  @override
  String get maintenanceType_spark_plugs => 'Spark Plugs';

  @override
  String get maintenanceType_belt_replacement => 'Belt Replace';

  @override
  String get maintenanceType_wheel_alignment => 'Alignment';

  @override
  String get maintenanceType_suspension => 'Suspension';

  @override
  String get maintenanceType_exhaust => 'Exhaust';

  @override
  String get maintenanceType_ac_service => 'AC Service';

  @override
  String get maintenanceType_wiper_blades => 'Wiper Blades';

  @override
  String get maintenanceType_headlights => 'Headlights';

  @override
  String get maintenanceType_car_wash => 'Car Wash';

  @override
  String get maintenanceType_detailing => 'Detailing';

  @override
  String get maintenanceType_inspection => 'Inspection';

  @override
  String get maintenanceType_insurance => 'Insurance';

  @override
  String get maintenanceType_registration => 'Registration';

  @override
  String get maintenanceType_towing => 'Towing';

  @override
  String get maintenanceType_general_service => 'General Service';

  @override
  String get maintenanceType_body_repair => 'Body Repair';

  @override
  String get maintenanceType_other => 'Other';

  @override
  String get homeAddFuelSubtitle => 'Record your fuel purchases';

  @override
  String get homeViewHistorySubtitle => 'Browse your fuel records';

  @override
  String settingsEntriesImportedTo(int count, String vehicle) {
    return '$count entries imported to $vehicle';
  }

  @override
  String get homeOverallSummary => 'Overall Summary';

  @override
  String get homeSummary => 'Summary';

  @override
  String get homeMonitorEfficiency => 'Monitor your fuel efficiency';

  @override
  String get tourVehiclesTitle => 'Switch Vehicles';

  @override
  String get tourVehiclesBody =>
      'Select \"All\" to see combined stats, or pick a specific vehicle. Tap the + button at the end to add a new vehicle.';

  @override
  String get tourSettingsBody =>
      'Customize currency, theme, monthly budget, and backup your data to Google Drive from here.';

  @override
  String get tourStatsBody =>
      'See this month\'s spending, your last fill cost, days since last fill, and your overall efficiency at a glance.';

  @override
  String get tourActionsBody =>
      'Jump to Fuel History, Trip Calculator, Budget Reports, Maintenance Log, and more powerful tools.';

  @override
  String get tourAddFuelBody =>
      'Tap here to log a new fuel fill-up. You\'ll enter the amount, price, and odometer reading.';

  @override
  String get comparisonMetric => 'Metric';

  @override
  String get comparisonScroll => 'Scroll';

  @override
  String get comparisonSummary => 'Summary';

  @override
  String get comparisonSelectTwo => 'Select at least 2 vehicles to compare';

  @override
  String get comparisonSubtitle => 'Side-by-side efficiency';

  @override
  String get historyLoading => 'Loading fuel data...';

  @override
  String get historyLoadingHint => 'Please wait while we fetch your data';

  @override
  String get currencyNoResults => 'No currencies found';

  @override
  String get currencyNoResultsHint => 'Try searching with different keywords';

  @override
  String get mileageCalculationTitle => 'Mileage Calculation';

  @override
  String mileageSinceLastFill(String date) {
    return 'Since last fill-up: $date';
  }

  @override
  String get addFuelNoVehicles =>
      'No vehicles added. Please add a vehicle first.';

  @override
  String budgetProgressLabel(String amount, String percent) {
    return 'Budget: $amount  |  $percent% used';
  }

  @override
  String get howToAutoCalc =>
      'The app automatically calculates your fuel efficiency when you provide odometer readings:';

  @override
  String get deleteEntryMessage =>
      'Are you sure you want to delete this fuel entry? This action cannot be undone.';

  @override
  String get chartNotEnoughData => 'Not Enough Data';

  @override
  String get chartAnalytics => 'Analytics';

  @override
  String entryCardOdometer(String value) {
    return 'Odometer: $value km';
  }

  @override
  String get summaryFillUpTitle => 'Fill-up Summary';

  @override
  String get unitLong_L => 'Liters';

  @override
  String get unitWord_L => 'Liter';

  @override
  String get unitLong_kg => 'Kilograms';

  @override
  String get unitWord_kg => 'kg';

  @override
  String get unitLong_m3 => 'Cubic Meters';

  @override
  String get unitWord_m3 => 'm³';

  @override
  String get unitLong_kWh => 'Kilowatt-hours';

  @override
  String get unitWord_kWh => 'kWh';

  @override
  String get summaryTotalFuel => 'Total Fuel';

  @override
  String summaryTotalOf(String unit) {
    return 'Total $unit';
  }

  @override
  String get chartCostTrend => 'Fuel Cost Trend';

  @override
  String get chartConsumption => 'Fuel Consumption';

  @override
  String get chartEfficiency => 'Fuel Efficiency';

  @override
  String get chartTrend => 'Fuel Trend';

  @override
  String chartCostAxis(String currency) {
    return 'Cost ($currency)';
  }
}
