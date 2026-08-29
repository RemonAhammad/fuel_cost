import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fuel_cost/models/fuel_entry.dart';
import 'package:fuel_cost/models/maintenance_entry.dart';
import 'package:fuel_cost/services/backup_data_service.dart';
import 'package:fuel_cost/services/maintenance_service.dart';

MaintenanceEntry maint(
  String id, {
  String type = 'oil_change',
  String description = 'Routine oil change',
  double cost = 2500,
  double? mileage = 45000,
  String? vehicleId = 'car',
  String? notes,
  double? nextDueMileage,
  DateTime? nextDueDate,
  DateTime? at,
}) =>
    MaintenanceEntry(
      id: id,
      vehicleId: vehicleId,
      type: type,
      description: description,
      cost: cost,
      mileage: mileage,
      dateTime: at ?? DateTime(2026, 8, 12),
      notes: notes,
      nextDueMileage: nextDueMileage,
      nextDueDate: nextDueDate,
    );

RestorePreview run({
  List<MaintenanceEntry> backupMaintenance = const [],
  List<MaintenanceEntry> localMaintenance = const [],
  Map<String, Object?> backupSettings = const {},
  Map<String, Object?> localSettings = const {},
}) =>
    BackupDataService.diff(
      backupEntries: const <FuelEntry>[],
      backupVehicles: const [],
      backupEntryVehicleMap: const {},
      selectedVehicleId: null,
      localEntries: const <FuelEntry>[],
      localVehicles: const [],
      localEntryVehicleMap: const {},
      backupMaintenance: backupMaintenance,
      localMaintenance: localMaintenance,
      backupSettings: backupSettings,
      localSettings: localSettings,
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('maintenance conflicts', () {
    test('identical records are skipped', () {
      final preview = run(
        backupMaintenance: [maint('m1')],
        localMaintenance: [maint('m1')],
      );
      expect(preview.hasConflicts, isFalse);
      expect(preview.identicalMaintenance, 1);
    });

    test('a changed cost is a conflict', () {
      final preview = run(
        backupMaintenance: [maint('m1', cost: 3000)],
        localMaintenance: [maint('m1', cost: 2500)],
      );
      expect(preview.maintenanceConflicts, hasLength(1));
      expect(preview.maintenanceConflicts.single.local.cost, 2500);
      expect(preview.maintenanceConflicts.single.backup.cost, 3000);
    });

    test('a changed next-due date is a conflict', () {
      final preview = run(
        backupMaintenance: [maint('m1', nextDueDate: DateTime(2027, 2, 1))],
        localMaintenance: [maint('m1')],
      );
      expect(preview.maintenanceConflicts, hasLength(1));
    });

    test('a reassigned vehicle is a conflict', () {
      final preview = run(
        backupMaintenance: [maint('m1', vehicleId: 'bike')],
        localMaintenance: [maint('m1', vehicleId: 'car')],
      );
      expect(preview.maintenanceConflicts, hasLength(1));
    });

    test('backup-only records are added without asking', () {
      final preview = run(backupMaintenance: [maint('new1')]);
      expect(preview.hasConflicts, isFalse);
      expect(preview.newMaintenance.single.id, 'new1');
    });

    test('local-only records are left alone', () {
      final preview = run(localMaintenance: [maint('mine')]);
      expect(preview.hasConflicts, isFalse);
      expect(preview.newMaintenance, isEmpty);
    });
  });

  group('settings', () {
    test('a value this device never set is applied silently', () {
      // The important rule: a fresh install must not be interrogated about
      // settings it never had an opinion on.
      final preview = run(backupSettings: {'currency': '৳'});
      expect(preview.hasConflicts, isFalse);
      expect(preview.settingsToApply['currency'], '৳');
    });

    test('a matching value is neither applied nor surfaced', () {
      final preview = run(
        backupSettings: {'currency': '৳'},
        localSettings: {'currency': '৳'},
      );
      expect(preview.hasConflicts, isFalse);
      expect(preview.settingsToApply, isEmpty);
    });

    test('a differing value is a conflict the user resolves', () {
      final preview = run(
        backupSettings: {'currency': '৳'},
        localSettings: {'currency': '\$'},
      );
      expect(preview.settingConflicts, hasLength(1));
      final conflict = preview.settingConflicts.single;
      expect(conflict.id, 'currency');
      expect(conflict.label, 'Currency');
      expect(conflict.localDisplay, '\$');
      expect(conflict.backupDisplay, '৳');
      expect(preview.settingsToApply, isEmpty);
    });

    test('a setting absent from the backup changes nothing', () {
      final preview = run(localSettings: {'currency': '\$'});
      expect(preview.hasConflicts, isFalse);
      expect(preview.settingsToApply, isEmpty);
    });

    test('formats budget, theme and accent colour for display', () {
      final preview = run(
        backupSettings: {
          'monthlyBudget': 5000.0,
          'themeMode': 'dark',
          'accentColor': 0xFF2196F3,
        },
        localSettings: {
          'monthlyBudget': 8000.0,
          'themeMode': 'light',
          'accentColor': 0xFFE91E63,
        },
      );
      final byId = {for (final c in preview.settingConflicts) c.id: c};
      expect(byId['monthlyBudget']!.backupDisplay, '5000');
      expect(byId['themeMode']!.backupDisplay, 'Dark');
      expect(byId['accentColor']!.backupDisplay, '#2196F3');
      expect(byId['monthlyBudget']!.label, 'Monthly Budget');
    });
  });

  group('backward compatibility', () {
    test('a v3 backup with no maintenance or settings analyzes cleanly', () {
      final preview = run(
        localMaintenance: [maint('m1')],
        localSettings: {'currency': '৳', 'themeMode': 'dark'},
      );
      expect(preview.hasConflicts, isFalse);
      expect(preview.conflictCount, 0);
      expect(preview.newMaintenance, isEmpty);
      expect(preview.settingsToApply, isEmpty);
    });
  });

  group('mergeMaintenanceEntries', () {
    test('backup wins on id, local-only kept', () async {
      SharedPreferences.setMockInitialValues({
        'maintenance_entries': MaintenanceEntry.listToJson([
          maint('m1', description: 'Old'),
          maint('local', description: 'Local Only'),
        ]),
      });

      await MaintenanceService.mergeMaintenanceEntries([
        maint('m1', description: 'From Backup'),
        maint('m2', description: 'New From Backup'),
      ]);

      final result = await MaintenanceService.getMaintenanceEntries();
      final byId = {for (final e in result) e.id: e.description};
      expect(byId.length, 3);
      expect(byId['m1'], 'From Backup');
      expect(byId['local'], 'Local Only');
      expect(byId['m2'], 'New From Backup');
    });
  });
}
