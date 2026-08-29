// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'هزینه سوخت';

  @override
  String get commonCancel => 'لغو';

  @override
  String get commonSave => 'ذخیره';

  @override
  String get commonDelete => 'حذف';

  @override
  String get commonEdit => 'ویرایش';

  @override
  String get commonClear => 'پاک کردن';

  @override
  String get commonAll => 'همه';

  @override
  String get commonNotAvailable => 'موجود نیست';

  @override
  String get commonNotSet => 'تنظیم نشده';

  @override
  String get homeTotalCost => 'هزینه کل';

  @override
  String get homeTotalFuels => 'کل سوخت';

  @override
  String get homeTotalDistance => 'کل مسافت';

  @override
  String homeTotalOf(String unit) {
    return 'کل $unit';
  }

  @override
  String get homeLastTripMileage => 'مصرف آخرین سفر';

  @override
  String get homeOverallMileage => 'مصرف کلی';

  @override
  String get homeMaxMileage => 'بیشترین مصرف';

  @override
  String get homeMinMileage => 'کمترین مصرف';

  @override
  String get homeThisMonth => 'این ماه';

  @override
  String get homeAddFuel => 'افزودن سوخت';

  @override
  String get homeHistory => 'تاریخچه';

  @override
  String get homeSettings => 'تنظیمات';

  @override
  String get addFuelTitle => 'افزودن سوخت‌گیری';

  @override
  String get addFuelEditTitle => 'ویرایش سوخت‌گیری';

  @override
  String addFuelAmountLabel(String unit) {
    return 'مقدار سوخت ($unit)';
  }

  @override
  String addFuelChargeAmountLabel(String unit) {
    return 'مقدار شارژ ($unit)';
  }

  @override
  String addFuelPricePerUnit(String unit) {
    return 'قیمت هر $unit';
  }

  @override
  String get addFuelOdometer => 'کیلومترشمار';

  @override
  String get addFuelVehicle => 'خودرو';

  @override
  String get addFuelFuelType => 'نوع سوخت';

  @override
  String get addFuelPetrol => 'بنزین';

  @override
  String get addFuelCharge => 'شارژ';

  @override
  String get addFuelSelectVehicle => 'لطفاً یک خودرو انتخاب کنید';

  @override
  String get addFuelSaved => 'سوخت‌گیری با موفقیت ذخیره شد!';

  @override
  String get addFuelUpdated => 'سوخت‌گیری به‌روزرسانی شد!';

  @override
  String addFuelLastRecorded(String value) {
    return 'آخرین ثبت: $value کیلومتر';
  }

  @override
  String get historyTitle => 'تاریخچه سوخت';

  @override
  String get historyRecentEntries => 'ثبت‌های اخیر';

  @override
  String get historySearchHint => 'جستجوی مبلغ، کیلومتر یا خودرو';

  @override
  String get historyExportTooltip => 'خروجی گرفتن از این ثبت‌ها';

  @override
  String historyEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ثبت',
      one: '۱ ثبت',
    );
    return '$_temp0';
  }

  @override
  String historyFilteredCount(int shown, int total) {
    return '$shown از $total ثبت';
  }

  @override
  String historyExported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ثبت خروجی گرفته شد',
      one: '۱ ثبت خروجی گرفته شد',
    );
    return '$_temp0';
  }

  @override
  String get historyNoEntriesYet => 'هنوز سوخت‌گیری ثبت نشده';

  @override
  String get historyNoMatches => 'هیچ ثبتی با فیلترهای شما مطابقت ندارد';

  @override
  String get historyNoEntriesSubtitle =>
      'برای شروع پیگیری هزینه‌ها\nاولین سوخت‌گیری خود را ثبت کنید!';

  @override
  String get historyNoMatchesSubtitle =>
      'بازه زمانی گسترده‌تری امتحان کنید یا فیلترها را پاک کنید';

  @override
  String get dateAll => 'همه';

  @override
  String get dateThisMonth => 'این ماه';

  @override
  String get dateLastThreeMonths => '۳ ماه اخیر';

  @override
  String get dateThisYear => 'امسال';

  @override
  String get dateCustom => 'سفارشی';

  @override
  String get settingsTitle => 'تنظیمات';

  @override
  String get settingsCurrency => 'واحد پول';

  @override
  String get settingsLanguage => 'زبان';

  @override
  String get settingsLanguageSystem => 'زبان سیستم';

  @override
  String get settingsTheme => 'پوسته';

  @override
  String get settingsMonthlyBudget => 'بودجه ماهانه';

  @override
  String settingsBudgetPerMonth(String amount) {
    return '$amount در ماه';
  }

  @override
  String get settingsBackupToDrive => 'پشتیبان‌گیری در Google Drive';

  @override
  String get settingsRestoreFromDrive => 'بازیابی از Google Drive';

  @override
  String get settingsExportCsv => 'خروجی CSV';

  @override
  String get settingsImportCsv => 'ورودی CSV';

  @override
  String get settingsReplayTutorial => 'نمایش دوباره آموزش';

  @override
  String settingsVersion(String version, String build) {
    return 'نسخه $version (ساخت $build)';
  }

  @override
  String get settingsRestoreCancelled => 'بازیابی لغو شد';

  @override
  String get settingsBackupSuccess => 'پشتیبان‌گیری موفق بود!';

  @override
  String get commonAdd => 'افزودن';

  @override
  String get commonUpdate => 'به‌روزرسانی';

  @override
  String get commonRemove => 'حذف';

  @override
  String get commonOther => 'سایر';

  @override
  String commonError(String message) {
    return 'خطا: $message';
  }

  @override
  String get commonNoData => 'داده‌ای وجود ندارد';

  @override
  String get commonTotalCost => 'هزینه کل';

  @override
  String get commonDistance => 'مسافت';

  @override
  String get commonMonth => 'ماه';

  @override
  String get commonLiters => 'لیتر';

  @override
  String get splashTagline => 'ثبت  •  محاسبه  •  صرفه‌جویی';

  @override
  String get splashLoading => 'سفر شما در حال آغاز است…';

  @override
  String get splashTrackFuel => 'پیگیری سوخت';

  @override
  String get splashDriveSmart => 'رانندگی هوشمند';

  @override
  String get splashSaveMoney => 'صرفه‌جویی در هزینه';

  @override
  String get onboardingSkip => 'رد کردن';

  @override
  String get onboardingNext => 'بعدی';

  @override
  String get onboardingGetStarted => 'شروع کنید';

  @override
  String get onboardingTrackTitle => 'هر سوخت‌گیری را ثبت کنید';

  @override
  String get onboardingTrackBody =>
      'خرید سوخت خود را با لیتر، قیمت و کیلومترشمار ثبت کنید. دیگر هرگز پیگیری هزینه‌ها را از دست ندهید.';

  @override
  String get onboardingVehiclesTitle => 'چند خودرو';

  @override
  String get onboardingVehiclesBody =>
      'خودرو، موتور، کامیون یا هر وسیله‌ای را جداگانه مدیریت کنید. هر زمان بین آن‌ها جابه‌جا شوید و آمار هرکدام را ببینید.';

  @override
  String get onboardingMileageTitle => 'محاسبه هوشمند مصرف';

  @override
  String get onboardingMileageBody =>
      'ما بازدهی سوخت را به‌طور خودکار از کیلومترشمار محاسبه می‌کنیم. روند را در طول زمان ببینید.';

  @override
  String get onboardingBudgetTitle => 'بودجه و گزارش‌ها';

  @override
  String get onboardingBudgetBody =>
      'بودجه ماهانه تعیین کنید و هزینه‌هایتان را در نمودارهای روشن ببینید. کنترل هزینه‌ها با شماست.';

  @override
  String get onboardingBackupTitle => 'پشتیبان‌گیری ابری';

  @override
  String get onboardingBackupBody =>
      'داده‌هایتان را با اطمینان در Google Drive همگام کنید. هر زمان و روی هر دستگاهی بازیابی کنید.';

  @override
  String get tripTitle => 'محاسبه‌گر هزینه سفر';

  @override
  String get tripSubtitle => 'هزینه سوخت سفرتان را برآورد کنید';

  @override
  String get tripDetails => 'جزئیات سفر';

  @override
  String get tripDistanceLabel => 'مسافت سفر (کیلومتر)';

  @override
  String get tripRoundTrip => 'رفت و برگشت';

  @override
  String get tripUseCustomMileage => 'استفاده از مصرف دلخواه';

  @override
  String get tripUseCustomPrice => 'استفاده از قیمت دلخواه';

  @override
  String tripMileageLabel(String unit) {
    return 'مصرف ($unit)';
  }

  @override
  String tripFuelPriceLabel(String currency, String unit) {
    return 'قیمت سوخت ($currency/$unit)';
  }

  @override
  String get tripEstimate => 'برآورد سفر';

  @override
  String get tripEstimatedTotal => 'هزینه کل برآوردی';

  @override
  String get tripFuelNeeded => 'سوخت موردنیاز';

  @override
  String get tripChargeNeeded => 'شارژ موردنیاز';

  @override
  String get tripMileageUsed => 'مصرف استفاده‌شده';

  @override
  String get tripFuelPrice => 'قیمت سوخت';

  @override
  String get tripCostPerKm => 'هزینه هر کیلومتر';

  @override
  String get tripEnterDistance => 'برای محاسبه، مسافت سفر را وارد کنید';

  @override
  String get tripNoPriceData =>
      'داده قیمتی موجود نیست. یک قیمت دلخواه وارد کنید.';

  @override
  String get vehiclesTitle => 'خودروهای من';

  @override
  String get vehiclesSubtitle => 'خودروهایتان را مدیریت کنید';

  @override
  String get vehiclesAdd => 'افزودن خودرو';

  @override
  String get vehiclesEdit => 'ویرایش خودرو';

  @override
  String get vehiclesDelete => 'حذف خودرو';

  @override
  String get vehiclesNameLabel => 'نام خودرو';

  @override
  String get vehiclesTypeLabel => 'نوع خودرو';

  @override
  String get vehiclesFuelTypeLabel => 'نوع سوخت';

  @override
  String get vehiclesSoldBy => 'واحد فروش';

  @override
  String vehiclesTankCapacity(String unit) {
    return 'ظرفیت باک ($unit) - اختیاری';
  }

  @override
  String get vehiclesBatteryCapacity => 'ظرفیت باتری (kWh) - اختیاری';

  @override
  String get vehiclesNameRequired => 'لطفاً نام خودرو را وارد کنید';

  @override
  String get vehiclesEmpty => 'هنوز خودرویی افزوده نشده';

  @override
  String get vehiclesEmptyHint => 'برای افزودن اولین خودرو + را بزنید';

  @override
  String vehiclesTankSuffix(String amount, String unit) {
    return 'باک $amount$unit';
  }

  @override
  String vehiclesBatterySuffix(String amount, String unit) {
    return 'باتری $amount$unit';
  }

  @override
  String get maintenanceTitle => 'دفترچه سرویس';

  @override
  String get maintenanceSubtitle => 'سرویس‌های خودرویتان را پیگیری کنید';

  @override
  String get maintenanceAdd => 'افزودن سرویس';

  @override
  String get maintenanceEdit => 'ویرایش سرویس';

  @override
  String get maintenanceDelete => 'حذف رکورد';

  @override
  String maintenanceDeleteConfirm(String type) {
    return 'آیا از حذف «$type» مطمئن هستید؟';
  }

  @override
  String get maintenanceServiceType => 'نوع سرویس';

  @override
  String get maintenanceVehicleRequired => 'خودرو *';

  @override
  String get maintenanceSelectVehicle => 'لطفاً یک خودرو انتخاب کنید';

  @override
  String maintenanceCostLabel(String currency) {
    return 'هزینه ($currency)';
  }

  @override
  String get maintenanceDate => 'تاریخ';

  @override
  String get maintenanceNotes => 'یادداشت (اختیاری)';

  @override
  String get maintenanceNotesHint => 'هر یادداشت اضافی...';

  @override
  String get maintenanceSummary => 'خلاصه';

  @override
  String get maintenanceRecords => 'رکوردها';

  @override
  String get maintenanceLastService => 'آخرین سرویس';

  @override
  String get maintenanceEmpty => 'هنوز رکورد سرویسی وجود ندارد';

  @override
  String get maintenanceEmptyHint => 'برای افزودن اولین سرویس + را بزنید';

  @override
  String get budgetTitle => 'بودجه و گزارش‌ها';

  @override
  String get budgetSubtitle => 'هزینه سوخت خود را پیگیری کنید';

  @override
  String get budgetSetTitle => 'تعیین بودجه ماهانه';

  @override
  String get budgetSetAction => 'تعیین بودجه';

  @override
  String get budgetRemove => 'حذف بودجه';

  @override
  String budgetAmountLabel(String currency) {
    return 'بودجه ($currency)';
  }

  @override
  String get budgetSpent => 'هزینه‌شده';

  @override
  String get budgetAvgPerDay => 'میانگین/روز';

  @override
  String get budgetFills => 'سوخت‌گیری‌ها';

  @override
  String get budgetMonthlySpending => 'هزینه ماهانه';

  @override
  String get budgetWeeklyBreakdown => 'تفکیک هفتگی';

  @override
  String get budgetMonthlyComparison => 'مقایسه ماهانه';

  @override
  String budgetDayRange(String range) {
    return 'روز $range';
  }

  @override
  String budgetOverBy(String amount) {
    return '$amount بیش از بودجه';
  }

  @override
  String budgetRemaining(String amount) {
    return '$amount باقی‌مانده';
  }

  @override
  String get spendingTitle => 'مقایسه هزینه‌ها';

  @override
  String get spendingSubtitle => 'دوره‌ها را کنار هم مقایسه کنید';

  @override
  String get spendingDetailed => 'مقایسه تفصیلی';

  @override
  String get spendingMetric => 'شاخص';

  @override
  String get spendingTotalSpent => 'کل هزینه';

  @override
  String get spendingTotalLiters => 'کل لیتر';

  @override
  String get spendingFillUps => 'سوخت‌گیری‌ها';

  @override
  String get spendingAvgPerFill => 'میانگین/سوخت‌گیری';

  @override
  String spendingSelectPeriod(String label) {
    return 'انتخاب $label';
  }

  @override
  String spendingPeriod(String letter) {
    return 'دوره $letter';
  }

  @override
  String get comparisonTitle => 'مقایسه خودروها';

  @override
  String get comparisonNeedTwo => 'برای مقایسه حداقل ۲ خودرو اضافه کنید';

  @override
  String get comparisonMaintenance => 'سرویس';

  @override
  String get comparisonTotalFuel => 'کل سوخت';

  @override
  String get comparisonFillUps => 'سوخت‌گیری‌ها';

  @override
  String get comparisonEfficiency => 'بازدهی';

  @override
  String get comparisonCostPerKmAllIn => 'هزینه هر کیلومتر · کامل';

  @override
  String get comparisonCostPerKmNote => 'سوخت + سرویس ÷ مسافت';

  @override
  String get comparisonCostPerKmShort => 'هزینه/کیلومتر';

  @override
  String get comparisonMixedUnits =>
      'این خودروها از واحدهای متفاوتی استفاده می‌کنند — هر ستون را با خودش مقایسه کنید، نه با بقیه.';

  @override
  String get howToTitle => 'راهنمای استفاده';

  @override
  String get howToWelcome => 'به هزینه سوخت خوش آمدید!';

  @override
  String get howToWelcomeBody =>
      'مصرف، هزینه‌ها و بازدهی خود را به‌سادگی پیگیری کنید.';

  @override
  String get howToGettingStarted => 'چگونه شروع کنیم';

  @override
  String get howToStep1 => 'با زدن «افزودن سوخت» اولین ثبت خود را اضافه کنید';

  @override
  String get howToStep2 => 'مقدار سوخت و قیمت هر واحد را وارد کنید';

  @override
  String get howToStep3 =>
      'در صورت تمایل کیلومترشمار را برای محاسبه مصرف وارد کنید';

  @override
  String get howToStep4 => 'تاریخچه و آمار خود را در صفحه اصلی ببینید';

  @override
  String get howToMileageTitle => 'مصرف چگونه محاسبه می‌شود';

  @override
  String get howToMileageFormulaTitle => 'فرمول مصرف';

  @override
  String get howToMileageFormula => 'مصرف = مسافت طی‌شده ÷ سوخت افزوده‌شده';

  @override
  String get howToDistanceFormula =>
      'مسافت = کیلومترشمار فعلی - کیلومترشمار قبلی';

  @override
  String get howToExample => 'نمونه محاسبه:';

  @override
  String get howToPreviousOdometer => 'کیلومترشمار قبلی:';

  @override
  String get howToCurrentOdometer => 'کیلومترشمار فعلی:';

  @override
  String get howToDistanceTraveled => 'مسافت طی‌شده:';

  @override
  String get howToFuelAdded => 'سوخت افزوده‌شده:';

  @override
  String get howToMileageResult => 'مصرف:';

  @override
  String get howToKeyFeatures => 'ویژگی‌های اصلی';

  @override
  String get howToFeatureDashboard => 'داشبورد هوشمند';

  @override
  String get howToFeatureDashboardBody =>
      'هزینه‌ها، مصرف و بازدهی را در یک نگاه ببینید';

  @override
  String get howToFeatureHistory => 'تاریخچه کامل';

  @override
  String get howToFeatureHistoryBody =>
      'همه ثبت‌ها را با تاریخ، مقدار و هزینه پیگیری کنید';

  @override
  String get howToFeatureEfficiency => 'پیگیری بازدهی';

  @override
  String get howToFeatureEfficiencyBody =>
      'بازدهی سوخت خودرویتان را در طول زمان زیر نظر بگیرید';

  @override
  String get howToFeatureData => 'مدیریت داده';

  @override
  String get howToFeatureDataBody =>
      'داده‌هایتان را در صورت نیاز به‌سادگی مدیریت و پاک کنید';

  @override
  String get howToTips => 'نکاتی برای پیگیری بهتر';

  @override
  String get howToTip1 => 'برای اندازه‌گیری دقیق، همیشه باک را کامل پر کنید';

  @override
  String get howToTip2 => 'پس از هر سوخت‌گیری کیلومترشمار را ثبت کنید';

  @override
  String get howToTip3 => 'بلافاصله پس از سوخت‌گیری ثبت را انجام دهید';

  @override
  String get howToTip4 => 'روند بازدهی خود را مرتب بررسی کنید';

  @override
  String get howToTip5 => 'برای به‌روزرسانی داده‌ها صفحه را به پایین بکشید';

  @override
  String get restoreTitle => 'بررسی تعارض‌ها';

  @override
  String get restoreConfirm => 'تأیید';

  @override
  String get restoreUseBackupAll => 'استفاده از پشتیبان برای همه';

  @override
  String get restoreKeepAllMine => 'نگه‌داشتن همه موارد من';

  @override
  String get restoreMine => 'مال من';

  @override
  String get restoreBackup => 'پشتیبان';

  @override
  String get restoreExplainer =>
      'این رکوردها در هر دو طرف تغییر کرده‌اند. نسخه موردنظر را انتخاب کنید — رکوردهای جدید خودکار افزوده می‌شوند.';

  @override
  String get restoreSectionVehicles => 'خودروها';

  @override
  String get restoreSectionSettings => 'تنظیمات';

  @override
  String get restoreSectionMaintenance => 'سرویس';

  @override
  String get restoreSectionEntries => 'ثبت‌های سوخت';

  @override
  String get restoreUnchanged => 'بدون تغییر';

  @override
  String restoreConflictCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تعارض',
      one: '۱ تعارض',
    );
    return '$_temp0';
  }

  @override
  String restoreNewCount(int count) {
    return '$count جدید';
  }

  @override
  String restoreUnchangedCount(int count) {
    return '$count بدون تغییر';
  }

  @override
  String get commonRestore => 'بازیابی';

  @override
  String get commonSignIn => 'ورود';

  @override
  String get commonDisconnect => 'قطع اتصال';

  @override
  String get commonProcessing => 'در حال پردازش...';

  @override
  String get commonNoThanks => 'نه، ممنون';

  @override
  String get commonNotNow => 'الان نه';

  @override
  String get commonMileage => 'مصرف';

  @override
  String get settingsSubtitle => 'تنظیمات و داده‌های خود را مدیریت کنید';

  @override
  String get settingsAppearance => 'ظاهر';

  @override
  String get settingsPreferences => 'ترجیحات';

  @override
  String get settingsDataManagement => 'مدیریت داده';

  @override
  String get settingsExportImport => 'خروجی و ورودی';

  @override
  String get settingsAdvanced => 'پیشرفته';

  @override
  String get settingsAbout => 'درباره';

  @override
  String get settingsAccentColor => 'رنگ تأکید';

  @override
  String get settingsAccentColorSubtitle => 'رنگ برنامه را شخصی‌سازی کنید';

  @override
  String get settingsChooseAccentColor => 'انتخاب رنگ تأکید';

  @override
  String get settingsChooseTheme => 'انتخاب پوسته';

  @override
  String settingsThemeCurrent(String theme) {
    return 'فعلی: $theme';
  }

  @override
  String settingsCurrencyCurrent(String symbol, String name) {
    return 'فعلی: $symbol ($name)';
  }

  @override
  String settingsCurrencyChanged(String symbol, String name) {
    return 'واحد پول به $symbol ($name) تغییر کرد';
  }

  @override
  String settingsBudgetLabel(String currency) {
    return 'بودجه ($currency)';
  }

  @override
  String get settingsBudgetHint => 'مثلاً ۵۰۰۰';

  @override
  String get settingsGoogleDriveBackup => 'پشتیبان‌گیری Google Drive';

  @override
  String settingsSignedInAs(String email) {
    return 'وارد شده با $email';
  }

  @override
  String get settingsSignOutSubtitle => 'خروج از پشتیبان‌گیری گوگل';

  @override
  String get settingsDisconnected => 'اتصال به Google Drive قطع شد';

  @override
  String get settingsBackupNow => 'پشتیبان‌گیری فوری';

  @override
  String get settingsBackupNowSubtitle =>
      'داده‌هایتان را در Google Drive بارگذاری کنید';

  @override
  String get settingsAutoBackup => 'پشتیبان‌گیری خودکار';

  @override
  String get settingsAutoBackupSubtitle =>
      'پس از ثبت هر رکورد به‌طور خودکار پشتیبان بگیر';

  @override
  String get settingsAutoBackupOffWarning =>
      'پشتیبان‌های موجود باقی می‌مانند. پشتیبان جدیدی گرفته نمی‌شود.';

  @override
  String get settingsRestoreFromBackup => 'بازیابی از پشتیبان';

  @override
  String get settingsRestoreSubtitle => 'داده‌هایتان را دانلود و بازیابی کنید';

  @override
  String get settingsRestoreWarning =>
      'این کار همه داده‌های فعلی را با پشتیبان جایگزین می‌کند. قابل بازگشت نیست.';

  @override
  String settingsRestoreFailed(String message) {
    return 'بازیابی ناموفق: $message';
  }

  @override
  String settingsBackupFailed(String message) {
    return 'پشتیبان‌گیری ناموفق: $message';
  }

  @override
  String get settingsExportData => 'خروجی داده';

  @override
  String get settingsExportToCsv => 'خروجی CSV';

  @override
  String get settingsExportSubtitle =>
      'همه رکوردها را به‌صورت فایل CSV خروجی بگیرید';

  @override
  String get settingsSelectExportVehicle =>
      'انتخاب کنید داده کدام خودرو خروجی گرفته شود';

  @override
  String get settingsAllVehicles => 'همه خودروها';

  @override
  String get settingsIncludeAllVehicles => 'شامل داده همه خودروها';

  @override
  String get settingsNoVehicle => 'بدون خودرو';

  @override
  String get settingsNoVehicleSubtitle => 'به هیچ خودرویی اختصاص نده';

  @override
  String get settingsNothingToExport =>
      'رکوردی برای خروجی گرفتن از این خودرو نیست';

  @override
  String settingsEntriesExported(int count) {
    return '$count رکورد خروجی گرفته شد';
  }

  @override
  String get settingsImportData => 'ورود داده';

  @override
  String get settingsImportFromCsv => 'ورود از CSV';

  @override
  String get settingsImportSubtitle => 'رکوردها را از فایل CSV وارد کنید';

  @override
  String get settingsAssignImported =>
      'رکوردهای واردشده را به یک خودرو اختصاص دهید';

  @override
  String get settingsCsvInvalid => 'فایل CSV خالی یا نامعتبر است';

  @override
  String settingsEntriesImported(int count) {
    return '$count رکورد وارد شد';
  }

  @override
  String settingsExportFailed(String message) {
    return 'خطا در خروجی CSV: $message';
  }

  @override
  String settingsImportFailed(String message) {
    return 'خطا در ورود CSV: $message';
  }

  @override
  String get settingsClearEntries => 'پاک کردن رکوردهای سوخت';

  @override
  String get settingsClearEntriesAction => 'پاک کردن رکوردها';

  @override
  String get settingsClearEntriesSubtitle => 'حذف همه رکوردهای سوخت';

  @override
  String get settingsClearEntriesWarning =>
      'این کار همه رکوردهای سوخت شما را برای همیشه حذف می‌کند.';

  @override
  String get settingsEntriesCleared => 'رکوردهای سوخت با موفقیت پاک شد';

  @override
  String get settingsClearOdometer => 'پاک کردن داده کیلومترشمار';

  @override
  String get settingsClearOdometerAction => 'پاک کردن کیلومترشمار';

  @override
  String get settingsClearOdometerSubtitle => 'بازنشانی قرائت فعلی کیلومترشمار';

  @override
  String get settingsClearOdometerWarning =>
      'این کار قرائت کیلومترشمار شما را بازنشانی می‌کند.';

  @override
  String get settingsOdometerCleared => 'داده کیلومترشمار با موفقیت پاک شد';

  @override
  String get settingsClearAllData => 'پاک کردن همه داده‌ها';

  @override
  String get settingsClearAllAction => 'پاک کردن همه';

  @override
  String get settingsClearAllSubtitle => 'حذف همه رکوردها و داده کیلومترشمار';

  @override
  String get settingsClearAllWarning =>
      'این کار همه داده‌های سوخت را برای همیشه حذف می‌کند. قابل بازگشت نیست.';

  @override
  String get settingsAllDataCleared => 'همه داده‌های سوخت با موفقیت پاک شد';

  @override
  String get settingsResetApp => 'بازنشانی برنامه';

  @override
  String get settingsClearAllCache => 'پاک کردن حافظه پنهان و تنظیمات';

  @override
  String get settingsClearCacheAction => 'پاک کردن همه';

  @override
  String get settingsResetSubtitle => 'بازگرداندن برنامه به تنظیمات کارخانه';

  @override
  String get settingsResetWarning =>
      'این کار برنامه را کاملاً بازنشانی می‌کند. همه داده‌ها از بین می‌رود.';

  @override
  String get settingsCacheCleared => 'حافظه پنهان و تنظیمات پاک شد';

  @override
  String settingsClearFailed(String message) {
    return 'خطا در پاک کردن داده: $message';
  }

  @override
  String get settingsAppVersion => 'نسخه برنامه';

  @override
  String get settingsRateApp => 'امتیاز به برنامه';

  @override
  String get settingsRateSubtitle => 'از برنامه راضی هستید؟ نظر بگذارید';

  @override
  String get settingsReplayTutorialSubtitle =>
      'دوباره مقدمه و راهنما را ببینید';

  @override
  String get homeYourFuelStats => 'آمار سوخت شما';

  @override
  String get homeQuickActions => 'دسترسی سریع';

  @override
  String get homeAddFuelEntry => 'افزودن سوخت‌گیری';

  @override
  String get homeViewFuelHistory => 'مشاهده تاریخچه';

  @override
  String get homeSwitchVehicles => 'تغییر خودرو';

  @override
  String get homeTripCalculator => 'محاسبه‌گر هزینه سفر';

  @override
  String get homeTripCalculatorSubtitle => 'هزینه سوخت یک سفر را برآورد کنید';

  @override
  String get homeBudgetReports => 'بودجه و گزارش‌ها';

  @override
  String get homeBudgetReportsSubtitle => 'هزینه ماهانه و پیگیری بودجه';

  @override
  String get homeSpendingComparison => 'مقایسه هزینه‌ها';

  @override
  String get homeSpendingComparisonSubtitle => 'ماه‌ها را کنار هم مقایسه کنید';

  @override
  String get homeCompareVehicles => 'مقایسه خودروها';

  @override
  String get homeCompareVehiclesSubtitle => 'تحلیل مقایسه‌ای بازدهی';

  @override
  String get homeMaintenanceLog => 'دفترچه سرویس';

  @override
  String get homeMaintenanceLogSubtitle => 'سرویس‌های خودرویتان را پیگیری کنید';

  @override
  String get homeThanksFeedback => 'از بازخورد شما سپاسگزاریم!';

  @override
  String get addFuelAddVehicle => 'افزودن خودرو';

  @override
  String addFuelSaveFailed(String message) {
    return 'خطا در ذخیره رکورد: $message';
  }

  @override
  String get addFuelAutoBackupOk => 'پشتیبان‌گیری خودکار موفق بود!';

  @override
  String addFuelAutoBackupFailed(String message) {
    return 'پشتیبان‌گیری خودکار ناموفق: $message';
  }

  @override
  String get addFuelBackupOk => 'پشتیبان‌گیری موفق بود!';

  @override
  String get addFuelConnectedBackedUp => 'متصل شد و پشتیبان گرفته شد!';

  @override
  String get historyEntryDeleted => 'رکورد حذف شد';

  @override
  String get historyTimeUpdated => 'زمان رکورد به‌روزرسانی شد';

  @override
  String historyDeleteFailed(String message) {
    return 'خطا در حذف رکورد: $message';
  }

  @override
  String historyLoadFailed(String message) {
    return 'خطا در بارگذاری داده: $message';
  }

  @override
  String historyExportFailed(String message) {
    return 'خطا در خروجی CSV: $message';
  }

  @override
  String get entryCardEdit => 'ویرایش';

  @override
  String get entryCardDelete => 'حذف';

  @override
  String get entryCardChangeTime => 'تغییر زمان';

  @override
  String get deleteEntryTitle => 'حذف رکورد';

  @override
  String get rateTitle => 'از برنامه راضی هستید؟';

  @override
  String get rateNow => 'الان امتیاز بدهید';

  @override
  String get rateLater => 'الان نه';

  @override
  String get currencyDialogTitle => 'انتخاب واحد پول';

  @override
  String get currencyDialogSearch => 'جستجوی واحد پول...';

  @override
  String get chartNeedMoreData => 'برای دیدن روندها رکوردهای بیشتری اضافه کنید';

  @override
  String summaryAvgPricePerUnit(String unit) {
    return 'میانگین قیمت هر $unit';
  }

  @override
  String summaryAvgPriceShort(String unit) {
    return 'میانگین قیمت/$unit';
  }

  @override
  String get mileageDistanceTraveled => 'مسافت طی‌شده:';

  @override
  String get mileageFuelEfficiency => 'بازدهی سوخت:';

  @override
  String budgetWeekShort(int number) {
    return 'ه$number';
  }

  @override
  String get vehiclesNameHint => 'مثلاً خودروی من';

  @override
  String get maintenanceCostHint => 'مثلاً ۱۵۰';

  @override
  String vehiclesDeleteConfirm(String name) {
    return 'آیا از حذف «$name» مطمئن هستید؟ رکوردهای سوخت حذف نمی‌شوند.';
  }

  @override
  String get restoreLabelVehicle => 'خودرو';

  @override
  String get restoreLabelSetting => 'تنظیم';

  @override
  String get fuelType_petrol => 'بنزین';

  @override
  String get fuelType_diesel => 'گازوئیل';

  @override
  String get fuelType_cng => 'سی‌ان‌جی';

  @override
  String get fuelType_electric => 'برقی';

  @override
  String get fuelType_hybrid => 'هیبریدی';

  @override
  String get vehicleType_directions_car => 'خودرو';

  @override
  String get vehicleType_two_wheeler => 'موتورسیکلت';

  @override
  String get vehicleType_local_shipping => 'کامیون';

  @override
  String get vehicleType_airport_shuttle => 'ون';

  @override
  String get vehicleType_electric_car => 'خودروی برقی';

  @override
  String get vehicleType_pedal_bike => 'دوچرخه';

  @override
  String get maintenanceType_oil_change => 'تعویض روغن';

  @override
  String get maintenanceType_tire_rotation => 'جابه‌جایی لاستیک';

  @override
  String get maintenanceType_brake_service => 'سرویس ترمز';

  @override
  String get maintenanceType_air_filter => 'فیلتر هوا';

  @override
  String get maintenanceType_transmission => 'گیربکس';

  @override
  String get maintenanceType_battery => 'باتری';

  @override
  String get maintenanceType_coolant => 'تعویض ضدیخ';

  @override
  String get maintenanceType_spark_plugs => 'شمع';

  @override
  String get maintenanceType_belt_replacement => 'تعویض تسمه';

  @override
  String get maintenanceType_wheel_alignment => 'تنظیم فرمان';

  @override
  String get maintenanceType_suspension => 'سیستم تعلیق';

  @override
  String get maintenanceType_exhaust => 'اگزوز';

  @override
  String get maintenanceType_ac_service => 'سرویس کولر';

  @override
  String get maintenanceType_wiper_blades => 'تیغه برف‌پاک‌کن';

  @override
  String get maintenanceType_headlights => 'چراغ جلو';

  @override
  String get maintenanceType_car_wash => 'کارواش';

  @override
  String get maintenanceType_detailing => 'صفرشویی';

  @override
  String get maintenanceType_inspection => 'معاینه فنی';

  @override
  String get maintenanceType_insurance => 'بیمه';

  @override
  String get maintenanceType_registration => 'ثبت و پلاک';

  @override
  String get maintenanceType_towing => 'یدک‌کشی';

  @override
  String get maintenanceType_general_service => 'سرویس دوره‌ای';

  @override
  String get maintenanceType_body_repair => 'صافکاری';

  @override
  String get maintenanceType_other => 'سایر';

  @override
  String get homeAddFuelSubtitle => 'خرید سوخت خود را ثبت کنید';

  @override
  String get homeViewHistorySubtitle => 'رکوردهای خود را مرور کنید';

  @override
  String settingsEntriesImportedTo(int count, String vehicle) {
    return '$count رکورد به $vehicle وارد شد';
  }

  @override
  String get homeOverallSummary => 'خلاصه کلی';

  @override
  String get homeSummary => 'خلاصه';

  @override
  String get homeMonitorEfficiency => 'بازدهی سوخت خود را زیر نظر بگیرید';

  @override
  String get tourVehiclesTitle => 'تغییر خودرو';

  @override
  String get tourVehiclesBody =>
      'برای دیدن آمار کلی «همه» را انتخاب کنید، یا خودروی مشخصی را برگزینید. برای افزودن خودروی جدید دکمه + انتهای فهرست را بزنید.';

  @override
  String get tourSettingsBody =>
      'از اینجا واحد پول، پوسته و بودجه ماهانه را تنظیم کنید و از داده‌هایتان در Google Drive پشتیبان بگیرید.';

  @override
  String get tourStatsBody =>
      'در یک نگاه هزینه این ماه، هزینه آخرین سوخت‌گیری، روزهای سپری‌شده و بازدهی کلی خود را ببینید.';

  @override
  String get tourActionsBody =>
      'به تاریخچه سوخت، محاسبه‌گر سفر، گزارش‌های بودجه، دفترچه سرویس و ابزارهای دیگر بروید.';

  @override
  String get tourAddFuelBody =>
      'برای ثبت سوخت‌گیری جدید اینجا را بزنید. مقدار، قیمت و کیلومترشمار را وارد می‌کنید.';

  @override
  String get comparisonMetric => 'شاخص';

  @override
  String get comparisonScroll => 'پیمایش';

  @override
  String get comparisonSummary => 'خلاصه';

  @override
  String get comparisonSelectTwo => 'برای مقایسه حداقل ۲ خودرو انتخاب کنید';

  @override
  String get comparisonSubtitle => 'مقایسه بازدهی';

  @override
  String get historyLoading => 'در حال بارگذاری داده‌ها...';

  @override
  String get historyLoadingHint => 'لطفاً تا دریافت داده‌هایتان صبر کنید';

  @override
  String get currencyNoResults => 'واحد پولی یافت نشد';

  @override
  String get currencyNoResultsHint => 'با کلمات دیگری جستجو کنید';

  @override
  String get mileageCalculationTitle => 'محاسبه مصرف';

  @override
  String mileageSinceLastFill(String date) {
    return 'از آخرین سوخت‌گیری: $date';
  }

  @override
  String get addFuelNoVehicles =>
      'خودرویی ثبت نشده است. ابتدا یک خودرو اضافه کنید.';

  @override
  String budgetProgressLabel(String amount, String percent) {
    return 'بودجه: $amount  |  $percent% مصرف‌شده';
  }

  @override
  String get howToAutoCalc =>
      'وقتی قرائت کیلومترشمار را وارد کنید، برنامه به‌طور خودکار بازدهی سوخت را محاسبه می‌کند:';

  @override
  String get deleteEntryMessage =>
      'آیا از حذف این سوخت‌گیری مطمئن هستید؟ این عمل قابل بازگشت نیست.';

  @override
  String get chartNotEnoughData => 'داده کافی نیست';

  @override
  String get chartAnalytics => 'تحلیل‌ها';

  @override
  String entryCardOdometer(String value) {
    return 'کیلومترشمار: $value کیلومتر';
  }

  @override
  String get summaryFillUpTitle => 'خلاصه سوخت‌گیری';
}
