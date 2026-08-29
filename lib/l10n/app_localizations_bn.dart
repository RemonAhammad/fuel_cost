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
}
