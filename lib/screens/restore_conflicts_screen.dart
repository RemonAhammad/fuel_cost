import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/fuel_entry.dart';
import '../models/vehicle.dart';
import '../models/fuel_unit.dart';
import '../services/backup_data_service.dart';
import '../services/currency_service.dart';

/// Result of the review: which conflicts the user chose to keep local.
class ConflictResolution {
  final Set<String> keepLocalEntryIds;
  final Set<String> keepLocalVehicleIds;

  const ConflictResolution({
    required this.keepLocalEntryIds,
    required this.keepLocalVehicleIds,
  });
}

/// Side-by-side review of records that exist both locally and in the backup
/// with different values. Pops a [ConflictResolution], or null if the user
/// backs out — in which case the caller must write nothing.
class RestoreConflictsScreen extends StatefulWidget {
  final RestorePreview preview;

  const RestoreConflictsScreen({super.key, required this.preview});

  @override
  State<RestoreConflictsScreen> createState() => _RestoreConflictsScreenState();
}

class _RestoreConflictsScreenState extends State<RestoreConflictsScreen> {
  /// Ids the user wants to keep local. Empty = take the backup everywhere,
  /// which is the default the plan calls for.
  final Set<String> _keepLocalEntryIds = {};
  final Set<String> _keepLocalVehicleIds = {};

  String _currency = '\$';
  final _dateFormat = DateFormat('MMM dd, yyyy');

  @override
  void initState() {
    super.initState();
    _loadCurrency();
  }

  Future<void> _loadCurrency() async {
    final currency = await CurrencyService.getSelectedCurrency();
    if (mounted) setState(() => _currency = currency);
  }

  void _keepAllMine() {
    setState(() {
      _keepLocalEntryIds
        ..clear()
        ..addAll(widget.preview.entryConflicts.map((c) => c.id));
      _keepLocalVehicleIds
        ..clear()
        ..addAll(widget.preview.vehicleConflicts.map((c) => c.id));
    });
  }

  void _useBackupForAll() {
    setState(() {
      _keepLocalEntryIds.clear();
      _keepLocalVehicleIds.clear();
    });
  }

  void _confirm() {
    Navigator.of(context).pop(ConflictResolution(
      keepLocalEntryIds: Set.of(_keepLocalEntryIds),
      keepLocalVehicleIds: Set.of(_keepLocalVehicleIds),
    ));
  }

