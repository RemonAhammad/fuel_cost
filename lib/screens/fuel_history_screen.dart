import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../models/fuel_entry.dart';
import '../models/vehicle.dart';
import '../services/fuel_storage_service.dart';
import '../services/vehicle_service.dart';
import '../services/fuel_unit_service.dart';
import '../business_logic/fuel_unit_resolver.dart';
import '../business_logic/entry_filter.dart';
import '../services/currency_service.dart';
import '../widgets/widgets.dart';
import '../l10n/app_localizations.dart';
import 'add_fuel_screen.dart';

class FuelHistoryScreen extends StatefulWidget {
  const FuelHistoryScreen({super.key});

  @override
  State<FuelHistoryScreen> createState() => _FuelHistoryScreenState();
}

class _FuelHistoryScreenState extends State<FuelHistoryScreen> with TickerProviderStateMixin {
  List<FuelEntry> _entries = [];
  List<FuelEntry> _filteredEntries = [];
  bool _isLoading = true;
  String _currency = '\$';

  List<Vehicle> _vehicles = [];
  Map<String, String> _entryVehicleMap = {}; // entryId -> vehicleId
  FuelUnitResolver _unitResolver = FuelUnitResolver.empty;
  String? _selectedVehicleFilter; // null = "All"
  bool _showFilterInAppBar = false;

  String _searchQuery = '';
  DateFilterPreset _datePreset = DateFilterPreset.all;
  DateTimeRange? _customRange;
  final _searchController = TextEditingController();
  bool _isExporting = false;

