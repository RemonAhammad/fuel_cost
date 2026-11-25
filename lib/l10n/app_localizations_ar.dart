// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'Fuel Cost';

  @override
  String get commonCancel => 'إلغاء';

  @override
  String get commonSave => 'حفظ';

  @override
  String get commonDelete => 'حذف';

  @override
  String get commonEdit => 'تعديل';

  @override
  String get commonClear => 'مسح';

  @override
  String get commonAll => 'الكل';

  @override
  String get commonNotAvailable => 'غير متاح';

  @override
  String get commonNotSet => 'غير محدد';

  @override
  String get homeTotalCost => 'التكلفة الإجمالية';

  @override
  String get homeTotalFuels => 'إجمالي الوقود';

  @override
  String get homeTotalDistance => 'إجمالي المسافة';

  @override
  String homeTotalOf(String unit) {
    return 'إجمالي $unit';
  }

  @override
  String get homeLastTripMileage => 'استهلاك آخر رحلة';

  @override
  String get homeOverallMileage => 'الاستهلاك العام';

  @override
  String get homeMaxMileage => 'أعلى استهلاك';

  @override
  String get homeMinMileage => 'أدنى استهلاك';

  @override
  String get homeThisMonth => 'هذا الشهر';

  @override
  String get homeAddFuel => 'إضافة وقود';

  @override
  String get homeHistory => 'السجل';

  @override
  String get homeSettings => 'الإعدادات';

  @override
  String get addFuelTitle => 'إضافة تعبئة وقود';

  @override
  String get addFuelEditTitle => 'تعديل تعبئة الوقود';

  @override
  String addFuelAmountLabel(String unit) {
    return 'كمية الوقود ($unit)';
  }

  @override
  String addFuelChargeAmountLabel(String unit) {
    return 'كمية الشحن ($unit)';
  }

  @override
  String addFuelPricePerUnit(String unit) {
    return 'السعر لكل $unit';
  }

  @override
  String get addFuelOdometer => 'قراءة العداد';

  @override
  String get addFuelVehicle => 'المركبة';

  @override
  String get addFuelFuelType => 'نوع الوقود';

  @override
  String get addFuelPetrol => 'بنزين';

  @override
  String get addFuelCharge => 'شحن';

  @override
  String get addFuelSelectVehicle => 'يرجى اختيار مركبة';

  @override
  String get addFuelSaved => 'تم حفظ التعبئة بنجاح!';

  @override
  String get addFuelUpdated => 'تم تحديث التعبئة!';

  @override
  String addFuelLastRecorded(String value) {
    return 'آخر تسجيل: $value كم';
  }

  @override
  String get historyTitle => 'سجل الوقود';

  @override
  String get historyRecentEntries => 'السجلات الأخيرة';

  @override
  String get historySearchHint => 'ابحث بالمبلغ أو العداد أو المركبة';

  @override
  String get historyExportTooltip => 'تصدير هذه السجلات';

  @override
  String historyEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سجل',
      many: '$count سجلاً',
      few: '$count سجلات',
      two: 'سجلان',
      one: 'سجل واحد',
      zero: 'لا سجلات',
    );
    return '$_temp0';
  }

  @override
  String historyFilteredCount(int shown, int total) {
    return '$shown من $total سجل';
  }

  @override
  String historyExported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم تصدير $count سجل',
      many: 'تم تصدير $count سجلاً',
      few: 'تم تصدير $count سجلات',
      two: 'تم تصدير سجلين',
      one: 'تم تصدير سجل واحد',
      zero: 'لم يتم تصدير سجلات',
    );
    return '$_temp0';
  }

  @override
  String get historyNoEntriesYet => 'لا توجد تعبئات بعد';

  @override
  String get historyNoMatches => 'لا توجد سجلات تطابق عوامل التصفية';

  @override
  String get historyNoEntriesSubtitle =>
      'أضف أول تعبئة لك لتبدأ\nبتتبع مصاريف الوقود!';

  @override
  String get historyNoMatchesSubtitle =>
      'جرّب نطاقاً زمنياً أوسع أو امسح عوامل التصفية';

  @override
  String get dateAll => 'الكل';

  @override
  String get dateThisMonth => 'هذا الشهر';

  @override
  String get dateLastThreeMonths => 'آخر ٣ أشهر';

  @override
  String get dateThisYear => 'هذه السنة';

  @override
  String get dateCustom => 'مخصص';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get settingsCurrency => 'العملة';

  @override
  String get settingsLanguage => 'اللغة';

  @override
  String get settingsLanguageSystem => 'لغة النظام';

  @override
  String get settingsTheme => 'المظهر';

  @override
  String get settingsMonthlyBudget => 'الميزانية الشهرية';

  @override
  String settingsBudgetPerMonth(String amount) {
    return '$amount شهرياً';
  }

  @override
  String get settingsBackupToDrive => 'النسخ الاحتياطي إلى Google Drive';

  @override
  String get settingsRestoreFromDrive => 'الاستعادة من Google Drive';

  @override
  String get settingsExportCsv => 'تصدير CSV';

  @override
  String get settingsImportCsv => 'استيراد CSV';

  @override
  String get settingsReplayTutorial => 'إعادة الشرح التعليمي';

  @override
  String settingsVersion(String version, String build) {
    return 'الإصدار $version (البناء $build)';
  }

  @override
  String get settingsRestoreCancelled => 'تم إلغاء الاستعادة';

  @override
  String get settingsBackupSuccess => 'تم النسخ الاحتياطي بنجاح!';

  @override
  String get commonAdd => 'إضافة';

  @override
  String get commonUpdate => 'تحديث';

  @override
  String get commonRemove => 'إزالة';

  @override
  String get commonOther => 'أخرى';

  @override
  String commonError(String message) {
    return 'خطأ: $message';
  }

  @override
  String get commonNoData => 'لا توجد بيانات';

  @override
  String get commonTotalCost => 'التكلفة الإجمالية';

  @override
  String get commonDistance => 'المسافة';

  @override
  String get commonMonth => 'الشهر';

  @override
  String get commonLiters => 'لتر';

  @override
  String get splashTagline => 'سجّل  •  احسب  •  وفّر';

  @override
  String get splashLoading => 'جارٍ بدء رحلتك…';

  @override
  String splashVersion(String version) {
    return 'v$version';
  }

  @override
  String get splashTrackFuel => 'تتبّع الوقود';

  @override
  String get splashDriveSmart => 'قيادة ذكية';

  @override
  String get splashSaveMoney => 'وفّر المال';

  @override
  String get onboardingSkip => 'تخطي';

  @override
  String get onboardingNext => 'التالي';

  @override
  String get onboardingGetStarted => 'ابدأ';

  @override
  String get onboardingTrackTitle => 'سجّل كل تعبئة';

  @override
  String get onboardingTrackBody =>
      'سجّل مشترياتك من الوقود باللترات والسعر وقراءة العداد. لن تفقد تتبع مصاريفك مرة أخرى.';

  @override
  String get onboardingVehiclesTitle => 'مركبات متعددة';

  @override
  String get onboardingVehiclesBody =>
      'أدر سيارتك أو دراجتك أو شاحنتك بشكل منفصل. بدّل بينها في أي وقت لرؤية إحصاءات كل منها.';

  @override
  String get onboardingMileageTitle => 'حساب ذكي للاستهلاك';

  @override
  String get onboardingMileageBody =>
      'نحسب كفاءة الوقود تلقائياً من قراءات العداد. تابع التغيّر مع الوقت.';

  @override
  String get onboardingBudgetTitle => 'الميزانية والتقارير';

  @override
  String get onboardingBudgetBody =>
      'حدّد ميزانية شهرية للوقود وشاهد مصاريفك في رسوم بيانية واضحة. تحكّم في تكاليفك.';

  @override
  String get onboardingBackupTitle => 'نسخ احتياطي سحابي';

  @override
  String get onboardingBackupBody =>
      'زامن بياناتك بأمان مع Google Drive. استعدها في أي وقت وعلى أي جهاز.';

  @override
  String get tripTitle => 'حاسبة تكلفة الرحلة';

  @override
  String get tripSubtitle => 'احسب تكلفة وقود رحلتك';

  @override
  String get tripDetails => 'تفاصيل الرحلة';

  @override
  String get tripDistanceLabel => 'مسافة الرحلة (كم)';

  @override
  String get tripRoundTrip => 'ذهاب وعودة';

  @override
  String get tripUseCustomMileage => 'استخدام استهلاك مخصص';

  @override
  String get tripUseCustomPrice => 'استخدام سعر مخصص';

  @override
  String tripMileageLabel(String unit) {
    return 'الاستهلاك ($unit)';
  }

  @override
  String tripFuelPriceLabel(String currency, String unit) {
    return 'سعر الوقود ($currency/$unit)';
  }

  @override
  String get tripEstimate => 'تقدير الرحلة';

  @override
  String get tripEstimatedTotal => 'إجمالي التكلفة المقدرة';

  @override
  String get tripFuelNeeded => 'الوقود المطلوب';

  @override
  String get tripChargeNeeded => 'الشحن المطلوب';

  @override
  String get tripMileageUsed => 'الاستهلاك المستخدم';

  @override
  String get tripFuelPrice => 'سعر الوقود';

  @override
  String get tripCostPerKm => 'التكلفة لكل كم';

  @override
  String get tripEnterDistance => 'أدخل مسافة الرحلة للحساب';

  @override
  String get tripNoPriceData => 'لا تتوفر بيانات أسعار. أدخل سعراً مخصصاً.';

  @override
  String get vehiclesTitle => 'مركباتي';

  @override
  String get vehiclesSubtitle => 'أدر مركباتك';

  @override
  String get vehiclesAdd => 'إضافة مركبة';

  @override
  String get vehiclesEdit => 'تعديل المركبة';

  @override
  String get vehiclesDelete => 'حذف المركبة';

  @override
  String get vehiclesNameLabel => 'اسم المركبة';

  @override
  String get vehiclesTypeLabel => 'نوع المركبة';

  @override
  String get vehiclesFuelTypeLabel => 'نوع الوقود';

  @override
  String get vehiclesSoldBy => 'تُباع بـ';

  @override
  String vehiclesTankCapacity(String unit) {
    return 'سعة الخزان ($unit) - اختياري';
  }

  @override
  String get vehiclesBatteryCapacity => 'سعة البطارية (kWh) - اختياري';

  @override
  String get vehiclesNameRequired => 'يرجى إدخال اسم المركبة';

  @override
  String get vehiclesEmpty => 'لم تتم إضافة مركبات بعد';

  @override
  String get vehiclesEmptyHint => 'اضغط + لإضافة أول مركبة';

  @override
  String vehiclesTankSuffix(String amount, String unit) {
    return 'خزان $amount$unit';
  }

  @override
  String vehiclesBatterySuffix(String amount, String unit) {
    return 'بطارية $amount$unit';
  }

  @override
  String get maintenanceTitle => 'سجل الصيانة';

  @override
  String get maintenanceSubtitle => 'تابع صيانة مركبتك';

  @override
  String get maintenanceAdd => 'إضافة صيانة';

  @override
  String get maintenanceEdit => 'تعديل الصيانة';

  @override
  String get maintenanceDelete => 'حذف السجل';

  @override
  String maintenanceDeleteConfirm(String type) {
    return 'هل تريد بالتأكيد حذف «$type»؟';
  }

  @override
  String get maintenanceServiceType => 'نوع الصيانة';

  @override
  String get maintenanceVehicleRequired => 'المركبة *';

  @override
  String get maintenanceSelectVehicle => 'يرجى اختيار مركبة';

  @override
  String maintenanceCostLabel(String currency) {
    return 'التكلفة ($currency)';
  }

  @override
  String get maintenanceDate => 'التاريخ';

  @override
  String get maintenanceNotes => 'ملاحظات (اختياري)';

  @override
  String get maintenanceNotesHint => 'أي ملاحظات إضافية...';

  @override
  String get maintenanceSummary => 'الملخص';

  @override
  String get maintenanceRecords => 'السجلات';

  @override
  String get maintenanceLastService => 'آخر صيانة';

  @override
  String get maintenanceEmpty => 'لا توجد سجلات صيانة بعد';

  @override
  String get maintenanceEmptyHint => 'اضغط + لإضافة أول سجل صيانة';

  @override
  String get budgetTitle => 'الميزانية والتقارير';

  @override
  String get budgetSubtitle => 'تابع إنفاقك على الوقود';

  @override
  String get budgetSetTitle => 'تحديد الميزانية الشهرية';

  @override
  String get budgetSetAction => 'تحديد الميزانية';

  @override
  String get budgetRemove => 'إزالة الميزانية';

  @override
  String budgetAmountLabel(String currency) {
    return 'الميزانية ($currency)';
  }

  @override
  String get budgetSpent => 'المصروف';

  @override
  String get budgetAvgPerDay => 'المعدل/اليوم';

  @override
  String get budgetFills => 'التعبئات';

  @override
  String get budgetMonthlySpending => 'الإنفاق الشهري';

  @override
  String get budgetWeeklyBreakdown => 'التفصيل الأسبوعي';

  @override
  String get budgetMonthlyComparison => 'المقارنة الشهرية';

  @override
  String budgetDayRange(String range) {
    return 'اليوم $range';
  }

  @override
  String budgetOverBy(String amount) {
    return '$amount فوق الميزانية';
  }

  @override
  String budgetRemaining(String amount) {
    return '$amount متبقٍ';
  }

  @override
  String get spendingTitle => 'مقارنة الإنفاق';

  @override
  String get spendingSubtitle => 'قارن الفترات جنباً إلى جنب';

  @override
  String get spendingDetailed => 'مقارنة تفصيلية';

  @override
  String get spendingMetric => 'المؤشر';

  @override
  String get spendingTotalSpent => 'إجمالي المصروف';

  @override
  String get spendingTotalLiters => 'إجمالي اللترات';

  @override
  String get spendingFillUps => 'التعبئات';

  @override
  String get spendingAvgPerFill => 'المعدل/التعبئة';

  @override
  String spendingSelectPeriod(String label) {
    return 'اختر $label';
  }

  @override
  String spendingPeriod(String letter) {
    return 'الفترة $letter';
  }

  @override
  String get comparisonTitle => 'مقارنة المركبات';

  @override
  String get comparisonNeedTwo => 'أضف مركبتين على الأقل للمقارنة';

  @override
  String get comparisonMaintenance => 'الصيانة';

  @override
  String get comparisonTotalFuel => 'إجمالي الوقود';

  @override
  String get comparisonFillUps => 'التعبئات';

  @override
  String get comparisonEfficiency => 'الكفاءة';

  @override
  String get comparisonCostPerKmAllIn => 'التكلفة لكل كم · شاملة';

  @override
  String get comparisonCostPerKmNote => 'الوقود + الصيانة ÷ المسافة';

  @override
  String get comparisonCostPerKmShort => 'التكلفة/كم';

  @override
  String get comparisonMixedUnits =>
      'تستخدم هذه المركبات وحدات مختلفة — قارن كل شريط بنفسه لا بالأشرطة الأخرى.';

  @override
  String get howToTitle => 'طريقة الاستخدام';

  @override
  String howToWelcome(String app) {
    return 'مرحباً بك في $app!';
  }

  @override
  String get howToWelcomeBody => 'تابع استهلاكك وتكاليفك وكفاءتك بسهولة.';

  @override
  String get howToGettingStarted => 'كيف تبدأ';

  @override
  String get howToStep1 => 'أضف أول تعبئة بالضغط على «إضافة وقود»';

  @override
  String get howToStep2 => 'أدخل كمية الوقود والسعر لكل وحدة';

  @override
  String get howToStep3 => 'يمكنك إضافة قراءة العداد لتتبع الاستهلاك';

  @override
  String get howToStep4 => 'اطّلع على سجلك وإحصاءاتك في الشاشة الرئيسية';

  @override
  String get howToMileageTitle => 'كيف يُحسب الاستهلاك';

  @override
  String get howToMileageFormulaTitle => 'معادلة الاستهلاك';

  @override
  String get howToMileageFormula =>
      'الاستهلاك = المسافة المقطوعة ÷ الوقود المضاف';

  @override
  String get howToDistanceFormula => 'المسافة = العداد الحالي - العداد السابق';

  @override
  String get howToExample => 'مثال على الحساب:';

  @override
  String get howToPreviousOdometer => 'العداد السابق:';

  @override
  String get howToCurrentOdometer => 'العداد الحالي:';

  @override
  String get howToDistanceTraveled => 'المسافة المقطوعة:';

  @override
  String get howToFuelAdded => 'الوقود المضاف:';

  @override
  String get howToMileageResult => 'الاستهلاك:';

  @override
  String get howToKeyFeatures => 'الميزات الرئيسية';

  @override
  String get howToFeatureDashboard => 'لوحة ذكية';

  @override
  String get howToFeatureDashboardBody =>
      'اطّلع على التكاليف والاستهلاك والكفاءة بنظرة واحدة';

  @override
  String get howToFeatureHistory => 'سجل تفصيلي';

  @override
  String get howToFeatureHistoryBody =>
      'تابع كل تعبئاتك مع التواريخ والكميات والتكاليف';

  @override
  String get howToFeatureEfficiency => 'تتبع الكفاءة';

  @override
  String get howToFeatureEfficiencyBody =>
      'راقب كفاءة وقود مركبتك مع مرور الوقت';

  @override
  String get howToFeatureData => 'إدارة البيانات';

  @override
  String get howToFeatureDataBody => 'أدر بياناتك وامسحها بسهولة عند الحاجة';

  @override
  String get howToTips => 'نصائح لتتبع أفضل';

  @override
  String get howToTip1 => 'املأ الخزان بالكامل دائماً للحصول على قياسات دقيقة';

  @override
  String get howToTip2 => 'سجّل قراءة العداد بعد كل تعبئة';

  @override
  String get howToTip3 => 'أضف التعبئة مباشرة بعد تعبئة الوقود';

  @override
  String get howToTip4 => 'راجع اتجاهات كفاءتك بانتظام';

  @override
  String get howToTip5 => 'اسحب للأسفل لتحديث بياناتك';

  @override
  String get restoreTitle => 'مراجعة التعارضات';

  @override
  String get restoreConfirm => 'تأكيد';

  @override
  String get restoreUseBackupAll => 'استخدام النسخة الاحتياطية للكل';

  @override
  String get restoreKeepAllMine => 'الاحتفاظ ببياناتي كلها';

  @override
  String get restoreMine => 'بياناتي';

  @override
  String get restoreBackup => 'النسخة الاحتياطية';

  @override
  String get restoreExplainer =>
      'تغيّرت هذه السجلات في الجانبين. اختر النسخة التي تريد الاحتفاظ بها — السجلات الجديدة تُضاف تلقائياً.';

  @override
  String get restoreSectionVehicles => 'المركبات';

  @override
  String get restoreSectionSettings => 'الإعدادات';

  @override
  String get restoreSectionMaintenance => 'الصيانة';

  @override
  String get restoreSectionEntries => 'تعبئات الوقود';

  @override
  String get restoreUnchanged => 'دون تغيير';

  @override
  String restoreConflictCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تعارض',
      many: '$count تعارضاً',
      few: '$count تعارضات',
      two: 'تعارضان',
      one: 'تعارض واحد',
      zero: 'لا تعارضات',
    );
    return '$_temp0';
  }

  @override
  String restoreNewCount(int count) {
    return '$count جديد';
  }

  @override
  String restoreUnchangedCount(int count) {
    return '$count دون تغيير';
  }

  @override
  String get commonRestore => 'استعادة';

  @override
  String get commonSignIn => 'تسجيل الدخول';

  @override
  String get commonDisconnect => 'قطع الاتصال';

  @override
  String get commonProcessing => 'جارٍ المعالجة...';

  @override
  String get commonNoThanks => 'لا، شكراً';

  @override
  String get commonNotNow => 'ليس الآن';

  @override
  String get commonMileage => 'الاستهلاك';

  @override
  String get settingsSubtitle => 'أدر تفضيلاتك وبياناتك';

  @override
  String get settingsAppearance => 'المظهر';

  @override
  String get settingsPreferences => 'التفضيلات';

  @override
  String get settingsDataManagement => 'إدارة البيانات';

  @override
  String get settingsExportImport => 'التصدير والاستيراد';

  @override
  String get settingsAdvanced => 'متقدم';

  @override
  String get settingsAbout => 'حول';

  @override
  String get settingsAccentColor => 'لون التمييز';

  @override
  String get settingsAccentColorSubtitle => 'خصّص لون التطبيق';

  @override
  String get settingsChooseAccentColor => 'اختر لون التمييز';

  @override
  String get settingsChooseTheme => 'اختر المظهر';

  @override
  String settingsThemeCurrent(String theme) {
    return 'الحالي: $theme';
  }

  @override
  String settingsCurrencyCurrent(String symbol, String name) {
    return 'الحالية: $symbol ($name)';
  }

  @override
  String settingsCurrencyChanged(String symbol, String name) {
    return 'تم تغيير العملة إلى $symbol ($name)';
  }

  @override
  String settingsBudgetLabel(String currency) {
    return 'الميزانية ($currency)';
  }

  @override
  String get settingsBudgetHint => 'مثال 5000';

  @override
  String get settingsGoogleDriveBackup => 'النسخ الاحتياطي على Google Drive';

  @override
  String settingsSignedInAs(String email) {
    return 'مسجّل الدخول باسم $email';
  }

  @override
  String get settingsSignOutSubtitle => 'تسجيل الخروج من النسخ الاحتياطي';

  @override
  String get settingsDisconnected => 'تم قطع الاتصال بـ Google Drive';

  @override
  String get settingsBackupNow => 'النسخ الآن';

  @override
  String get settingsBackupNowSubtitle => 'ارفع بياناتك إلى Google Drive';

  @override
  String get settingsAutoBackup => 'النسخ التلقائي';

  @override
  String get settingsAutoBackupSubtitle => 'النسخ تلقائياً بعد حفظ كل سجل';

  @override
  String get settingsAutoBackupOffWarning =>
      'ستبقى النسخ الحالية. لن يتم إنشاء نسخ جديدة.';

  @override
  String get settingsRestoreFromBackup => 'الاستعادة من النسخة';

  @override
  String get settingsRestoreSubtitle => 'نزّل بياناتك واستعدها';

  @override
  String get settingsRestoreWarning =>
      'سيستبدل هذا كل البيانات الحالية بالنسخة الاحتياطية. لا يمكن التراجع.';

  @override
  String settingsRestoreFailed(String message) {
    return 'فشلت الاستعادة: $message';
  }

  @override
  String settingsBackupFailed(String message) {
    return 'فشل النسخ الاحتياطي: $message';
  }

  @override
  String get settingsExportData => 'تصدير البيانات';

  @override
  String get settingsExportToCsv => 'تصدير إلى CSV';

  @override
  String get settingsExportSubtitle => 'صدّر كل السجلات كملف CSV';

  @override
  String get settingsSelectExportVehicle => 'اختر بيانات أي مركبة تريد تصديرها';

  @override
  String get settingsAllVehicles => 'كل المركبات';

  @override
  String get settingsIncludeAllVehicles => 'تضمين بيانات كل المركبات';

  @override
  String get settingsKeepFileVehicles => 'استخدام المركبات المحفوظة في الملف';

  @override
  String get settingsNoVehicle => 'بدون مركبة';

  @override
  String get settingsNoVehicleSubtitle => 'عدم الإسناد إلى أي مركبة';

  @override
  String get settingsNothingToExport => 'لا توجد سجلات لتصديرها لهذه المركبة';

  @override
  String settingsEntriesExported(int count) {
    return 'تم تصدير $count سجل';
  }

  @override
  String get settingsImportData => 'استيراد البيانات';

  @override
  String get settingsImportFromCsv => 'استيراد من CSV';

  @override
  String get settingsImportSubtitle => 'استورد السجلات من ملف CSV';

  @override
  String get settingsAssignImported => 'إسناد السجلات المستوردة إلى مركبة';

  @override
  String get settingsCsvInvalid => 'ملف CSV فارغ أو غير صالح';

  @override
  String settingsEntriesImported(int count) {
    return 'تم استيراد $count سجل';
  }

  @override
  String settingsExportFailed(String message) {
    return 'خطأ في تصدير CSV: $message';
  }

  @override
  String settingsImportFailed(String message) {
    return 'خطأ في استيراد CSV: $message';
  }

  @override
  String get settingsClearEntries => 'مسح سجلات الوقود';

  @override
  String get settingsClearEntriesAction => 'مسح السجلات';

  @override
  String get settingsClearEntriesSubtitle => 'إزالة كل سجلات الوقود';

  @override
  String get settingsClearEntriesWarning =>
      'سيؤدي هذا إلى حذف كل سجلات الوقود نهائياً.';

  @override
  String get settingsEntriesCleared => 'تم مسح سجلات الوقود بنجاح';

  @override
  String get settingsClearOdometer => 'مسح بيانات العداد';

  @override
  String get settingsClearOdometerAction => 'مسح العداد';

  @override
  String get settingsClearOdometerSubtitle =>
      'إعادة تعيين قراءة العداد الحالية';

  @override
  String get settingsClearOdometerWarning =>
      'سيؤدي هذا إلى إعادة تعيين قراءة العداد.';

  @override
  String get settingsOdometerCleared => 'تم مسح بيانات العداد بنجاح';

  @override
  String get settingsClearAllData => 'مسح كل بيانات الوقود';

  @override
  String get settingsClearAllAction => 'مسح كل البيانات';

  @override
  String get settingsClearAllSubtitle => 'إزالة كل السجلات وبيانات العداد';

  @override
  String get settingsClearAllWarning =>
      'سيؤدي هذا إلى حذف كل بيانات الوقود نهائياً. لا يمكن التراجع.';

  @override
  String get settingsAllDataCleared => 'تم مسح كل بيانات الوقود بنجاح';

  @override
  String get settingsResetApp => 'إعادة ضبط التطبيق';

  @override
  String get settingsClearAllCache => 'مسح الذاكرة المؤقتة والتفضيلات';

  @override
  String get settingsClearCacheAction => 'مسح الكل';

  @override
  String get settingsResetSubtitle => 'إعادة التطبيق إلى إعدادات المصنع';

  @override
  String get settingsResetWarning =>
      'سيعيد هذا ضبط التطبيق بالكامل. ستفقد كل البيانات.';

  @override
  String get settingsCacheCleared => 'تم مسح الذاكرة المؤقتة والتفضيلات';

  @override
  String settingsClearFailed(String message) {
    return 'خطأ في مسح البيانات: $message';
  }

  @override
  String get settingsAppVersion => 'إصدار التطبيق';

  @override
  String get settingsRateApp => 'قيّم التطبيق';

  @override
  String settingsRateSubtitle(String app) {
    return 'هل يعجبك $app؟ اترك تقييماً';
  }

  @override
  String get settingsReplayTutorialSubtitle => 'شاهد المقدمة والجولة مرة أخرى';

  @override
  String get homeYourFuelStats => 'إحصاءات الوقود';

  @override
  String get homeQuickActions => 'إجراءات سريعة';

  @override
  String get homeAddFuelEntry => 'إضافة تعبئة';

  @override
  String get homeViewFuelHistory => 'عرض السجل';

  @override
  String get homeSwitchVehicles => 'تبديل المركبة';

  @override
  String get homeTripCalculator => 'حاسبة تكلفة الرحلة';

  @override
  String get homeTripCalculatorSubtitle => 'احسب تكلفة وقود رحلة';

  @override
  String get homeBudgetReports => 'الميزانية والتقارير';

  @override
  String get homeBudgetReportsSubtitle => 'الإنفاق الشهري ومتابعة الميزانية';

  @override
  String get homeSpendingComparison => 'مقارنة الإنفاق';

  @override
  String get homeSpendingComparisonSubtitle => 'قارن الأشهر جنباً إلى جنب';

  @override
  String get homeCompareVehicles => 'مقارنة المركبات';

  @override
  String get homeCompareVehiclesSubtitle => 'تحليل الكفاءة جنباً إلى جنب';

  @override
  String get homeMaintenanceLog => 'سجل الصيانة';

  @override
  String get homeMaintenanceLogSubtitle => 'تابع صيانة مركبتك';

  @override
  String get homeThanksFeedback => 'شكراً على ملاحظاتك!';

  @override
  String get addFuelAddVehicle => 'إضافة مركبة';

  @override
  String addFuelSaveFailed(String message) {
    return 'خطأ في حفظ السجل: $message';
  }

  @override
  String get addFuelAutoBackupOk => 'تم النسخ التلقائي بنجاح!';

  @override
  String addFuelAutoBackupFailed(String message) {
    return 'فشل النسخ التلقائي: $message';
  }

  @override
  String get addFuelBackupOk => 'تم النسخ الاحتياطي بنجاح!';

  @override
  String get addFuelConnectedBackedUp => 'تم الاتصال والنسخ الاحتياطي!';

  @override
  String get historyEntryDeleted => 'تم حذف السجل';

  @override
  String get historyTimeUpdated => 'تم تحديث وقت السجل';

  @override
  String historyDeleteFailed(String message) {
    return 'خطأ في حذف السجل: $message';
  }

  @override
  String historyLoadFailed(String message) {
    return 'خطأ في تحميل البيانات: $message';
  }

  @override
  String historyExportFailed(String message) {
    return 'خطأ في تصدير CSV: $message';
  }

  @override
  String get entryCardEdit => 'تعديل';

  @override
  String get entryCardDelete => 'حذف';

  @override
  String get entryCardChangeTime => 'تغيير الوقت';

  @override
  String get deleteEntryTitle => 'حذف السجل';

  @override
  String rateTitle(String app) {
    return 'هل يعجبك $app؟';
  }

  @override
  String get rateNow => 'قيّم الآن';

  @override
  String get rateLater => 'ليس الآن';

  @override
  String get currencyDialogTitle => 'اختيار العملة';

  @override
  String get currencyDialogSearch => 'ابحث عن عملة...';

  @override
  String get chartNeedMoreData => 'أضف المزيد من السجلات لعرض الاتجاهات';

  @override
  String summaryAvgPricePerUnit(String unit) {
    return 'متوسط السعر لكل $unit';
  }

  @override
  String summaryAvgPriceShort(String unit) {
    return 'متوسط السعر/$unit';
  }

  @override
  String get mileageDistanceTraveled => 'المسافة المقطوعة:';

  @override
  String get mileageFuelEfficiency => 'كفاءة الوقود:';

  @override
  String budgetWeekShort(int number) {
    return 'أ$number';
  }

  @override
  String get vehiclesNameHint => 'مثال سيارتي';

  @override
  String get maintenanceCostHint => 'مثال 150';

  @override
  String vehiclesDeleteConfirm(String name) {
    return 'هل تريد بالتأكيد حذف «$name»؟ لن يتم حذف سجلات الوقود.';
  }

  @override
  String get restoreLabelVehicle => 'المركبة';

  @override
  String get restoreLabelSetting => 'الإعداد';

  @override
  String get fuelType_petrol => 'بنزين';

  @override
  String get fuelType_diesel => 'ديزل';

  @override
  String get fuelType_cng => 'غاز طبيعي';

  @override
  String get fuelType_electric => 'كهربائي';

  @override
  String get fuelType_hybrid => 'هجين';

  @override
  String get vehicleType_directions_car => 'سيارة';

  @override
  String get vehicleType_two_wheeler => 'دراجة نارية';

  @override
  String get vehicleType_local_shipping => 'شاحنة';

  @override
  String get vehicleType_airport_shuttle => 'فان';

  @override
  String get vehicleType_electric_car => 'سيارة كهربائية';

  @override
  String get vehicleType_pedal_bike => 'دراجة هوائية';

  @override
  String get maintenanceType_oil_change => 'تغيير الزيت';

  @override
  String get maintenanceType_tire_rotation => 'تدوير الإطارات';

  @override
  String get maintenanceType_brake_service => 'صيانة الفرامل';

  @override
  String get maintenanceType_air_filter => 'فلتر الهواء';

  @override
  String get maintenanceType_transmission => 'ناقل الحركة';

  @override
  String get maintenanceType_battery => 'البطارية';

  @override
  String get maintenanceType_coolant => 'سائل التبريد';

  @override
  String get maintenanceType_spark_plugs => 'شمعات الإشعال';

  @override
  String get maintenanceType_belt_replacement => 'تغيير السير';

  @override
  String get maintenanceType_wheel_alignment => 'ضبط الزوايا';

  @override
  String get maintenanceType_suspension => 'نظام التعليق';

  @override
  String get maintenanceType_exhaust => 'العادم';

  @override
  String get maintenanceType_ac_service => 'صيانة المكيف';

  @override
  String get maintenanceType_wiper_blades => 'مساحات الزجاج';

  @override
  String get maintenanceType_headlights => 'المصابيح الأمامية';

  @override
  String get maintenanceType_car_wash => 'غسيل السيارة';

  @override
  String get maintenanceType_detailing => 'تلميع وتنظيف';

  @override
  String get maintenanceType_inspection => 'الفحص';

  @override
  String get maintenanceType_insurance => 'التأمين';

  @override
  String get maintenanceType_registration => 'التسجيل';

  @override
  String get maintenanceType_towing => 'القطر';

  @override
  String get maintenanceType_general_service => 'صيانة عامة';

  @override
  String get maintenanceType_body_repair => 'إصلاح الهيكل';

  @override
  String get maintenanceType_other => 'أخرى';

  @override
  String get homeAddFuelSubtitle => 'سجّل مشترياتك من الوقود';

  @override
  String get homeViewHistorySubtitle => 'تصفّح سجلاتك';

  @override
  String settingsEntriesImportedTo(int count, String vehicle) {
    return 'تم استيراد $count سجل إلى $vehicle';
  }

  @override
  String get homeOverallSummary => 'الملخص العام';

  @override
  String get homeSummary => 'الملخص';

  @override
  String get homeMonitorEfficiency => 'راقب كفاءة وقودك';

  @override
  String get tourVehiclesTitle => 'تبديل المركبة';

  @override
  String get tourVehiclesBody =>
      'اختر «الكل» لعرض إحصاءات مجمّعة، أو حدد مركبة بعينها. اضغط زر + في النهاية لإضافة مركبة جديدة.';

  @override
  String get tourSettingsBody =>
      'من هنا يمكنك تخصيص العملة والمظهر والميزانية الشهرية، ونسخ بياناتك احتياطياً إلى Google Drive.';

  @override
  String get tourStatsBody =>
      'اطّلع بنظرة واحدة على إنفاق هذا الشهر، وتكلفة آخر تعبئة، وعدد الأيام منذ ذلك، وكفاءتك العامة.';

  @override
  String get tourActionsBody =>
      'انتقل إلى سجل الوقود وحاسبة الرحلة وتقارير الميزانية وسجل الصيانة وأدوات أخرى.';

  @override
  String get tourAddFuelBody =>
      'اضغط هنا لتسجيل تعبئة جديدة. ستدخل الكمية والسعر وقراءة العداد.';

  @override
  String get comparisonMetric => 'المؤشر';

  @override
  String get comparisonScroll => 'مرّر';

  @override
  String get comparisonSummary => 'الملخص';

  @override
  String get comparisonSelectTwo => 'اختر مركبتين على الأقل للمقارنة';

  @override
  String get comparisonSubtitle => 'مقارنة الكفاءة';

  @override
  String get historyLoading => 'جارٍ تحميل البيانات...';

  @override
  String get historyLoadingHint => 'يرجى الانتظار ريثما نجلب بياناتك';

  @override
  String get currencyNoResults => 'لم يتم العثور على عملات';

  @override
  String get currencyNoResultsHint => 'جرّب كلمات بحث أخرى';

  @override
  String get mileageCalculationTitle => 'حساب الاستهلاك';

  @override
  String mileageSinceLastFill(String date) {
    return 'منذ آخر تعبئة: $date';
  }

  @override
  String get addFuelNoVehicles => 'لا توجد مركبات. أضف مركبة أولاً.';

  @override
  String budgetProgressLabel(String amount, String percent) {
    return 'الميزانية: $amount  |  $percent% مستخدم';
  }

  @override
  String get howToAutoCalc =>
      'يحسب التطبيق كفاءة الوقود تلقائياً عند إدخال قراءات العداد:';

  @override
  String get deleteEntryMessage =>
      'هل تريد بالتأكيد حذف هذه التعبئة؟ لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get chartNotEnoughData => 'البيانات غير كافية';

  @override
  String get chartAnalytics => 'التحليلات';

  @override
  String entryCardOdometer(String value) {
    return 'العداد: $value كم';
  }

  @override
  String get summaryFillUpTitle => 'ملخص التعبئة';

  @override
  String get unitLong_L => 'لتر';

  @override
  String get unitWord_L => 'لتر';

  @override
  String get unitLong_kg => 'كيلوغرام';

  @override
  String get unitWord_kg => 'كغ';

  @override
  String get unitLong_m3 => 'متر مكعب';

  @override
  String get unitWord_m3 => 'م³';

  @override
  String get unitLong_kWh => 'كيلوواط ساعة';

  @override
  String get unitWord_kWh => 'ك.و.س';

  @override
  String get summaryTotalFuel => 'إجمالي الوقود';

  @override
  String summaryTotalOf(String unit) {
    return 'إجمالي $unit';
  }

  @override
  String get chartCostTrend => 'اتجاه تكلفة الوقود';

  @override
  String get chartConsumption => 'استهلاك الوقود';

  @override
  String get chartEfficiency => 'كفاءة الوقود';

  @override
  String get chartTrend => 'اتجاه الوقود';

  @override
  String chartCostAxis(String currency) {
    return 'التكلفة ($currency)';
  }

  @override
  String get trendCostsUp => 'التكاليف في ارتفاع';

  @override
  String get trendCostsDown => 'التكاليف في انخفاض';

  @override
  String get trendVolumeUp => 'الكمية في ارتفاع';

  @override
  String get trendVolumeDown => 'الكمية في انخفاض';

  @override
  String get trendEfficiencyUp => 'الكفاءة تتحسن';

  @override
  String get trendEfficiencyDown => 'الكفاءة تتراجع';

  @override
  String get addFuelSaveButton => 'حفظ التعبئة';

  @override
  String get addFuelUpdateButton => 'تحديث السجل';

  @override
  String get addFuelSubtitle => 'تابع استهلاكك للوقود';

  @override
  String get addFuelEditSubtitle => 'حدّث سجل التعبئة';

  @override
  String get addFuelAmountRequired => 'يرجى إدخال كمية الوقود';

  @override
  String get addFuelPriceRequired => 'يرجى إدخال السعر لكل وحدة';

  @override
  String get addFuelPositiveNumber => 'يرجى إدخال رقم موجب صالح';

  @override
  String get addFuelCurrentOdometer => 'قراءة العداد الحالية (كم)';

  @override
  String get addFuelOdometerOptional => 'قراءة العداد (كم) - اختياري';

  @override
  String addFuelOdometerTooLow(String value) {
    return 'لا يمكن أن تكون قراءة العداد أقل من آخر قراءة ($value كم)';
  }

  @override
  String get addFuelBackupTitle => 'نسخ البيانات';

  @override
  String get addFuelBackupCloudTitle => 'النسخ إلى السحابة';

  @override
  String get addFuelBackupPrompt => 'هل تريد نسخ بياناتك إلى Google Drive؟';

  @override
  String get addFuelConnectPrompt =>
      'اربط بريد Gmail لنسخ بيانات الوقود إلى Google Drive.';

  @override
  String get addFuelConnectGmail => 'ربط Gmail';

  @override
  String get dateToday => 'اليوم';

  @override
  String get dateYesterday => 'أمس';

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeDark => 'داكن';

  @override
  String get themeSystem => 'النظام';

  @override
  String get commonLoading => 'جارٍ التحميل...';

  @override
  String get settingsConnected => 'متصل';

  @override
  String get settingsConnectDrive => 'ربط Google Drive';

  @override
  String get settingsSignInPrompt =>
      'سجّل الدخول لنسخ بياناتك إلى Google Drive';

  @override
  String get exportShareText => 'تصدير Fuel Cost';

  @override
  String get homeJustStarted => 'البداية للتو';

  @override
  String get homeAlmostThere => 'اقتربت!';

  @override
  String get homeAddFirstEntryHint =>
      'أضف أول تعبئة لتبدأ بتتبع الاستهلاك والتكاليف والاتجاهات.';

  @override
  String homeNoEntriesForVehicle(String vehicle) {
    return 'لا توجد سجلات لـ $vehicle بعد. أضف واحداً لعرض إحصاءاتها.';
  }

  @override
  String homeAddMoreEntries(int count) {
    return 'أضف $count سجلاً آخر للحصول على نظرة أفضل على كفاءتك وتكاليفك واتجاهاتك.';
  }

  @override
  String homeAddMoreEntriesForVehicle(int count, String vehicle) {
    return 'أضف $count سجلاً آخر لـ $vehicle للحصول على استهلاك ورسوم بيانية دقيقة.';
  }

  @override
  String get homeThisVehicle => 'هذه المركبة';

  @override
  String get spendingPeriodA => 'الفترة أ';

  @override
  String get spendingPeriodB => 'الفترة ب';

  @override
  String get spendingPeriodC => 'الفترة ج';

  @override
  String get spendingPeriodD => 'الفترة د';

  @override
  String comparisonFuelOnly(String amount) {
    return '(الوقود $amount)';
  }

  @override
  String get restoreNoDescription => 'بدون وصف';

  @override
  String get restoreNoNotes => 'بدون ملاحظات';

  @override
  String get restoreNotesChanged => 'تغيّرت الملاحظات';

  @override
  String get restoreNoOdometer => 'بدون عداد';

  @override
  String restoreOdometerValue(String value) {
    return 'عداد $value';
  }

  @override
  String get restoreNoTankSize => 'بدون سعة خزان';

  @override
  String get restoreNoNextDueDate => 'بدون موعد قادم';

  @override
  String restoreNextDueDate(String date) {
    return 'الموعد $date';
  }

  @override
  String get restoreNoNextDueOdometer => 'بدون عداد قادم';

  @override
  String restoreNextDueOdometer(String value) {
    return 'الموعد عند $value';
  }

  @override
  String get homeNoEntriesYet => 'لا توجد سجلات بعد';
}