  String _money(double amount) =>
      CurrencyService.formatCurrencyWith(_currency, amount);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final preview = widget.preview;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Conflicts'),
        actions: [
          TextButton(
            onPressed: _confirm,
            child: const Text('CONFIRM'),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSummary(isDark),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              children: [
                if (preview.vehicleConflicts.isNotEmpty) ...[
                  _sectionHeader('Vehicles', preview.vehicleConflicts.length),
                  ...preview.vehicleConflicts
                      .map((c) => _buildVehicleConflict(c, isDark)),
                  const SizedBox(height: 8),
                ],
                if (preview.entryConflicts.isNotEmpty) ...[
                  _sectionHeader('Fuel Entries', preview.entryConflicts.length),
                  ...preview.entryConflicts
                      .map((c) => _buildEntryConflict(c, isDark)),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummary(bool isDark) {
    final preview = widget.preview;
    final parts = <String>[
      '${preview.conflictCount} ${preview.conflictCount == 1 ? 'conflict' : 'conflicts'}',
      if (preview.newCount > 0) '${preview.newCount} new',
      if (preview.identicalCount > 0) '${preview.identicalCount} unchanged',
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      color: isDark ? Colors.white.withValues(alpha: 0.04) : Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            parts.join(' · '),
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          const SizedBox(height: 4),
          Text(
            'These records changed on both sides. Pick which version to keep — '
            'new records are added automatically.',
            style: TextStyle(
              fontSize: 12.5,
              color: isDark ? Colors.white70 : Colors.black54,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _useBackupForAll,
                  child: const Text('Use backup for all'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                  onPressed: _keepAllMine,
                  child: const Text('Keep all mine'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title, int count) => Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 6),
        child: Text(
          '$title ($count)',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
      );

  Widget _buildVehicleConflict(VehicleConflict conflict, bool isDark) {
    final keepLocal = _keepLocalVehicleIds.contains(conflict.id);
    return _ConflictCard(
      isDark: isDark,
      title: conflict.local.name == conflict.backup.name
          ? conflict.local.name
          : '${conflict.local.name} → ${conflict.backup.name}',
      subtitle: 'Vehicle',
      keepLocal: keepLocal,
      mineDetail: _vehicleDetail(conflict.local, conflict.backup),
      backupDetail: _vehicleDetail(conflict.backup, conflict.local),
      onChanged: (mine) => setState(() {
        if (mine) {
          _keepLocalVehicleIds.add(conflict.id);
        } else {
          _keepLocalVehicleIds.remove(conflict.id);
        }
      }),
    );
  }

  /// Describes [v], listing only the fields that differ from [other] so the
  /// actual change is what stands out.
  String _vehicleDetail(Vehicle v, Vehicle other) {
    final parts = <String>[];
    if (v.name != other.name) parts.add(v.name);
    if (v.fuelType != other.fuelType) {
      parts.add(Vehicle.fuelTypes[v.fuelType] ?? v.fuelType);
    }
    if (v.iconName != other.iconName) {
      parts.add(Vehicle.vehicleIcons[v.iconName]?.label ?? v.iconName);
    }
    if (v.unitId != other.unitId) parts.add('sold by ${v.fuelUnit.short}');
    if (v.tankCapacity != other.tankCapacity) {
      parts.add(v.tankCapacity == null
          ? 'no tank size'
          : '${v.tankCapacity!.toStringAsFixed(0)} ${v.fuelUnit.short} tank');
    }
    return parts.isEmpty ? 'unchanged' : parts.join(' · ');
  }

  Widget _buildEntryConflict(EntryConflict conflict, bool isDark) {
    final keepLocal = _keepLocalEntryIds.contains(conflict.id);
    return _ConflictCard(
      isDark: isDark,
      title: _dateFormat.format(conflict.backup.dateTime),
      subtitle: '${conflict.backup.liters.toStringAsFixed(2)} ${conflict.backupUnit.short}',
      keepLocal: keepLocal,
      mineDetail: _entryDetail(
        conflict.local,
        conflict.backup,
        conflict.localVehicleId,
        conflict.backupVehicleId,
        conflict.localUnit,
        conflict.backupUnit,
      ),
      backupDetail: _entryDetail(
        conflict.backup,
        conflict.local,
        conflict.backupVehicleId,
        conflict.localVehicleId,
        conflict.backupUnit,
        conflict.localUnit,
      ),
      onChanged: (mine) => setState(() {
        if (mine) {
          _keepLocalEntryIds.add(conflict.id);
        } else {
          _keepLocalEntryIds.remove(conflict.id);
        }
      }),
    );
  }

  /// Describes [e], listing only what differs from [other].
  String _entryDetail(
    FuelEntry e,
    FuelEntry other,
    String? vehicleId,
    String? otherVehicleId,
    FuelUnit unit,
    FuelUnit otherUnit,
  ) {
    final parts = <String>[];
    if (e.totalCost != other.totalCost) parts.add(_money(e.totalCost));
    // A unit change alone is worth showing with the quantity, since the same
    // number means something different in L and kWh.
    if (e.liters != other.liters || unit != otherUnit) {
      parts.add('${e.liters.toStringAsFixed(2)} ${unit.short}');
    }
    if (e.pricePerLiter != other.pricePerLiter) {
      parts.add('${_money(e.pricePerLiter)}/${unit.short}');
    }
    if (e.odometerReading != other.odometerReading) {
      parts.add(e.odometerReading == null
          ? 'no odometer'
          : 'odo ${e.odometerReading!.toStringAsFixed(0)}');
    }
    if (!e.dateTime.isAtSameMomentAs(other.dateTime)) {
      parts.add(DateFormat('MMM dd, HH:mm').format(e.dateTime));
    }
    if (vehicleId != otherVehicleId) {
      parts.add(vehicleId == null ? 'unassigned' : 'different vehicle');
    }
    return parts.isEmpty ? 'unchanged' : parts.join(' · ');
  }
}

/// One conflict: an identity line plus two selectable rows, Mine and Backup.
class _ConflictCard extends StatelessWidget {
  final bool isDark;
  final String title;
  final String subtitle;
  final bool keepLocal;
  final String mineDetail;
  final String backupDetail;
  final ValueChanged<bool> onChanged;

  const _ConflictCard({
    required this.isDark,
    required this.title,
    required this.subtitle,
    required this.keepLocal,
    required this.mineDetail,
    required this.backupDetail,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 14)),
                const SizedBox(width: 8),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: isDark ? Colors.white60 : Colors.black54,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _option(
              context,
              label: 'Mine',
              detail: mineDetail,
              selected: keepLocal,
              onTap: () => onChanged(true),
            ),
            const SizedBox(height: 6),
            _option(
              context,
              label: 'Backup',
              detail: backupDetail,
              selected: !keepLocal,
              onTap: () => onChanged(false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _option(
    BuildContext context, {
    required String label,
    required String detail,
    required bool selected,
    required VoidCallback onTap,
  }) {
    final accent = Theme.of(context).colorScheme.primary;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected
                ? accent
                : (isDark ? Colors.white24 : Colors.black12),
            width: selected ? 1.6 : 1,
          ),
          color: selected ? accent.withValues(alpha: 0.08) : null,
        ),
        child: Row(
          children: [
            Icon(
              selected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              size: 18,
              color: selected
                  ? accent
                  : (isDark ? Colors.white38 : Colors.black26),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 56,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
            Expanded(
              child: Text(
                detail,
                style: TextStyle(
                  fontSize: 12.5,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