  late AnimationController _cardAnimationController;
  late Animation<double> _cardSlideAnimation;
  final _scrollController = ScrollController();
  final _filterChipsKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _cardAnimationController = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);
    _cardSlideAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _cardAnimationController, curve: Curves.easeOutCubic));
    _scrollController.addListener(_onScroll);
    _loadData();
    _loadCurrency();
  }

  @override
  void dispose() {
    _cardAnimationController.dispose();
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_vehicles.isEmpty) return;
    final renderObject = _filterChipsKey.currentContext?.findRenderObject();
    if (renderObject == null || renderObject is! RenderBox || !renderObject.hasSize) return;
    final offset = renderObject.localToGlobal(Offset.zero);
    final appBarBottom = MediaQuery.of(context).padding.top + kToolbarHeight;
    final chipsBottom = offset.dy + renderObject.size.height;
    final shouldShow = chipsBottom < appBarBottom;
    if (shouldShow != _showFilterInAppBar) {
      setState(() => _showFilterInAppBar = shouldShow);
    }
  }

  Future<void> _loadCurrency() async {
    final currency = await CurrencyService.getSelectedCurrency();
    if (mounted) {
      setState(() {
        _currency = currency;
      });
    }
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final entries = await FuelStorageService.getFuelEntries();
      final vehicles = await VehicleService.getVehicles();
      final unitResolver = await FuelUnitResolver.load();
      final entryVehicleMap = <String, String>{};
      for (final entry in entries) {
        final vehicleId = await VehicleService.getVehicleIdForEntry(entry.id);
        if (vehicleId != null) {
          entryVehicleMap[entry.id] = vehicleId;
        }
      }

      setState(() {
        _entries = entries..sort((a, b) => b.dateTime.compareTo(a.dateTime));
        _vehicles = vehicles;
        _entryVehicleMap = entryVehicleMap;
        _unitResolver = unitResolver;
      });
      _applyFilter();
      _cardAnimationController.forward();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(child: Text(AppLocalizations.of(context).historyLoadFailed(e.toString()))),
              ],
            ),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  String _presetLabel(DateFilterPreset preset, AppLocalizations l10n) {
    switch (preset) {
      case DateFilterPreset.all:
        return l10n.dateAll;
      case DateFilterPreset.thisMonth:
        return l10n.dateThisMonth;
      case DateFilterPreset.lastThreeMonths:
        return l10n.dateLastThreeMonths;
      case DateFilterPreset.thisYear:
        return l10n.dateThisYear;
      case DateFilterPreset.custom:
        return l10n.dateCustom;
    }
  }

  DateTimeRange? get _activeRange => _datePreset == DateFilterPreset.custom
      ? _customRange
      : _datePreset.rangeFrom(DateTime.now());

  bool get _hasActiveFilters =>
      _selectedVehicleFilter != null ||
      _searchQuery.trim().isNotEmpty ||
      _datePreset != DateFilterPreset.all;

  void _applyFilter() {
    _filteredEntries = filterEntries(
      entries: _entries,
      entryVehicleMap: _entryVehicleMap,
      vehicleNames: {for (final v in _vehicles) v.id: v.name},
      vehicleId: _selectedVehicleFilter,
      range: _activeRange,
      query: _searchQuery,
    );
  }

  void _refilter() {
    setState(_applyFilter);
    _cardAnimationController.reset();
    _cardAnimationController.forward();
  }

  void _onSearchChanged(String value) {
    _searchQuery = value;
    _refilter();
  }

  Future<void> _onDatePresetChanged(DateFilterPreset preset) async {
    if (preset == DateFilterPreset.custom) {
      final now = DateTime.now();
      final picked = await showDateRangePicker(
        context: context,
        firstDate: DateTime(now.year - 10),
        lastDate: now,
        initialDateRange: _customRange,
      );
      if (picked == null) return;
      _customRange = picked;
    }
    _datePreset = preset;
    _refilter();
  }

  void _clearFilters() {
    _searchController.clear();
    _searchQuery = '';
    _datePreset = DateFilterPreset.all;
    _customRange = null;
    _selectedVehicleFilter = null;
    _refilter();
  }

  void _onVehicleFilterChanged(String? vehicleId) {
    _selectedVehicleFilter = vehicleId;
    _refilter();
  }

  /// Exports the currently filtered entries, so what you share matches what
  /// you're looking at. Settings keeps the export-everything path.
  Future<void> _exportFilteredEntries() async {
    setState(() => _isExporting = true);
    try {
      final csv = FuelStorageService.buildCsv(
        _filteredEntries,
        await FuelUnitService.getEntryUnitMap(),
      );

      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/${_exportFileName()}');
      await file.writeAsString(csv);

      if (!mounted) return;
      final box = context.findRenderObject() as RenderBox?;
      await Share.shareXFiles(
        [XFile(file.path)],
        text: AppLocalizations.of(context).exportShareText,
        sharePositionOrigin: box != null
            ? box.localToGlobal(Offset.zero) & box.size
            : const Rect.fromLTWH(0, 0, 100, 100),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 12),
            Text(AppLocalizations.of(context).historyExported(_filteredEntries.length)),
          ]),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context).historyExportFailed(e.toString())),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ));
      }
    } finally {
      if (mounted) setState(() => _isExporting = false);
    }
  }

  /// Names the file after the selection so exports are distinguishable.
  String _exportFileName() {
    final parts = <String>['fuel_entries'];

    if (_selectedVehicleFilter != null) {
      final vehicle =
          _vehicles.where((v) => v.id == _selectedVehicleFilter).firstOrNull;
      if (vehicle != null) {
        parts.add(vehicle.name.replaceAll(' ', '_').toLowerCase());
      }
    }

    final range = _activeRange;
    if (range != null) {
      final fmt = DateFormat('yyyy-MM-dd');
      parts.add('${fmt.format(range.start)}_${fmt.format(range.end)}');
    }

    return '${parts.join('_')}.csv';
  }

  Widget _buildSearchAndDateFilters(ColorScheme colorScheme, bool isDark) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final horizontal = MediaQuery.of(context).size.width < 400 ? 12.0 : 16.0;

    return Padding(
      padding: EdgeInsets.fromLTRB(horizontal, 0, horizontal, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _searchController,
            onChanged: _onSearchChanged,
            style: TextStyle(color: colorScheme.onSurface, fontSize: 14),
            decoration: InputDecoration(
              isDense: true,
              // Says what it actually matches: FuelEntry has no notes field,
              // so this is not free-text search.
              hintText: l10n.historySearchHint,
              hintStyle: TextStyle(
                color: colorScheme.onSurface.withValues(alpha: 0.5),
                fontSize: 14,
              ),
              prefixIcon: Icon(Icons.search, size: 20, color: colorScheme.primary),
              suffixIcon: _searchQuery.isEmpty
                  ? null
                  : IconButton(
                      icon: const Icon(Icons.clear, size: 18),
                      onPressed: () {
                        _searchController.clear();
                        _onSearchChanged('');
                      },
                    ),
              filled: true,
              fillColor: isDark
                  ? Colors.white.withValues(alpha: 0.05)
                  : Colors.black.withValues(alpha: 0.04),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: DateFilterPreset.values.map((preset) {
                final isSelected = _datePreset == preset;
                final label = preset == DateFilterPreset.custom &&
                        _customRange != null &&
                        isSelected
                    ? '${DateFormat('MMM d', locale).format(_customRange!.start)} – ${DateFormat('MMM d', locale).format(_customRange!.end)}'
                    : _presetLabel(preset, l10n);
                return Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8),
                  child: ChoiceChip(
                    label: Text(label, style: const TextStyle(fontSize: 12.5)),
                    selected: isSelected,
                    onSelected: (_) => _onDatePresetChanged(preset),
                    selectedColor: colorScheme.primary.withValues(alpha: 0.2),
                    visualDensity: VisualDensity.compact,
                  ),
                );
              }).toList(),
            ),
          ),
          if (_hasActiveFilters)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Row(
                children: [
                  Icon(Icons.filter_alt_outlined,
                      size: 15, color: colorScheme.onSurface.withValues(alpha: 0.6)),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      l10n.historyFilteredCount(_filteredEntries.length, _entries.length),
                      style: TextStyle(
                        fontSize: 12.5,
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _clearFilters,
                    style: TextButton.styleFrom(
                      visualDensity: VisualDensity.compact,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: Text(l10n.commonClear, style: const TextStyle(fontSize: 12.5)),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Vehicle? _getVehicleForEntry(FuelEntry entry) {
    final vehicleId = _entryVehicleMap[entry.id];
    if (vehicleId == null) return null;
    try {
      return _vehicles.firstWhere((v) => v.id == vehicleId);
    } catch (_) {
      return null;
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

  IconData _getVehicleIcon(Vehicle? vehicle) {
    if (vehicle == null) return Icons.local_gas_station_rounded;
    return _vehicleIconMap[vehicle.iconName] ?? Icons.directions_car;
  }

  Future<void> _deleteEntry(String id) async {
    try {
      // First delete locally (this should always work)
      await FuelStorageService.deleteFuelEntry(id);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                const SizedBox(width: 12),
                Text(AppLocalizations.of(context).historyEntryDeleted),
              ],
            ),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
      }

      // API calls commented out

      // Reload data to refresh the UI
      await _loadData();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(child: Text(AppLocalizations.of(context).historyDeleteFailed(e.toString()))),
              ],
            ),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.brightness == Brightness.dark ? const Color(0xFF121212) : Colors.grey[50],
      appBar: AppBar(
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: _showFilterInAppBar && _vehicles.isNotEmpty
              ? SizedBox(
                  key: const ValueKey('filter'),
                  height: 36,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildAppBarFilterChip(label: AppLocalizations.of(context).commonAll, icon: Icons.select_all_rounded, isSelected: _selectedVehicleFilter == null, onTap: () => _onVehicleFilterChanged(null)),
                      ..._vehicles.map((v) => _buildAppBarFilterChip(
                        label: v.name,
                        icon: _vehicleIconMap[v.iconName] ?? Icons.directions_car,
                        isSelected: _selectedVehicleFilter == v.id,
                        onTap: () => _onVehicleFilterChanged(v.id),
                      )),
                    ],
                  ),
                )
              : Text(
                  AppLocalizations.of(context).historyTitle,
                  key: const ValueKey('title'),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, letterSpacing: 0.5, color: Colors.white),
                ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: !_showFilterInAppBar || _vehicles.isEmpty,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          // Exports exactly what the filters are showing; pointless (and
          // misleading) when that's nothing.
          IconButton(
            icon: const Icon(Icons.ios_share, color: Colors.white),
            tooltip: AppLocalizations.of(context).historyExportTooltip,
            onPressed: _filteredEntries.isEmpty || _isExporting
                ? null
                : _exportFilteredEntries,
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [
                const Color(0xFF667eea),
                const Color(0xFF764ba2),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF667eea).withValues(alpha: 0.3),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
        ),
      ),
      body: _isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: theme.brightness == Brightness.dark ? const Color(0xFF1E1E1E) : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: const Color(0xFF667eea),
                            strokeWidth: 4,
                            backgroundColor: Colors.grey.withValues(alpha: 0.2),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          AppLocalizations.of(context).historyLoading,
                          style: TextStyle(color: theme.brightness == Brightness.dark ? Colors.grey.shade300 : Colors.grey[700], fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          AppLocalizations.of(context).historyLoadingHint,
                          style: TextStyle(color: Colors.grey[500], fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: _loadData,
              child: CustomScrollView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),

                  // Vehicle filter chips
                  if (_vehicles.isNotEmpty)
                    SliverToBoxAdapter(
                      child: SizedBox(
                        key: _filterChipsKey,
                        height: 40,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width < 400 ? 12 : 16),
                          children: [
                            _buildFilterChip(
                              label: AppLocalizations.of(context).commonAll,
                              icon: Icons.select_all_rounded,
                              isSelected: _selectedVehicleFilter == null,
                              onTap: () => _onVehicleFilterChanged(null),
                              colorScheme: colorScheme,
                            ),
                            ..._vehicles.map((vehicle) {
                              return _buildFilterChip(
                                label: vehicle.name,
                                icon: _vehicleIconMap[vehicle.iconName] ?? Icons.directions_car,
                                isSelected: _selectedVehicleFilter == vehicle.id,
                                onTap: () => _onVehicleFilterChanged(vehicle.id),
                                colorScheme: colorScheme,
                              );
                            }),
                          ],
                        ),
                      ),
                    ),

                  if (_vehicles.isNotEmpty)
                    const SliverToBoxAdapter(child: SizedBox(height: 8)),

                  SliverToBoxAdapter(child: _buildSearchAndDateFilters(colorScheme, theme.brightness == Brightness.dark)),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width < 400 ? 12 : 16),
                      child: Row(
                        children: [
                          Icon(Icons.history, color: colorScheme.primary, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            AppLocalizations.of(context).historyRecentEntries,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width < 400 ? 16 : 18,
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const Spacer(),
                          if (_filteredEntries.isNotEmpty)
                            Text(
                              AppLocalizations.of(context).historyEntryCount(_filteredEntries.length),
                              style: TextStyle(color: colorScheme.onSurface.withValues(alpha: 0.6), fontSize: 14),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 12)),
                  _filteredEntries.isEmpty
                      ? SliverFillRemaining(
                          child: EmptyStateWidget(
                            icon: Icons.local_gas_station_rounded,
                            title: _entries.isNotEmpty && _hasActiveFilters
                                ? AppLocalizations.of(context).historyNoMatches
                                : AppLocalizations.of(context).historyNoEntriesYet,
                            subtitle: _entries.isNotEmpty && _hasActiveFilters
                                ? AppLocalizations.of(context).historyNoMatchesSubtitle
                                : AppLocalizations.of(context).historyNoEntriesSubtitle,
                          ),
                        )
                      : SliverList(
                          delegate: SliverChildBuilderDelegate((context, index) {
                            final entry = _filteredEntries[index];
                            final vehicle = _getVehicleForEntry(entry);
                            return FuelEntryCard(
                              entry: entry,
                              currency: _currency,
                              onDelete: () => _showDeleteDialog(entry.id),
                              onEdit: () => _editEntry(entry),
                              onChangeTime: () => _changeEntryTime(entry),
                              index: index,
                              animation: _cardSlideAnimation,
                              vehicleIcon: _getVehicleIcon(vehicle),
                              vehicleName: vehicle?.name,
                              unit: _unitResolver.unitFor(entry.id),
                            );
                          }, childCount: _filteredEntries.length),
                        ),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                ],
              ),
            ),
    );
  }








  Widget _buildAppBarFilterChip({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 8),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.4),
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 16, color: isSelected ? const Color(0xFF667eea) : Colors.white.withValues(alpha: 0.9)),
              const SizedBox(width: 5),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? const Color(0xFF667eea) : Colors.white.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
    required ColorScheme colorScheme,
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 8),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? colorScheme.primary
                : Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFF1E1E1E)
                    : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected
                  ? colorScheme.primary
                  : Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey.shade700
                      : Colors.grey.withValues(alpha: 0.3),
              width: 1.5,
            ),
            boxShadow: isSelected
                ? [BoxShadow(color: colorScheme.primary.withValues(alpha: 0.3), blurRadius: 8, offset: const Offset(0, 2))]
                : [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 1))],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: isSelected ? Colors.white : colorScheme.onSurface.withValues(alpha: 0.7)),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : colorScheme.onSurface.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _changeEntryTime(FuelEntry entry) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: entry.dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate == null || !mounted) return;

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(entry.dateTime),
    );
    if (pickedTime == null || !mounted) return;

    final newDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    entry.dateTime = newDateTime;
    await FuelStorageService.updateFuelEntry(entry);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).historyTimeUpdated),
          backgroundColor: Colors.green,
        ),
      );
    }
    _loadData();
  }

  void _editEntry(FuelEntry entry) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddFuelScreen(existingEntry: entry)),
    );
    _loadData();
  }

  void _showDeleteDialog(String entryId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DeleteConfirmationDialog(
          onConfirm: () => _deleteEntry(entryId),
        );
      },
    );
  }


}
