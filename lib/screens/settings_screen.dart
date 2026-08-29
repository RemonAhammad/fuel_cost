import 'dart:io';
import 'package:flutter/material.dart';
import '../business_logic/type_labels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:intl/intl.dart';
import '../services/tutorial_service.dart';
import '../services/review_service.dart';
import 'splash_screen.dart';
import 'restore_conflicts_screen.dart';
import '../services/fuel_storage_service.dart';
import '../services/fuel_unit_service.dart';
import '../services/currency_service.dart';
import '../services/drive_backup_service.dart';
import '../services/backup_data_service.dart';
import '../services/budget_service.dart';
import '../services/theme_service.dart';
import '../services/vehicle_service.dart';
import '../models/vehicle.dart';
import '../models/fuel_entry.dart';
import '../providers/theme_provider.dart';
import '../providers/fuel_entries_provider.dart';
import '../providers/summary_providers.dart';
import '../providers/vehicle_provider.dart';
import '../providers/language_provider.dart';
import '../services/language_service.dart';
import '../widgets/widgets.dart';
import '../l10n/app_localizations.dart';


class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  String? _loadingAction;
  String _selectedCurrency = '\$';
  bool _isGoogleSignedIn = false;
  String? _googleEmail;
  DateTime? _lastBackupTime;
  bool _autoBackupEnabled = false;
  double? _monthlyBudget;
  String? _languageCode;
  String _appVersion = '';
  String _buildNumber = '';

  @override
  void initState() {
    super.initState();
    _loadCurrency();
    _checkGoogleDriveStatus();
    _loadBudget();
    _loadAppVersion();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final code = await LanguageService.getLanguageCode();
    if (mounted) setState(() => _languageCode = code);
  }

  Future<void> _showLanguageDialog() async {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // null = follow the device.
    final options = <String?>[null, ...LanguageService.supportedCodes];

    final selected = await showDialog<Object?>(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(AppLocalizations.of(context).settingsLanguage),
        children: options.map((code) {
          final isSelected = _languageCode == code;
          return SimpleDialogOption(
            onPressed: () => Navigator.pop(context, code ?? 'system'),
            child: Row(
              children: [
                Icon(
                  isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                  size: 20,
                  color: isSelected ? const Color(0xFF2196F3) : (isDark ? Colors.white38 : Colors.black26),
                ),
                const SizedBox(width: 12),
                Text(code == null ? AppLocalizations.of(context).settingsLanguageSystem : LanguageService.displayName(code)),
              ],
            ),
          );
        }).toList(),
      ),
    );

    if (selected == null) return; // dismissed
    final code = selected == 'system' ? null : selected as String;
    await ref.read(languageProvider.notifier).setLanguage(code);
    await _loadLanguage();
  }

  Future<void> _loadAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    if (mounted) {
      setState(() {
        _appVersion = info.version;
        _buildNumber = info.buildNumber;
      });
    }
  }

  Future<void> _replayTutorial() async {
    await TutorialService.resetAll();
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const SplashScreen()),
      (route) => false,
    );
  }

  Future<void> _rateApp() async {
    // Tapping this tile is already an opt-in, so skip the gate dialog.
    await ReviewService.requestReview();
    await ReviewService.markRated();
  }

  Future<void> _loadCurrency() async {
    final currency = await CurrencyService.getSelectedCurrency();
    if (mounted) setState(() => _selectedCurrency = currency);
  }

  Future<void> _loadBudget() async {
    final budget = await BudgetService.getMonthlyBudget();
    if (mounted) setState(() => _monthlyBudget = budget);
  }

  Future<void> _showCurrencyDialog() async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return CurrencySelectionDialog(
          selectedCurrency: _selectedCurrency,
          onCurrencySelected: (currency) async {
            await CurrencyService.setSelectedCurrency(currency);
            await _loadCurrency();
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(children: [
                    const Icon(Icons.check_circle, color: Colors.white),
                    const SizedBox(width: 12),
                    Text(AppLocalizations.of(context).settingsCurrencyChanged(currency, CurrencyService.getCurrencyName(currency))),
                  ]),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              );
            }
          },
        );
      },
    );
  }

  Future<void> _showBudgetDialog() async {
    final controller = TextEditingController(text: _monthlyBudget?.toStringAsFixed(0) ?? '');
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final result = await showDialog<double?>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context).budgetSetTitle),
        content: TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*\.?[0-9]*'))],
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context).settingsBudgetLabel(_selectedCurrency),
            prefixIcon: const Icon(Icons.account_balance_wallet),
            hintText: AppLocalizations.of(context).settingsBudgetHint,
          ),
          style: TextStyle(color: isDark ? Colors.white : Colors.black87),
        ),
        actions: [
          if (_monthlyBudget != null)
            TextButton(
              onPressed: () => Navigator.pop(context, -1.0),
              child: Text(AppLocalizations.of(context).commonRemove, style: TextStyle(color: Colors.red)),
            ),
          TextButton(onPressed: () => Navigator.pop(context), child: Text(AppLocalizations.of(context).commonCancel)),
          FilledButton(
            onPressed: () => Navigator.pop(context, double.tryParse(controller.text)),
            child: Text(AppLocalizations.of(context).commonSave),
          ),
        ],
      ),
    );

    if (result != null) {
      if (result == -1.0) {
        await BudgetService.setMonthlyBudget(null);
        setState(() => _monthlyBudget = null);
      } else if (result > 0) {
        await BudgetService.setMonthlyBudget(result);
        setState(() => _monthlyBudget = result);
      }
    }
  }

  Future<void> _showConfirmationDialog({
    required String title,
    required String message,
    required String confirmText,
    required VoidCallback onConfirm,
    Color? confirmColor,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          title: title,
          message: message,
          confirmText: confirmText,
          onConfirm: onConfirm,
          confirmColor: confirmColor,
        );
      },
    );
  }

  Future<void> _clearAllData() async {
    setState(() => _loadingAction = 'clearAllData');
    try {
      await FuelStorageService.clearAllData();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Row(children: [Icon(Icons.check_circle, color: Colors.white), SizedBox(width: 12), Text(AppLocalizations.of(context).settingsAllDataCleared)]),
            backgroundColor: Colors.green, behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).settingsClearFailed(e.toString())), backgroundColor: Colors.red, behavior: SnackBarBehavior.floating));
      }
    } finally {
      if (mounted) setState(() => _loadingAction = null);
    }
  }

  Future<void> _clearFuelEntries() async {
    setState(() => _loadingAction = 'clearEntries');
    try {
      await FuelStorageService.clearFuelEntries();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Row(children: [Icon(Icons.check_circle, color: Colors.white), SizedBox(width: 12), Text(AppLocalizations.of(context).settingsEntriesCleared)]),
            backgroundColor: Colors.green, behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).commonError(e.toString())), backgroundColor: Colors.red, behavior: SnackBarBehavior.floating));
      }
    } finally {
      if (mounted) setState(() => _loadingAction = null);
    }
  }

  Future<void> _clearOdometerData() async {
    setState(() => _loadingAction = 'clearOdometer');
    try {
      await FuelStorageService.clearCurrentOdometer();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Row(children: [Icon(Icons.check_circle, color: Colors.white), SizedBox(width: 12), Text(AppLocalizations.of(context).settingsOdometerCleared)]),
            backgroundColor: Colors.green, behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).commonError(e.toString())), backgroundColor: Colors.red, behavior: SnackBarBehavior.floating));
      }
    } finally {
      if (mounted) setState(() => _loadingAction = null);
    }
  }

  Future<void> _clearAllCache() async {
    setState(() => _loadingAction = 'clearCache');
    try {
      await FuelStorageService.clearAllSharedPreferences();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Row(children: [Icon(Icons.check_circle, color: Colors.white), SizedBox(width: 12), Text(AppLocalizations.of(context).settingsCacheCleared)]),
            backgroundColor: Colors.green, behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).commonError(e.toString())), backgroundColor: Colors.red, behavior: SnackBarBehavior.floating));
      }
    } finally {
      if (mounted) setState(() => _loadingAction = null);
    }
  }

  Future<void> _exportCsv() async {
    final vehicles = await VehicleService.getVehicles();
    if (!mounted) return;

    // Show vehicle selection dialog
    final selectedVehicleId = await _showVehiclePickerDialog(
      title: AppLocalizations.of(context).settingsExportData,
      subtitle: AppLocalizations.of(context).settingsSelectExportVehicle,
      vehicles: vehicles,
    );
    if (selectedVehicleId == null) return; // User cancelled

    setState(() => _loadingAction = 'export');
    try {
      final allEntries = await FuelStorageService.getFuelEntries();

      List<FuelEntry> entriesToExport;
      String fileName;
      if (selectedVehicleId == '__all__') {
        entriesToExport = allEntries;
        fileName = 'fuel_entries_all.csv';
      } else {
        final entryIds = await VehicleService.getEntryIdsForVehicle(selectedVehicleId);
        entriesToExport = allEntries.where((e) => entryIds.contains(e.id)).toList();
        final vehicle = vehicles.firstWhere((v) => v.id == selectedVehicleId);
        fileName = 'fuel_entries_${vehicle.name.replaceAll(' ', '_').toLowerCase()}.csv';
      }

      if (entriesToExport.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Row(children: [Icon(Icons.info_outline, color: Colors.white), SizedBox(width: 12), Text(AppLocalizations.of(context).settingsNothingToExport)]),
              backgroundColor: Colors.orange, behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          );
        }
        return;
      }

      // Shared writer, so this export carries the unit column like every other.
      final csv = FuelStorageService.buildCsv(
        entriesToExport,
        await FuelUnitService.getEntryUnitMap(),
      );

      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/$fileName');
      await file.writeAsString(csv);
      final box = context.findRenderObject() as RenderBox?;
      await Share.shareXFiles([XFile(file.path)], text: 'Fuel Cost Export',
        sharePositionOrigin: box != null ? box.localToGlobal(Offset.zero) & box.size : const Rect.fromLTWH(0, 0, 100, 100));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Row(children: [const Icon(Icons.check_circle, color: Colors.white), const SizedBox(width: 12), Text(AppLocalizations.of(context).settingsEntriesExported(entriesToExport.length))]),
            backgroundColor: Colors.green, behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        );
      }
    } catch (e, stackTrace) {
      debugPrint('Export CSV error: $e\n$stackTrace');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).settingsExportFailed(e.toString())), backgroundColor: Colors.red, behavior: SnackBarBehavior.floating));
      }
    } finally {
      if (mounted) setState(() => _loadingAction = null);
    }
  }

  Future<void> _importCsv() async {
    final vehicles = await VehicleService.getVehicles();
    if (!mounted) return;

    // Show vehicle selection dialog for assigning imported entries
    final selectedVehicleId = await _showVehiclePickerDialog(
      title: AppLocalizations.of(context).settingsImportData,
      subtitle: AppLocalizations.of(context).settingsAssignImported,
      vehicles: vehicles,
      showUnassigned: true,
    );
    if (selectedVehicleId == null) return; // User cancelled

    setState(() => _loadingAction = 'import');
    try {
      final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['csv']);
      if (result == null || result.files.single.path == null) {
        setState(() => _loadingAction = null);
        return;
      }
      final file = File(result.files.single.path!);
      final csvContent = await file.readAsString();

      // Parse and import entries
      final lines = csvContent.trim().split('\n');
      if (lines.length < 2) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context).settingsCsvInvalid), backgroundColor: Colors.red, behavior: SnackBarBehavior.floating));
        }
        return;
      }

      int imported = 0;
      for (int i = 1; i < lines.length; i++) {
        final line = lines[i].trim();
        if (line.isEmpty) continue;
        final parts = line.split(',');
        if (parts.length < 5) continue;
        try {
          final entry = FuelEntry()
            ..id = parts[0]
            ..liters = double.parse(parts[1])
            ..pricePerLiter = double.parse(parts[2])
            ..totalCost = double.parse(parts[3])
            ..dateTime = DateTime.parse(parts[4])
            ..odometerReading = parts.length > 5 && parts[5].isNotEmpty ? double.parse(parts[5]) : null;

          await FuelStorageService.saveFuelEntry(entry);

          // Assign to selected vehicle if not "unassigned"
          if (selectedVehicleId != '__all__' && selectedVehicleId != '__none__') {
            await VehicleService.assignVehicleToEntry(entry.id, selectedVehicleId);
          }
          imported++;
        } catch (e) {
          debugPrint('Skipping invalid CSV row $i: $e');
        }
      }

      if (mounted) {
        final assigned = selectedVehicleId == '__all__' || selectedVehicleId == '__none__'
            ? null
            : vehicles.firstWhere((v) => v.id == selectedVehicleId).name;
        final message = assigned == null
            ? AppLocalizations.of(context).settingsEntriesImported(imported)
            : AppLocalizations.of(context).settingsEntriesImportedTo(imported, assigned);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Row(children: [const Icon(Icons.check_circle, color: Colors.white), const SizedBox(width: 12), Expanded(child: Text(message))]),
            backgroundColor: Colors.green, behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).settingsImportFailed(e.toString())), backgroundColor: Colors.red, behavior: SnackBarBehavior.floating));
      }
    } finally {
      if (mounted) setState(() => _loadingAction = null);
    }
  }

  static const Map<String, IconData> _vehicleIconMap = {
    'directions_car': Icons.directions_car,
    'two_wheeler': Icons.two_wheeler,
    'local_shipping': Icons.local_shipping,
    'airport_shuttle': Icons.airport_shuttle,
    'electric_car': Icons.electric_car,
    'pedal_bike': Icons.pedal_bike,
  };

  /// Shows a dialog to pick a vehicle for export/import.
  /// Returns the vehicle ID, '__all__' for all vehicles, '__none__' for unassigned, or null if cancelled.
  Future<String?> _showVehiclePickerDialog({
    required String title,
    required String subtitle,
    required List<Vehicle> vehicles,
    bool showUnassigned = false,
  }) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subtitle, style: TextStyle(fontSize: 14, color: isDark ? Colors.grey.shade400 : Colors.grey.shade600)),
                const SizedBox(height: 16),
                // All vehicles option
                _buildVehicleOption(
                  context: context,
                  icon: Icons.dashboard_rounded,
                  label: AppLocalizations.of(context).settingsAllVehicles,
                  subtitle: AppLocalizations.of(context).settingsIncludeAllVehicles,
                  color: const Color(0xFF667eea),
                  onTap: () => Navigator.pop(context, '__all__'),
                  isDark: isDark,
                ),
                if (showUnassigned)
                  _buildVehicleOption(
                    context: context,
                    icon: Icons.help_outline,
                    label: AppLocalizations.of(context).settingsNoVehicle,
                    subtitle: AppLocalizations.of(context).settingsNoVehicleSubtitle,
                    color: Colors.grey,
                    onTap: () => Navigator.pop(context, '__none__'),
                    isDark: isDark,
                  ),
                if (vehicles.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Divider(color: isDark ? Colors.grey.shade700 : Colors.grey.shade300),
                  ),
                  ...vehicles.map((v) => _buildVehicleOption(
                        context: context,
                        icon: _vehicleIconMap[v.iconName] ?? Icons.directions_car,
                        label: v.name,
                        subtitle: fuelTypeLabel(context, v.fuelType),
                        color: const Color(0xFF2196F3),
                        onTap: () => Navigator.pop(context, v.id),
                        isDark: isDark,
                      )),
                ],
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text(AppLocalizations.of(context).commonCancel)),
          ],
        );
      },
    );
  }

  Widget _buildVehicleOption({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: isDark ? Colors.white : Colors.black87)),
                  Text(subtitle, style: TextStyle(fontSize: 12, color: isDark ? Colors.grey.shade400 : Colors.grey.shade600)),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: isDark ? Colors.grey.shade600 : Colors.grey.shade400, size: 20),
          ],
        ),
      ),
    );
  }

  Future<void> _checkGoogleDriveStatus() async {
    try {
      final isSignedIn = await DriveBackupService.isSignedIn();
      final autoBackup = await DriveBackupService.isAutoBackupEnabled();
      DateTime? lastBackup;
      String? email;
      if (isSignedIn) {
        lastBackup = await DriveBackupService.getLastBackupTime();
        email = DriveBackupService.currentUser?.email;
      }
      if (mounted) setState(() { _isGoogleSignedIn = isSignedIn; _lastBackupTime = lastBackup; _googleEmail = email; _autoBackupEnabled = autoBackup; });
    } catch (e) {
      debugPrint('Google Drive status check failed: $e');
    }
  }

  Future<void> _googleSignIn() async {
    setState(() => _loadingAction = 'googleSignIn');
    try {
      final account = await DriveBackupService.signIn();
      if (account != null && mounted) {
        setState(() { _isGoogleSignedIn = true; _googleEmail = account.email; });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(children: [const Icon(Icons.check_circle, color: Colors.white), const SizedBox(width: 12), Expanded(child: Text(AppLocalizations.of(context).settingsSignedInAs(account.email)))]),
          backgroundColor: Colors.green, behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))));
      }
    } catch (e) {
      print('Google Sign-In error: $e');
      final msg = e.toString().replaceFirst('Exception: ', '');
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.red, behavior: SnackBarBehavior.floating));
    } finally {
      if (mounted) setState(() => _loadingAction = null);
    }
  }

  Future<void> _googleSignOut() async {
    setState(() => _loadingAction = 'googleSignOut');
    try {
      await DriveBackupService.signOut();
      if (mounted) {
        setState(() { _isGoogleSignedIn = false; _googleEmail = null; _lastBackupTime = null; });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(children: [Icon(Icons.check_circle, color: Colors.white), SizedBox(width: 12), Text(AppLocalizations.of(context).settingsDisconnected)]),
          backgroundColor: Colors.green, behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))));
      }
    } finally {
      if (mounted) setState(() => _loadingAction = null);
    }
  }

  Future<void> _backupToDrive() async {
    setState(() => _loadingAction = 'backup');
    try {
      await DriveBackupService.backupToDrive();
      final now = DateTime.now();
      if (mounted) {
        setState(() => _lastBackupTime = now);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(children: [const Icon(Icons.cloud_done, color: Colors.white), const SizedBox(width: 12), Text(AppLocalizations.of(context).settingsBackupSuccess)]),
          backgroundColor: Colors.green, behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))));
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).settingsBackupFailed(e.toString())), backgroundColor: Colors.red, behavior: SnackBarBehavior.floating));
    } finally {
      if (mounted) setState(() => _loadingAction = null);
    }
  }

  Future<void> _restoreFromDrive() async {
    setState(() => _loadingAction = 'restore');
    try {
      final preview = await DriveBackupService.fetchRestorePreview();

      // Nothing has been written yet. Only interrupt the user when records
      // changed on both sides; otherwise restore stays a single tap.
      var resolution = const ConflictResolution(
        keepLocalEntryIds: {},
        keepLocalVehicleIds: {},
      );
      if (preview.hasConflicts) {
        if (!mounted) return;
        final chosen = await Navigator.of(context).push<ConflictResolution>(
          MaterialPageRoute(
            builder: (context) => RestoreConflictsScreen(preview: preview),
          ),
        );
        if (chosen == null) {
          // Backed out of the review — leave local data untouched.
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(AppLocalizations.of(context).settingsRestoreCancelled),
              backgroundColor: Colors.grey.shade700,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))));
          }
          return;
        }
        resolution = chosen;
      }

      final result = await BackupDataService.applyRestore(
        preview,
        keepLocalEntryIds: resolution.keepLocalEntryIds,
        keepLocalVehicleIds: resolution.keepLocalVehicleIds,
        keepLocalMaintenanceIds: resolution.keepLocalMaintenanceIds,
        keepLocalSettingIds: resolution.keepLocalSettingIds,
      );

      // Restored data lives in Isar + SharedPreferences; drop the cached
      // provider state so Home/History show it without an app restart.
      ref.invalidate(fuelEntriesProvider);
      ref.invalidate(vehiclesProvider);
      // Restored settings need the same treatment, or a new theme/currency
      // sits invisible until the next launch.
      ref.invalidate(currencyNotifierProvider);
      await ref.read(themeProvider.notifier).reload();
      await ref.read(languageProvider.notifier).reload();
      await _loadLanguage();
      await _loadCurrency();
      await _loadBudget();
      if (mounted) {
        final restored = <String>[
          '${result.entries} entries',
          if (result.vehicles > 0) '${result.vehicles} vehicles',
          if (result.maintenance > 0) '${result.maintenance} maintenance',
        ];
        var summary = 'Restored ${restored.join(', ')}';
        if (result.keptLocal > 0) {
          summary += ' · ${result.keptLocal} kept yours';
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(children: [const Icon(Icons.cloud_done, color: Colors.white), const SizedBox(width: 12), Expanded(child: Text(summary))]),
          backgroundColor: Colors.green, behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))));
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).settingsRestoreFailed(e.toString())), backgroundColor: Colors.red, behavior: SnackBarBehavior.floating));
    } finally {
      if (mounted) setState(() => _loadingAction = null);
    }
  }

  String _formatBackupTime(DateTime time) => DateFormat(
        'MMM dd, yyyy HH:mm',
        Localizations.localeOf(context).toLanguageTag(),
      ).format(time);

  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch(themeProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [const Color(0xFF1a1a2e), const Color(0xFF16213e), const Color(0xFF0f3460)]
                : [const Color(0xFF667eea), const Color(0xFF764ba2), const Color(0xFF2196F3)],
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Custom AppBar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
                      child: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
                    ),
                    const SizedBox(width: 16),
                    Expanded(child: Text(AppLocalizations.of(context).settingsTitle, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white))),
                  ],
                ),
              ),

              // Content area
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isDark
                          ? [const Color(0xFF1E1E1E).withValues(alpha: 0.98), const Color(0xFF1E1E1E).withValues(alpha: 0.92)]
                          : [Colors.white.withValues(alpha: 0.98), Colors.white.withValues(alpha: 0.92)],
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                    ),
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: isDark ? Colors.grey.shade800 : Colors.white.withValues(alpha: 0.4), width: 1.5),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 25, offset: const Offset(0, 15), spreadRadius: -5),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context).settingsTitle, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black87)),
                        const SizedBox(height: 8),
                        Text(AppLocalizations.of(context).settingsSubtitle, style: TextStyle(fontSize: 16, color: isDark ? Colors.grey.shade400 : Colors.grey.shade600)),
                        const SizedBox(height: 24),

                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                // Appearance Section
                                CupertinoSection(
                                  title: AppLocalizations.of(context).settingsAppearance,
                                  children: [
                                    CustomCupertinoListTile(
                                      icon: _getThemeIcon(themeState.themeMode),
                                      title: AppLocalizations.of(context).settingsTheme,
                                      subtitle: AppLocalizations.of(context).settingsThemeCurrent(_getThemeLabel(themeState.themeMode)),
                                      onTap: () => _showThemeDialog(),
                                      iconColor: const Color(0xFF9C27B0),
                                      isFirst: true, isLoading: false,
                                    ),
                                    CustomCupertinoListTile(
                                      icon: Icons.palette_outlined,
                                      title: AppLocalizations.of(context).settingsAccentColor,
                                      subtitle: AppLocalizations.of(context).settingsAccentColorSubtitle,
                                      onTap: () => _showAccentColorDialog(),
                                      iconColor: themeState.accentColor,
                                      isLast: true, isLoading: false,
                                      trailing: Container(width: 24, height: 24, decoration: BoxDecoration(color: themeState.accentColor, shape: BoxShape.circle, border: Border.all(color: Colors.grey.shade300, width: 1))),
                                    ),
                                  ],
                                ),

                                // Preferences Section
                                CupertinoSection(
                                  title: AppLocalizations.of(context).settingsPreferences,
                                  children: [
                                    CustomCupertinoListTile(
                                      icon: Icons.currency_exchange,
                                      title: AppLocalizations.of(context).settingsCurrency,
                                      subtitle: AppLocalizations.of(context).settingsCurrencyCurrent(_selectedCurrency, CurrencyService.getCurrencyName(_selectedCurrency)),
                                      onTap: _showCurrencyDialog,
                                      iconColor: const Color(0xFF2196F3),
                                      isFirst: true,
                                    ),
                                    CustomCupertinoListTile(
                                      icon: Icons.language,
                                      title: AppLocalizations.of(context).settingsLanguage,
                                      subtitle: LanguageService.displayName(_languageCode),
                                      onTap: _showLanguageDialog,
                                      iconColor: const Color(0xFF00BCD4),
                                    ),
                                    CustomCupertinoListTile(
                                      icon: Icons.account_balance_wallet,
                                      title: AppLocalizations.of(context).settingsMonthlyBudget,
                                      subtitle: _monthlyBudget != null ? '$_selectedCurrency${_monthlyBudget!.toStringAsFixed(0)} per month' : 'Not set',
                                      onTap: _showBudgetDialog,
                                      iconColor: const Color(0xFFFF9800),
                                      isLast: true, isLoading: false,
                                    ),
                                  ],
                                ),

                                // Export & Import Section
                                CupertinoSection(
                                  title: AppLocalizations.of(context).settingsExportImport,
                                  children: [
                                    CustomCupertinoListTile(
                                      icon: Icons.file_upload_outlined, title: AppLocalizations.of(context).settingsExportToCsv, subtitle: AppLocalizations.of(context).settingsExportSubtitle,
                                      onTap: _exportCsv, iconColor: const Color(0xFF4CAF50), isFirst: true, isLoading: _loadingAction == 'export'),
                                    CustomCupertinoListTile(
                                      icon: Icons.file_download_outlined, title: AppLocalizations.of(context).settingsImportFromCsv, subtitle: AppLocalizations.of(context).settingsImportSubtitle,
                                      onTap: _importCsv,
                                      iconColor: const Color(0xFF2196F3), isLast: true, isLoading: _loadingAction == 'import'),
                                  ],
                                ),

                                // Google Drive Backup Section
                                CupertinoSection(
                                  title: AppLocalizations.of(context).settingsGoogleDriveBackup,
                                  children: [
                                    CustomCupertinoListTile(
                                      icon: _isGoogleSignedIn ? Icons.cloud_done : Icons.cloud_outlined,
                                      title: _isGoogleSignedIn ? 'Connected' : 'Connect Google Drive',
                                      subtitle: _isGoogleSignedIn
                                          ? '${_googleEmail ?? ''}\nLast backup: ${_lastBackupTime != null ? _formatBackupTime(_lastBackupTime!) : "Never"}'
                                          : 'Sign in to backup your data to Google Drive',
                                      onTap: _isGoogleSignedIn ? () {} : _googleSignIn,
                                      iconColor: _isGoogleSignedIn ? Colors.green : const Color(0xFF4285F4),
                                      isFirst: true, isLast: !_isGoogleSignedIn, isLoading: _loadingAction == 'googleSignIn',
                                      trailing: _isGoogleSignedIn
                                          ? const Icon(CupertinoIcons.checkmark_circle_fill, color: Colors.green, size: 20)
                                          : Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                              decoration: BoxDecoration(color: const Color(0xFF4285F4), borderRadius: BorderRadius.circular(16)),
                                              child: Text(AppLocalizations.of(context).commonSignIn, style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600))),
                                    ),
                                    if (_isGoogleSignedIn) ...[
                                      CustomCupertinoListTile(icon: Icons.cloud_upload, title: AppLocalizations.of(context).settingsBackupNow, subtitle: AppLocalizations.of(context).settingsBackupNowSubtitle,
                                        onTap: _backupToDrive, iconColor: const Color(0xFF4CAF50), isLoading: _loadingAction == 'backup'),
                                      CustomCupertinoListTile(
                                        icon: Icons.backup,
                                        title: AppLocalizations.of(context).settingsAutoBackup,
                                        subtitle: AppLocalizations.of(context).settingsAutoBackupSubtitle,
                                        onTap: () async {
                                          final newValue = !_autoBackupEnabled;
                                          await DriveBackupService.setAutoBackup(newValue);
                                          setState(() => _autoBackupEnabled = newValue);
                                        },
                                        iconColor: const Color(0xFF9C27B0),
                                        trailing: CupertinoSwitch(
                                          value: _autoBackupEnabled,
                                          activeTrackColor: const Color(0xFF9C27B0),
                                          onChanged: (value) async {
                                            await DriveBackupService.setAutoBackup(value);
                                            setState(() => _autoBackupEnabled = value);
                                          },
                                        ),
                                      ),
                                      CustomCupertinoListTile(icon: Icons.cloud_download, title: AppLocalizations.of(context).settingsRestoreFromBackup, subtitle: AppLocalizations.of(context).settingsRestoreSubtitle,
                                        onTap: () => _showConfirmationDialog(title: AppLocalizations.of(context).commonRestore, message: AppLocalizations.of(context).settingsRestoreWarning,
                                          confirmText: AppLocalizations.of(context).commonRestore, confirmColor: Colors.orange, onConfirm: _restoreFromDrive),
                                        iconColor: const Color(0xFF2196F3), isLoading: _loadingAction == 'restore'),
                                      CustomCupertinoListTile(icon: Icons.link_off, title: AppLocalizations.of(context).commonDisconnect, subtitle: AppLocalizations.of(context).settingsSignOutSubtitle,
                                        onTap: () => _showConfirmationDialog(title: AppLocalizations.of(context).commonDisconnect, message: AppLocalizations.of(context).settingsAutoBackupOffWarning,
                                          confirmText: AppLocalizations.of(context).commonDisconnect, confirmColor: Colors.red, onConfirm: _googleSignOut),
                                        iconColor: Colors.red, isLast: true, isLoading: _loadingAction == 'googleSignOut'),
                                    ],
                                  ],
                                ),

                                // Data Management Section
                                CupertinoSection(
                                  title: AppLocalizations.of(context).settingsDataManagement,
                                  children: [
                                    CustomCupertinoListTile(icon: Icons.delete_sweep, title: AppLocalizations.of(context).settingsClearEntries, subtitle: AppLocalizations.of(context).settingsClearEntriesSubtitle,
                                      onTap: () => _showConfirmationDialog(title: AppLocalizations.of(context).settingsClearEntries, message: AppLocalizations.of(context).settingsClearEntriesWarning,
                                        confirmText: AppLocalizations.of(context).settingsClearEntriesAction, confirmColor: Colors.orange, onConfirm: _clearFuelEntries),
                                      iconColor: Colors.orange, isFirst: true, isLoading: _loadingAction == 'clearEntries'),
                                    CustomCupertinoListTile(icon: Icons.speed, title: AppLocalizations.of(context).settingsClearOdometer, subtitle: AppLocalizations.of(context).settingsClearOdometerSubtitle,
                                      onTap: () => _showConfirmationDialog(title: AppLocalizations.of(context).settingsClearOdometerAction, message: AppLocalizations.of(context).settingsClearOdometerWarning,
                                        confirmText: AppLocalizations.of(context).settingsClearOdometerAction, confirmColor: Colors.blue, onConfirm: _clearOdometerData),
                                      iconColor: Colors.blue, isLoading: _loadingAction == 'clearOdometer'),
                                    CustomCupertinoListTile(icon: Icons.delete_forever, title: AppLocalizations.of(context).settingsClearAllData, subtitle: AppLocalizations.of(context).settingsClearAllSubtitle,
                                      onTap: () => _showConfirmationDialog(title: AppLocalizations.of(context).settingsClearCacheAction, message: AppLocalizations.of(context).settingsClearAllWarning,
                                        confirmText: AppLocalizations.of(context).settingsClearAllAction, confirmColor: Colors.red, onConfirm: _clearAllData),
                                      iconColor: Colors.red, isLast: true, isLoading: _loadingAction == 'clearAllData'),
                                  ],
                                ),

                                // Advanced Section
                                CupertinoSection(
                                  title: AppLocalizations.of(context).settingsAdvanced,
                                  children: [
                                    CustomCupertinoListTile(icon: Icons.cleaning_services, title: AppLocalizations.of(context).settingsClearAllCache, subtitle: AppLocalizations.of(context).settingsResetSubtitle,
                                      onTap: () => _showConfirmationDialog(title: AppLocalizations.of(context).settingsClearCacheAction, message: AppLocalizations.of(context).settingsResetWarning,
                                        confirmText: AppLocalizations.of(context).settingsResetApp, confirmColor: Colors.purple, onConfirm: _clearAllCache),
                                      iconColor: Colors.purple, isFirst: true, isLast: true, isLoading: _loadingAction == 'clearCache'),
                                  ],
                                ),

                                // About Section
                                CupertinoSection(
                                  title: AppLocalizations.of(context).settingsAbout,
                                  children: [
                                    CustomCupertinoListTile(
                                      icon: Icons.school_outlined,
                                      title: AppLocalizations.of(context).settingsReplayTutorial,
                                      subtitle: AppLocalizations.of(context).settingsReplayTutorialSubtitle,
                                      iconColor: Colors.teal,
                                      isFirst: true,
                                      onTap: _replayTutorial,
                                    ),
                                    CustomCupertinoListTile(
                                      icon: Icons.star_outline,
                                      title: AppLocalizations.of(context).settingsRateApp,
                                      subtitle: AppLocalizations.of(context).settingsRateSubtitle(AppLocalizations.of(context).appTitle),
                                      iconColor: Colors.amber,
                                      onTap: _rateApp,
                                    ),
                                    CustomCupertinoListTile(
                                      icon: Icons.info_outline,
                                      title: AppLocalizations.of(context).settingsAppVersion,
                                      subtitle: _appVersion.isEmpty
                                          ? 'Loading...'
                                          : 'Version $_appVersion (Build $_buildNumber)',
                                      iconColor: Colors.blue,
                                      isLast: true,
                                      onTap: () {},
                                    ),
                                  ],
                                ),

                                if (_loadingAction != null)
                                  Container(
                                    margin: const EdgeInsets.only(top: 16),
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: isDark ? const Color(0xFF1E1E1E) : Colors.white.withValues(alpha: 0.95),
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4))],
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade600))),
                                        const SizedBox(width: 16),
                                        Text(AppLocalizations.of(context).commonProcessing, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: isDark ? Colors.grey.shade300 : Colors.grey.shade700)),
                                      ],
                                    ),
                                  ),
                                const SizedBox(height: 32),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getThemeIcon(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light: return Icons.light_mode;
      case ThemeMode.dark: return Icons.dark_mode;
      case ThemeMode.system: return Icons.brightness_auto;
    }
  }

  String _getThemeLabel(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light: return 'Light';
      case ThemeMode.dark: return 'Dark';
      case ThemeMode.system: return 'System';
    }
  }

  void _showThemeDialog() {
    final themeNotifier = ref.read(themeProvider.notifier);
    final currentMode = ref.read(themeProvider).themeMode;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context).settingsChooseTheme),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: ThemeMode.values.map((mode) {
              return RadioListTile<ThemeMode>(
                title: Text(_getThemeLabel(mode)),
                secondary: Icon(_getThemeIcon(mode)),
                value: mode,
                groupValue: currentMode,
                onChanged: (value) {
                  if (value != null) {
                    themeNotifier.setThemeMode(value);
                    Navigator.pop(context);
                  }
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _showAccentColorDialog() {
    final themeNotifier = ref.read(themeProvider.notifier);
    final currentColor = ref.read(themeProvider).accentColor;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context).settingsChooseAccentColor),
          content: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: ThemeService.accentColors.map((color) {
              // ignore: deprecated_member_use
              final isSelected = color.value == currentColor.value;
              return GestureDetector(
                onTap: () {
                  themeNotifier.setAccentColor(color);
                  Navigator.pop(context);
                },
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(color: isSelected ? Colors.white : Colors.transparent, width: 3),
                    boxShadow: isSelected ? [BoxShadow(color: color.withValues(alpha: 0.5), blurRadius: 8, spreadRadius: 2)] : null,
                  ),
                  child: isSelected ? const Icon(Icons.check, color: Colors.white, size: 22) : null,
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
