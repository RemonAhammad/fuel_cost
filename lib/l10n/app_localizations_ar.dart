// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'تكلفة الوقود';

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
  String get howToWelcome => 'مرحباً بك في تكلفة الوقود!';

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
}
