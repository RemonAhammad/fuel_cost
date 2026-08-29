// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'ফুয়েল কস্ট';

  @override
  String get commonCancel => 'বাতিল';

  @override
  String get commonSave => 'সংরক্ষণ';

  @override
  String get commonDelete => 'মুছুন';

  @override
  String get commonEdit => 'সম্পাদনা';

  @override
  String get commonClear => 'মুছে ফেলুন';

  @override
  String get commonAll => 'সব';

  @override
  String get commonNotAvailable => 'নেই';

  @override
  String get commonNotSet => 'নির্ধারিত নয়';

  @override
  String get homeTotalCost => 'মোট খরচ';

  @override
  String get homeTotalFuels => 'মোট জ্বালানি';

  @override
  String get homeTotalDistance => 'মোট দূরত্ব';

  @override
  String homeTotalOf(String unit) {
    return 'মোট $unit';
  }

  @override
  String get homeLastTripMileage => 'সর্বশেষ ট্রিপের মাইলেজ';

  @override
  String get homeOverallMileage => 'সামগ্রিক মাইলেজ';

  @override
  String get homeMaxMileage => 'সর্বোচ্চ মাইলেজ';

  @override
  String get homeMinMileage => 'সর্বনিম্ন মাইলেজ';

  @override
  String get homeThisMonth => 'এই মাস';

  @override
  String get homeAddFuel => 'জ্বালানি যোগ';

  @override
  String get homeHistory => 'ইতিহাস';

  @override
  String get homeSettings => 'সেটিংস';

  @override
  String get addFuelTitle => 'জ্বালানি এন্ট্রি যোগ করুন';

  @override
  String get addFuelEditTitle => 'জ্বালানি এন্ট্রি সম্পাদনা';

  @override
  String addFuelAmountLabel(String unit) {
    return 'জ্বালানির পরিমাণ ($unit)';
  }

  @override
  String addFuelChargeAmountLabel(String unit) {
    return 'চার্জের পরিমাণ ($unit)';
  }

  @override
  String addFuelPricePerUnit(String unit) {
    return 'প্রতি $unit দাম';
  }

  @override
  String get addFuelOdometer => 'ওডোমিটার রিডিং';

  @override
  String get addFuelVehicle => 'যানবাহন';

  @override
  String get addFuelFuelType => 'জ্বালানির ধরন';

  @override
  String get addFuelPetrol => 'পেট্রল';

  @override
  String get addFuelCharge => 'চার্জ';

  @override
  String get addFuelSelectVehicle => 'একটি যানবাহন নির্বাচন করুন';

  @override
  String get addFuelSaved => 'জ্বালানি এন্ট্রি সফলভাবে সংরক্ষিত হয়েছে!';

  @override
  String get addFuelUpdated => 'জ্বালানি এন্ট্রি হালনাগাদ হয়েছে!';

  @override
  String addFuelLastRecorded(String value) {
    return 'সর্বশেষ রেকর্ড: $value কিমি';
  }

  @override
  String get historyTitle => 'জ্বালানির ইতিহাস';

  @override
  String get historyRecentEntries => 'সাম্প্রতিক এন্ট্রি';

  @override
  String get historySearchHint => 'পরিমাণ, ওডোমিটার বা যানবাহন খুঁজুন';

  @override
  String get historyExportTooltip => 'এই এন্ট্রিগুলো এক্সপোর্ট করুন';

  @override
  String historyEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি এন্ট্রি',
      one: '১টি এন্ট্রি',
    );
    return '$_temp0';
  }

  @override
  String historyFilteredCount(int shown, int total) {
    return '$totalটির মধ্যে $shownটি এন্ট্রি';
  }

  @override
  String historyExported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি এন্ট্রি এক্সপোর্ট হয়েছে',
      one: '১টি এন্ট্রি এক্সপোর্ট হয়েছে',
    );
    return '$_temp0';
  }

  @override
  String get historyNoEntriesYet => 'এখনও কোনো জ্বালানি এন্ট্রি নেই';

  @override
  String get historyNoMatches => 'আপনার ফিল্টারের সাথে কোনো এন্ট্রি মেলেনি';

  @override
  String get historyNoEntriesSubtitle =>
      'খরচের হিসাব রাখা শুরু করতে\nআপনার প্রথম এন্ট্রি যোগ করুন!';

  @override
  String get historyNoMatchesSubtitle =>
      'সময়সীমা বাড়িয়ে দেখুন, অথবা ফিল্টার মুছে ফেলুন';

  @override
  String get dateAll => 'সব';

  @override
  String get dateThisMonth => 'এই মাস';

  @override
  String get dateLastThreeMonths => 'গত ৩ মাস';

  @override
  String get dateThisYear => 'এই বছর';

  @override
  String get dateCustom => 'নির্ধারিত';

  @override
  String get settingsTitle => 'সেটিংস';

  @override
  String get settingsCurrency => 'মুদ্রা';

  @override
  String get settingsLanguage => 'ভাষা';

  @override
  String get settingsLanguageSystem => 'ডিভাইসের ভাষা';

  @override
  String get settingsTheme => 'থিম';

  @override
  String get settingsMonthlyBudget => 'মাসিক বাজেট';

  @override
  String settingsBudgetPerMonth(String amount) {
    return 'প্রতি মাসে $amount';
  }

  @override
  String get settingsBackupToDrive => 'গুগল ড্রাইভে ব্যাকআপ';

  @override
  String get settingsRestoreFromDrive => 'গুগল ড্রাইভ থেকে পুনরুদ্ধার';

  @override
  String get settingsExportCsv => 'CSV এক্সপোর্ট';

  @override
  String get settingsImportCsv => 'CSV ইমপোর্ট';

  @override
  String get settingsReplayTutorial => 'টিউটোরিয়াল আবার দেখুন';

  @override
  String settingsVersion(String version, String build) {
    return 'সংস্করণ $version (বিল্ড $build)';
  }

  @override
  String get settingsRestoreCancelled => 'পুনরুদ্ধার বাতিল হয়েছে';

  @override
  String get settingsBackupSuccess => 'ব্যাকআপ সফল হয়েছে!';

  @override
  String get commonAdd => 'যোগ করুন';

  @override
  String get commonUpdate => 'হালনাগাদ';

  @override
  String get commonRemove => 'সরান';

  @override
  String get commonOther => 'অন্যান্য';

  @override
  String commonError(String message) {
    return 'ত্রুটি: $message';
  }

  @override
  String get commonNoData => 'কোনো তথ্য নেই';

  @override
  String get commonTotalCost => 'মোট খরচ';

  @override
  String get commonDistance => 'দূরত্ব';

  @override
  String get commonMonth => 'মাস';

  @override
  String get commonLiters => 'লিটার';

  @override
  String get splashTagline => 'হিসাব  •  গণনা  •  সাশ্রয়';

  @override
  String get splashLoading => 'আপনার যাত্রা শুরু হচ্ছে…';

  @override
  String get splashTrackFuel => 'জ্বালানির হিসাব';

  @override
  String get splashDriveSmart => 'স্মার্ট ড্রাইভিং';

  @override
  String get splashSaveMoney => 'টাকা সাশ্রয়';

  @override
  String get onboardingSkip => 'এড়িয়ে যান';

  @override
  String get onboardingNext => 'পরবর্তী';

  @override
  String get onboardingGetStarted => 'শুরু করুন';

  @override
  String get onboardingTrackTitle => 'প্রতিটি ফিল-আপের হিসাব';

  @override
  String get onboardingTrackBody =>
      'লিটার, দাম ও ওডোমিটার রিডিং দিয়ে জ্বালানি কেনার হিসাব রাখুন। আর কখনো খরচের হিসাব হারাবেন না।';

  @override
  String get onboardingVehiclesTitle => 'একাধিক যানবাহন';

  @override
  String get onboardingVehiclesBody =>
      'গাড়ি, বাইক, ট্রাক বা যেকোনো যানবাহন আলাদাভাবে পরিচালনা করুন। যেকোনো সময় বদলে আলাদা পরিসংখ্যান দেখুন।';

  @override
  String get onboardingMileageTitle => 'স্মার্ট মাইলেজ হিসাব';

  @override
  String get onboardingMileageBody =>
      'ওডোমিটার রিডিং থেকে আমরা স্বয়ংক্রিয়ভাবে জ্বালানি দক্ষতা হিসাব করি। সময়ের সাথে পরিবর্তন দেখুন।';

  @override
  String get onboardingBudgetTitle => 'বাজেট ও রিপোর্ট';

  @override
  String get onboardingBudgetBody =>
      'মাসিক জ্বালানি বাজেট ঠিক করুন এবং সুন্দর চার্টে খরচ দেখুন। খরচের নিয়ন্ত্রণ আপনার হাতে।';

  @override
  String get onboardingBackupTitle => 'ক্লাউডে ব্যাকআপ';

  @override
  String get onboardingBackupBody =>
      'গুগল ড্রাইভে নিরাপদে তথ্য সংরক্ষণ করুন। যেকোনো ডিভাইসে যেকোনো সময় ফিরিয়ে আনুন — আপনার হিসাব সবসময় নিরাপদ।';

  @override
  String get tripTitle => 'ট্রিপ খরচ ক্যালকুলেটর';

  @override
  String get tripSubtitle => 'আপনার ট্রিপের জ্বালানি খরচের হিসাব';

  @override
  String get tripDetails => 'ট্রিপের বিবরণ';

  @override
  String get tripDistanceLabel => 'ট্রিপের দূরত্ব (কিমি)';

  @override
  String get tripRoundTrip => 'যাওয়া-আসা';

  @override
  String get tripUseCustomMileage => 'নিজস্ব মাইলেজ ব্যবহার করুন';

  @override
  String get tripUseCustomPrice => 'নিজস্ব জ্বালানির দাম ব্যবহার করুন';

  @override
  String tripMileageLabel(String unit) {
    return 'মাইলেজ ($unit)';
  }

  @override
  String tripFuelPriceLabel(String currency, String unit) {
    return 'জ্বালানির দাম ($currency/$unit)';
  }

  @override
  String get tripEstimate => 'ট্রিপের হিসাব';

  @override
  String get tripEstimatedTotal => 'আনুমানিক মোট খরচ';

  @override
  String get tripFuelNeeded => 'প্রয়োজনীয় জ্বালানি';

  @override
  String get tripChargeNeeded => 'প্রয়োজনীয় চার্জ';

  @override
  String get tripMileageUsed => 'ব্যবহৃত মাইলেজ';

  @override
  String get tripFuelPrice => 'জ্বালানির দাম';

  @override
  String get tripCostPerKm => 'প্রতি কিমি খরচ';

  @override
  String get tripEnterDistance => 'হিসাব করতে ট্রিপের দূরত্ব লিখুন';

  @override
  String get tripNoPriceData =>
      'জ্বালানির দামের তথ্য নেই। নিজে একটি দাম লিখুন।';

  @override
  String get vehiclesTitle => 'আমার যানবাহন';

  @override
  String get vehiclesSubtitle => 'আপনার যানবাহন পরিচালনা করুন';

  @override
  String get vehiclesAdd => 'যানবাহন যোগ করুন';

  @override
  String get vehiclesEdit => 'যানবাহন সম্পাদনা';

  @override
  String get vehiclesDelete => 'যানবাহন মুছুন';

  @override
  String get vehiclesNameLabel => 'যানবাহনের নাম';

  @override
  String get vehiclesTypeLabel => 'যানবাহনের ধরন';

  @override
  String get vehiclesFuelTypeLabel => 'জ্বালানির ধরন';

  @override
  String get vehiclesSoldBy => 'বিক্রির একক';

  @override
  String vehiclesTankCapacity(String unit) {
    return 'ট্যাংক ধারণক্ষমতা ($unit) - ঐচ্ছিক';
  }

  @override
  String get vehiclesBatteryCapacity => 'ব্যাটারি ধারণক্ষমতা (kWh) - ঐচ্ছিক';

  @override
  String get vehiclesNameRequired => 'যানবাহনের নাম লিখুন';

  @override
  String get vehiclesEmpty => 'এখনও কোনো যানবাহন যোগ করা হয়নি';

  @override
  String get vehiclesEmptyHint => 'প্রথম যানবাহন যোগ করতে + চাপুন';

  @override
  String vehiclesTankSuffix(String amount, String unit) {
    return '$amount$unit ট্যাংক';
  }

  @override
  String vehiclesBatterySuffix(String amount, String unit) {
    return '$amount$unit ব্যাটারি';
  }

  @override
  String get maintenanceTitle => 'রক্ষণাবেক্ষণ লগ';

  @override
  String get maintenanceSubtitle => 'আপনার যানবাহনের সার্ভিসের হিসাব';

  @override
  String get maintenanceAdd => 'সার্ভিস যোগ করুন';

  @override
  String get maintenanceEdit => 'সার্ভিস সম্পাদনা';

  @override
  String get maintenanceDelete => 'রেকর্ড মুছুন';

  @override
  String maintenanceDeleteConfirm(String type) {
    return 'আপনি কি \"$type\" মুছে ফেলতে চান?';
  }

  @override
  String get maintenanceServiceType => 'সার্ভিসের ধরন';

  @override
  String get maintenanceVehicleRequired => 'যানবাহন *';

  @override
  String get maintenanceSelectVehicle => 'একটি যানবাহন নির্বাচন করুন';

  @override
  String maintenanceCostLabel(String currency) {
    return 'খরচ ($currency)';
  }

  @override
  String get maintenanceDate => 'তারিখ';

  @override
  String get maintenanceNotes => 'নোট (ঐচ্ছিক)';

  @override
  String get maintenanceNotesHint => 'অতিরিক্ত কোনো নোট...';

  @override
  String get maintenanceSummary => 'সারসংক্ষেপ';

  @override
  String get maintenanceRecords => 'রেকর্ড';

  @override
  String get maintenanceLastService => 'সর্বশেষ সার্ভিস';

  @override
  String get maintenanceEmpty => 'এখনও কোনো রক্ষণাবেক্ষণ রেকর্ড নেই';

  @override
  String get maintenanceEmptyHint => 'প্রথম সার্ভিস রেকর্ড যোগ করতে + চাপুন';

  @override
  String get budgetTitle => 'বাজেট ও রিপোর্ট';

  @override
  String get budgetSubtitle => 'আপনার জ্বালানি খরচের হিসাব';

  @override
  String get budgetSetTitle => 'মাসিক বাজেট নির্ধারণ';

  @override
  String get budgetSetAction => 'বাজেট নির্ধারণ';

  @override
  String get budgetRemove => 'বাজেট সরান';

  @override
  String budgetAmountLabel(String currency) {
    return 'বাজেট ($currency)';
  }

  @override
  String get budgetSpent => 'খরচ হয়েছে';

  @override
  String get budgetAvgPerDay => 'গড়/দিন';

  @override
  String get budgetFills => 'ফিল-আপ';

  @override
  String get budgetMonthlySpending => 'মাসিক খরচ';

  @override
  String get budgetWeeklyBreakdown => 'সাপ্তাহিক বিভাজন';

  @override
  String get budgetMonthlyComparison => 'মাসিক তুলনা';

  @override
  String budgetDayRange(String range) {
    return 'দিন $range';
  }

  @override
  String budgetOverBy(String amount) {
    return '$amount বাজেটের বেশি';
  }

  @override
  String budgetRemaining(String amount) {
    return '$amount বাকি';
  }

  @override
  String get spendingTitle => 'খরচের তুলনা';

  @override
  String get spendingSubtitle => 'পাশাপাশি সময়কাল তুলনা করুন';

  @override
  String get spendingDetailed => 'বিস্তারিত তুলনা';

  @override
  String get spendingMetric => 'সূচক';

  @override
  String get spendingTotalSpent => 'মোট খরচ';

  @override
  String get spendingTotalLiters => 'মোট লিটার';

  @override
  String get spendingFillUps => 'ফিল-আপ';

  @override
  String get spendingAvgPerFill => 'গড়/ফিল';

  @override
  String spendingSelectPeriod(String label) {
    return '$label নির্বাচন করুন';
  }

  @override
  String spendingPeriod(String letter) {
    return 'সময়কাল $letter';
  }

  @override
  String get comparisonTitle => 'যানবাহন তুলনা';

  @override
  String get comparisonNeedTwo => 'তুলনা করতে অন্তত ২টি যানবাহন যোগ করুন';

  @override
  String get comparisonMaintenance => 'রক্ষণাবেক্ষণ';

  @override
  String get comparisonTotalFuel => 'মোট জ্বালানি';

  @override
  String get comparisonFillUps => 'ফিল-আপ';

  @override
  String get comparisonEfficiency => 'দক্ষতা';

  @override
  String get comparisonCostPerKmAllIn => 'প্রতি কিমি খরচ · সর্বমোট';

  @override
  String get comparisonCostPerKmNote => 'জ্বালানি + রক্ষণাবেক্ষণ ÷ দূরত্ব';

  @override
  String get comparisonCostPerKmShort => 'খরচ/কিমি';

  @override
  String get comparisonMixedUnits =>
      'এই যানবাহনগুলো ভিন্ন একক ব্যবহার করে — প্রতিটি বার নিজের সাথে তুলনা করুন, অন্যগুলোর সাথে নয়।';

  @override
  String get howToTitle => 'ব্যবহারের নিয়ম';

  @override
  String get howToWelcome => 'ফুয়েল কস্টে স্বাগতম!';

  @override
  String get howToWelcomeBody =>
      'সহজেই আপনার জ্বালানি খরচ, ব্যয় ও দক্ষতার হিসাব রাখুন।';

  @override
  String get howToGettingStarted => 'যেভাবে শুরু করবেন';

  @override
  String get howToStep1 => '\"জ্বালানি যোগ\" চেপে আপনার প্রথম এন্ট্রি যোগ করুন';

  @override
  String get howToStep2 => 'জ্বালানির পরিমাণ ও প্রতি এককের দাম লিখুন';

  @override
  String get howToStep3 =>
      'মাইলেজের হিসাবের জন্য ইচ্ছা করলে ওডোমিটার রিডিং যোগ করুন';

  @override
  String get howToStep4 => 'মূল স্ক্রিনে আপনার ইতিহাস ও পরিসংখ্যান দেখুন';

  @override
  String get howToMileageTitle => 'মাইলেজ যেভাবে হিসাব হয়';

  @override
  String get howToMileageFormulaTitle => 'মাইলেজের সূত্র';

  @override
  String get howToMileageFormula =>
      'মাইলেজ = অতিক্রান্ত দূরত্ব ÷ যোগ করা জ্বালানি';

  @override
  String get howToDistanceFormula =>
      'দূরত্ব = বর্তমান ওডোমিটার - পূর্বের ওডোমিটার';

  @override
  String get howToExample => 'উদাহরণ হিসাব:';

  @override
  String get howToPreviousOdometer => 'পূর্বের ওডোমিটার:';

  @override
  String get howToCurrentOdometer => 'বর্তমান ওডোমিটার:';

  @override
  String get howToDistanceTraveled => 'অতিক্রান্ত দূরত্ব:';

  @override
  String get howToFuelAdded => 'যোগ করা জ্বালানি:';

  @override
  String get howToMileageResult => 'মাইলেজ:';

  @override
  String get howToKeyFeatures => 'প্রধান সুবিধা';

  @override
  String get howToFeatureDashboard => 'স্মার্ট ড্যাশবোর্ড';

  @override
  String get howToFeatureDashboardBody =>
      'এক নজরে মোট খরচ, জ্বালানি ব্যবহার ও দক্ষতা দেখুন';

  @override
  String get howToFeatureHistory => 'বিস্তারিত ইতিহাস';

  @override
  String get howToFeatureHistoryBody =>
      'তারিখ, পরিমাণ ও খরচসহ সব এন্ট্রির হিসাব রাখুন';

  @override
  String get howToFeatureEfficiency => 'দক্ষতার হিসাব';

  @override
  String get howToFeatureEfficiencyBody =>
      'সময়ের সাথে যানবাহনের জ্বালানি দক্ষতা পর্যবেক্ষণ করুন';

  @override
  String get howToFeatureData => 'তথ্য ব্যবস্থাপনা';

  @override
  String get howToFeatureDataBody =>
      'প্রয়োজনে সহজেই আপনার তথ্য পরিচালনা ও মুছে ফেলুন';

  @override
  String get howToTips => 'আরও ভালো হিসাবের পরামর্শ';

  @override
  String get howToTip1 => 'সঠিক পরিমাপের জন্য সবসময় ট্যাংক পূর্ণ করে ভরুন';

  @override
  String get howToTip2 => 'প্রতিটি এন্ট্রির পর ওডোমিটার রিডিং লিখে রাখুন';

  @override
  String get howToTip3 => 'জ্বালানি ভরার সাথে সাথেই এন্ট্রি যোগ করুন';

  @override
  String get howToTip4 => 'ধরন বুঝতে নিয়মিত আপনার দক্ষতার পরিবর্তন দেখুন';

  @override
  String get howToTip5 => 'তথ্য হালনাগাদ করতে টেনে-রিফ্রেশ ব্যবহার করুন';

  @override
  String get restoreTitle => 'দ্বন্দ্ব পর্যালোচনা';

  @override
  String get restoreConfirm => 'নিশ্চিত করুন';

  @override
  String get restoreUseBackupAll => 'সবগুলোতে ব্যাকআপ নিন';

  @override
  String get restoreKeepAllMine => 'সবগুলোতে আমারটি রাখুন';

  @override
  String get restoreMine => 'আমার';

  @override
  String get restoreBackup => 'ব্যাকআপ';

  @override
  String get restoreExplainer =>
      'এই রেকর্ডগুলো দুই দিকেই পরিবর্তিত হয়েছে। কোনটি রাখবেন বেছে নিন — নতুন রেকর্ড স্বয়ংক্রিয়ভাবে যোগ হবে।';

  @override
  String get restoreSectionVehicles => 'যানবাহন';

  @override
  String get restoreSectionSettings => 'সেটিংস';

  @override
  String get restoreSectionMaintenance => 'রক্ষণাবেক্ষণ';

  @override
  String get restoreSectionEntries => 'জ্বালানি এন্ট্রি';

  @override
  String get restoreUnchanged => 'অপরিবর্তিত';

  @override
  String restoreConflictCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি দ্বন্দ্ব',
      one: '১টি দ্বন্দ্ব',
    );
    return '$_temp0';
  }

  @override
  String restoreNewCount(int count) {
    return '$countটি নতুন';
  }

  @override
  String restoreUnchangedCount(int count) {
    return '$countটি অপরিবর্তিত';
  }
}
