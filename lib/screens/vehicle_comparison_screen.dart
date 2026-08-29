import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/fuel_entries_provider.dart';
import '../providers/vehicle_provider.dart';
import '../services/vehicle_service.dart';
import '../services/currency_service.dart';
import '../models/vehicle.dart';
import '../models/fuel_entry.dart';
import '../business_logic/fuel_calculations.dart';
import '../models/fuel_unit.dart';
import '../l10n/app_localizations.dart';
import '../services/maintenance_service.dart';

const Map<String, IconData> _vehicleIconMap = {
  'directions_car': Icons.directions_car,
  'two_wheeler': Icons.two_wheeler,
  'local_shipping': Icons.local_shipping,
  'airport_shuttle': Icons.airport_shuttle,
  'electric_car': Icons.electric_car,
  'pedal_bike': Icons.pedal_bike,
};

const List<Color> _vehicleColors = [
  Color(0xFF667eea),
  Color(0xFFE91E63),
  Color(0xFF4CAF50),
  Color(0xFFFF9800),
  Color(0xFF9C27B0),
];

class _VehicleStats {
  final String vehicleId;
  final String vehicleName;
  final double totalCost;
  final double totalLiters;
  final int fillUpCount;
  final double avgCostPerFill;
  final double avgPricePerLiter;
  final double overallMileage;
  final double totalDistance;
  /// All-in: (fuel + maintenance) / distance.
  final double costPerKm;

  /// Fuel-only cost/km, kept so the split stays explainable.
  final double fuelCostPerKm;
  final double maintenanceCost;
  final int maintenanceCount;
  final FuelUnit unit;

  _VehicleStats({
    required this.vehicleId,
    required this.vehicleName,
    required this.totalCost,
    required this.totalLiters,
    required this.fillUpCount,
    required this.avgCostPerFill,
    required this.avgPricePerLiter,
    required this.overallMileage,
    required this.totalDistance,
    required this.costPerKm,
    required this.fuelCostPerKm,
    required this.maintenanceCost,
    required this.maintenanceCount,
    required this.unit,
  });
}

class VehicleComparisonScreen extends ConsumerStatefulWidget {
  const VehicleComparisonScreen({super.key});

  @override
  ConsumerState<VehicleComparisonScreen> createState() =>
      _VehicleComparisonScreenState();
}

class _VehicleComparisonScreenState
    extends ConsumerState<VehicleComparisonScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fadeAnimation;

  Set<String> _selectedVehicleIds = {};
  String _currency = '\$';
  Map<String, _VehicleStats> _vehicleStats = {};
  bool _isLoadingStats = false;
  bool _didAutoSelect = false;

  @override
  void initState() {
    super.initState();
    _loadCurrency();
    _animController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation =
        CurvedAnimation(parent: _animController, curve: Curves.easeInOut);
    _animController.forward();
  }

  Future<void> _loadCurrency() async {
    final currency = await CurrencyService.getSelectedCurrency();
    if (mounted) setState(() => _currency = currency);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Color _colorForVehicle(String vehicleId, List<Vehicle> vehicles) {
    final index = vehicles.indexWhere((v) => v.id == vehicleId);
    if (index < 0) return _vehicleColors[0];
    return _vehicleColors[index % _vehicleColors.length];
  }

  Future<void> _computeStats(List<FuelEntry> allEntries) async {
    if (_selectedVehicleIds.length < 2) {
      setState(() => _vehicleStats = {});
      return;
    }

    setState(() => _isLoadingStats = true);

    final vehicles = await VehicleService.getVehicles();
    final Map<String, _VehicleStats> stats = {};

    for (final vehicleId in _selectedVehicleIds) {
      final vehicle = vehicles.where((v) => v.id == vehicleId).firstOrNull;
      if (vehicle == null) continue;

      final entryIds = await VehicleService.getEntryIdsForVehicle(vehicleId);
      final vehicleEntries =
          allEntries.where((e) => entryIds.contains(e.id)).toList();

      double totalCost = 0;
      double totalLiters = 0;
      double sumPricePerLiter = 0;

      for (final e in vehicleEntries) {
        totalCost += e.totalCost;
        totalLiters += e.liters;
        sumPricePerLiter += e.pricePerLiter;
      }

      final fillUpCount = vehicleEntries.length;
      final avgCostPerFill = fillUpCount > 0 ? totalCost / fillUpCount : 0.0;
      final avgPricePerLiter =
          fillUpCount > 0 ? sumPricePerLiter / fillUpCount : 0.0;

      final mileageMetrics =
          FuelCalculations.calculateMileageMetrics(vehicleEntries, totalLiters);
      final totalDistance = mileageMetrics['totalDistance'] ?? 0.0;
      final overallMileage = mileageMetrics['overallMileage'] ?? 0.0;
      // Servicing is part of what a vehicle costs to run, so cost/km counts
      // both. Entries with no vehicleId belong to no vehicle and are excluded.
      final maintenanceEntries =
          await MaintenanceService.getEntriesForVehicle(vehicleId);
      final maintenanceCost =
          MaintenanceService.getTotalMaintenanceCost(maintenanceEntries);
      final costPerKm = FuelCalculations.runningCostPerKm(
        fuelCost: totalCost,
        maintenanceCost: maintenanceCost,
        distance: totalDistance,
      );
      final fuelCostPerKm = totalDistance > 0 ? totalCost / totalDistance : 0.0;

      stats[vehicleId] = _VehicleStats(
        vehicleId: vehicleId,
        vehicleName: vehicle.name,
        totalCost: totalCost,
        totalLiters: totalLiters,
        fillUpCount: fillUpCount,
        avgCostPerFill: avgCostPerFill,
        avgPricePerLiter: avgPricePerLiter,
        overallMileage: overallMileage,
        totalDistance: totalDistance,
        costPerKm: costPerKm,
        fuelCostPerKm: fuelCostPerKm,
        maintenanceCost: maintenanceCost,
        maintenanceCount: maintenanceEntries.length,
        unit: vehicle.fuelUnit,
      );
    }

    if (mounted) {
      setState(() {
        _vehicleStats = stats;
        _isLoadingStats = false;
      });
    }
  }

  void _toggleVehicle(String vehicleId, List<FuelEntry> allEntries) {
    setState(() {
      if (_selectedVehicleIds.contains(vehicleId)) {
        _selectedVehicleIds.remove(vehicleId);
      } else {
        _selectedVehicleIds.add(vehicleId);
      }
    });
    _computeStats(allEntries);
  }

  @override
  Widget build(BuildContext context) {
    final vehiclesAsync = ref.watch(vehiclesProvider);
    final entriesAsync = ref.watch(fuelEntriesProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [
                    const Color(0xFF1a1a2e),
                    const Color(0xFF16213e),
                    const Color(0xFF0f3460),
                  ]
                : [
                    const Color(0xFF667eea),
                    const Color(0xFF764ba2),
                    const Color(0xFF2196F3),
                  ],
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: Colors.white.withValues(alpha: 0.3)),
                      ),
                      child: IconButton(
                        icon:
                            const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context).comparisonTitle,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Side-by-side efficiency',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withValues(alpha: 0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Content
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xFF121212)
                        : Colors.grey.shade50,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(28)),
                  ),
                  child: vehiclesAsync.when(
                    data: (vehicles) {
                      if (vehicles.length < 2) {
                        return _buildNotEnoughVehicles(isDark);
                      }

                      return entriesAsync.when(
                        data: (entries) {
                          // Auto-select first 2 vehicles on initial load
                          if (!_didAutoSelect && vehicles.length >= 2) {
                            _didAutoSelect = true;
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              setState(() {
                                _selectedVehicleIds = {
                                  vehicles[0].id,
                                  vehicles[1].id,
                                };
                              });
                              _computeStats(entries);
                            });
                          }

                          return FadeTransition(
                            opacity: _fadeAnimation,
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildVehicleSelector(
                                      vehicles, entries, isDark),
                                  const SizedBox(height: 20),
                                  if (_selectedVehicleIds.length < 2)
                                    _buildSelectMoreMessage(isDark)
                                  else if (_isLoadingStats)
                                    const Padding(
                                      padding: EdgeInsets.only(top: 40),
                                      child: Center(
                                          child:
                                              CircularProgressIndicator()),
                                    )
                                  else ...[
                                    _buildComparisonCard(
                                      AppLocalizations.of(context).commonTotalCost,
                                      _vehicleStats.values
                                          .map((s) => s.totalCost)
                                          .toList(),
                                      _vehicleStats.values
                                          .map((s) => s.vehicleName)
                                          .toList(),
                                      _vehicleStats.values
                                          .map((s) => _colorForVehicle(
                                              s.vehicleId,
                                              vehicles))
                                          .toList(),
                                      isDark,
                                      prefix: _currency,
                                    ),
                                    const SizedBox(height: 12),
                                    _buildComparisonCard(
                                      AppLocalizations.of(context).comparisonMaintenance,
                                      _vehicleStats.values
                                          .map((s) => s.maintenanceCost)
                                          .toList(),
                                      _vehicleStats.values
                                          .map((s) => s.vehicleName)
                                          .toList(),
                                      _vehicleStats.values
                                          .map((s) => _colorForVehicle(
                                              s.vehicleId,
                                              vehicles))
                                          .toList(),
                                      isDark,
                                      prefix: _currency,
                                    ),
                                    const SizedBox(height: 12),
                                    _buildComparisonCard(
                                      AppLocalizations.of(context).comparisonTotalFuel,
                                      _vehicleStats.values
                                          .map((s) => s.totalLiters)
                                          .toList(),
                                      _vehicleStats.values
                                          .map((s) => s.vehicleName)
                                          .toList(),
                                      _vehicleStats.values
                                          .map((s) => _colorForVehicle(
                                              s.vehicleId,
                                              vehicles))
                                          .toList(),
                                      isDark,
                                      suffix: _sharedUnit?.short ?? '',
                                      mixedUnits: _sharedUnit == null,
                                      perValueSuffix: _vehicleStats.values
                                          .map((s) => s.unit.short)
                                          .toList(),
                                    ),
                                    const SizedBox(height: 12),
                                    _buildComparisonCard(
                                      AppLocalizations.of(context).comparisonFillUps,
                                      _vehicleStats.values
                                          .map((s) =>
                                              s.fillUpCount.toDouble())
                                          .toList(),
                                      _vehicleStats.values
                                          .map((s) => s.vehicleName)
                                          .toList(),
                                      _vehicleStats.values
                                          .map((s) => _colorForVehicle(
                                              s.vehicleId,
                                              vehicles))
                                          .toList(),
                                      isDark,
                                    ),
                                    const SizedBox(height: 12),
                                    _buildComparisonCard(
                                      AppLocalizations.of(context).comparisonEfficiency,
                                      _vehicleStats.values
                                          .map((s) => s.overallMileage)
                                          .toList(),
                                      _vehicleStats.values
                                          .map((s) => s.vehicleName)
                                          .toList(),
                                      _vehicleStats.values
                                          .map((s) => _colorForVehicle(
                                              s.vehicleId,
                                              vehicles))
                                          .toList(),
                                      isDark,
                                      suffix: _sharedUnit?.efficiencyLabel ?? '',
                                      mixedUnits: _sharedUnit == null,
                                      preciseValues: true,
                                      perValueSuffix: _vehicleStats.values
                                          .map((s) => s.unit.efficiencyLabel)
                                          .toList(),
                                    ),
                                    const SizedBox(height: 12),
                                    _buildComparisonCard(
                                      AppLocalizations.of(context).comparisonCostPerKmAllIn,
                                      _vehicleStats.values
                                          .map((s) => s.costPerKm)
                                          .toList(),
                                      _vehicleStats.values
                                          .map((s) => s.vehicleName)
                                          .toList(),
                                      _vehicleStats.values
                                          .map((s) => _colorForVehicle(
                                              s.vehicleId,
                                              vehicles))
                                          .toList(),
                                      isDark,
                                      prefix: _currency,
                                      note: AppLocalizations.of(context).comparisonCostPerKmNote,
                                      perValueSuffix: _vehicleStats.values
                                          .map((s) => s.maintenanceCost > 0
                                              ? '(fuel $_currency${s.fuelCostPerKm.toStringAsFixed(2)})'
                                              : '')
                                          .toList(),
                                    ),
                                    const SizedBox(height: 12),
                                    _buildComparisonCard(
                                      'Total Distance',
                                      _vehicleStats.values
                                          .map((s) => s.totalDistance)
                                          .toList(),
                                      _vehicleStats.values
                                          .map((s) => s.vehicleName)
                                          .toList(),
                                      _vehicleStats.values
                                          .map((s) => _colorForVehicle(
                                              s.vehicleId,
                                              vehicles))
                                          .toList(),
                                      isDark,
                                      suffix: 'km',
                                    ),
                                    const SizedBox(height: 20),
                                    _buildSummaryTable(vehicles, isDark),
                                    const SizedBox(height: 32),
                                  ],
                                ],
                              ),
                            ),
                          );
                        },
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        error: (e, _) => Center(child: Text('Error: $e')),
                      );
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, _) => Center(child: Text('Error: $e')),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotEnoughVehicles(bool isDark) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.directions_car_outlined,
              size: 64,
              color: isDark ? Colors.grey.shade600 : Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context).comparisonNeedTwo,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectMoreMessage(bool isDark) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Icon(
              Icons.compare_arrows,
              size: 48,
              color: isDark ? Colors.grey.shade600 : Colors.grey.shade400,
            ),
            const SizedBox(height: 12),
            Text(
              'Select at least 2 vehicles to compare',
              style: TextStyle(
                fontSize: 16,
                color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleSelector(
      List<Vehicle> vehicles, List<FuelEntry> entries, bool isDark) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: vehicles.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final vehicle = vehicles[index];
          final isSelected = _selectedVehicleIds.contains(vehicle.id);
          final vehicleColor = _colorForVehicle(vehicle.id, vehicles);
          final icon =
              _vehicleIconMap[vehicle.iconName] ?? Icons.directions_car;

          return FilterChip(
            avatar: Icon(
              icon,
              size: 18,
              color: isSelected ? Colors.white : vehicleColor,
            ),
            label: Text(
              vehicle.name,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : (isDark ? Colors.grey.shade300 : Colors.grey.shade700),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            selected: isSelected,
            onSelected: (_) => _toggleVehicle(vehicle.id, entries),
            backgroundColor:
                isDark ? const Color(0xFF1E1E1E) : Colors.white,
            selectedColor: vehicleColor,
            checkmarkColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: isSelected
                    ? vehicleColor
                    : (isDark
                        ? Colors.grey.shade700
                        : Colors.grey.shade300),
              ),
            ),
          );
        },
      ),
    );
  }

  /// The unit every compared vehicle shares, or null when they differ — in
  /// which case bars measured in liters and kWh cannot be compared directly.
  FuelUnit? get _sharedUnit {
    final units = _vehicleStats.values.map((s) => s.unit).toSet();
    return units.length == 1 ? units.first : null;
  }

  Widget _buildComparisonCard(
    String metricName,
    List<double> values,
    List<String> names,
    List<Color> colors,
    bool isDark, {
    String prefix = '',
    String suffix = '',
    bool mixedUnits = false,
    List<String>? perValueSuffix,
    bool preciseValues = false,
    String? note,
  }) {
    final maxValue =
        values.isEmpty ? 1.0 : values.reduce((a, b) => a > b ? a : b);
    final safeMax = maxValue > 0 ? maxValue : 1.0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            metricName,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.grey.shade800,
            ),
          ),
          if (note != null)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                note,
                style: TextStyle(
                  fontSize: 11.5,
                  color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                ),
              ),
            ),
          const SizedBox(height: 12),
          if (mixedUnits)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                AppLocalizations.of(context).comparisonMixedUnits,
                style: TextStyle(
                  fontSize: 11.5,
                  fontStyle: FontStyle.italic,
                  color: isDark ? Colors.orange.shade200 : Colors.orange.shade800,
                ),
              ),
            ),
          ...List.generate(values.length, (i) {
            final ratio = values[i] / safeMax;
            final precise = preciseValues || prefix.isNotEmpty;
            final formattedValue =
                values[i] == values[i].roundToDouble() && !precise
                    ? values[i].toInt().toString()
                    : values[i].toStringAsFixed(precise ? 2 : 1);
            final unitSuffix = perValueSuffix != null && i < perValueSuffix.length
                ? perValueSuffix[i]
                : suffix;
            final displayValue =
                '$prefix$formattedValue${unitSuffix.isNotEmpty ? ' $unitSuffix' : ''}';

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        names[i],
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: isDark
                              ? Colors.grey.shade300
                              : Colors.grey.shade700,
                        ),
                      ),
                      Text(
                        displayValue,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: colors[i],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: ratio.clamp(0.0, 1.0),
                      minHeight: 10,
                      backgroundColor:
                          isDark ? Colors.grey.shade800 : Colors.grey.shade200,
                      valueColor: AlwaysStoppedAnimation(colors[i]),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSummaryTable(List<Vehicle> vehicles, bool isDark) {
    if (_vehicleStats.isEmpty) return const SizedBox.shrink();

    final statsList = _vehicleStats.values.toList();
    final needsScroll = statsList.length > 2;
    const double vehicleColumnWidth = 110;

    final metrics = [
      AppLocalizations.of(context).commonTotalCost,
      AppLocalizations.of(context).comparisonMaintenance,
      AppLocalizations.of(context).comparisonTotalFuel,
      AppLocalizations.of(context).comparisonFillUps,
      AppLocalizations.of(context).comparisonEfficiency,
      AppLocalizations.of(context).comparisonCostPerKmShort,
      AppLocalizations.of(context).commonDistance,
    ];

    String valueForMetric(_VehicleStats s, int metricIndex) {
      // Indices track the `metrics` list above.
      switch (metricIndex) {
        case 0:
          return '$_currency${s.totalCost.toStringAsFixed(2)}';
        case 1:
          return '$_currency${s.maintenanceCost.toStringAsFixed(2)}';
        case 2:
          return '${s.totalLiters.toStringAsFixed(1)} ${s.unit.short}';
        case 3:
          return '${s.fillUpCount}';
        case 4:
          return '${s.overallMileage.toStringAsFixed(2)} ${s.unit.efficiencyLabel}';
        case 5:
          return '$_currency${s.costPerKm.toStringAsFixed(2)}';
        case 6:
          return '${s.totalDistance.toStringAsFixed(1)} km';
        default:
          return '';
      }
    }

    Widget buildVehicleHeaders() {
      final headers = statsList.map((s) {
        final color = _colorForVehicle(s.vehicleId, vehicles);
        return SizedBox(
          width: vehicleColumnWidth,
          child: Text(
            s.vehicleName,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: color,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        );
      }).toList();

      if (needsScroll) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: headers),
        );
      }
      return Row(
        children: statsList.map((s) {
          final color = _colorForVehicle(s.vehicleId, vehicles);
          return Expanded(
            child: Text(
              s.vehicleName,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: color,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
      );
    }

    Widget buildMetricRow(int metricIndex) {
      final valueCells = statsList.map((s) {
        return SizedBox(
          width: vehicleColumnWidth,
          child: Text(
            valueForMetric(s, metricIndex),
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.white : Colors.grey.shade800,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        );
      }).toList();

      if (needsScroll) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: valueCells),
        );
      }
      return Row(
        children: statsList.map((s) {
          return Expanded(
            child: Text(
              valueForMetric(s, metricIndex),
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white : Colors.grey.shade800,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
      );
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Summary',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.grey.shade800,
                ),
              ),
              if (needsScroll) ...[
                const Spacer(),
                Icon(
                  Icons.swipe,
                  size: 16,
                  color: isDark ? Colors.grey.shade600 : Colors.grey.shade400,
                ),
                const SizedBox(width: 4),
                Text(
                  'Scroll',
                  style: TextStyle(
                    fontSize: 11,
                    color: isDark ? Colors.grey.shade600 : Colors.grey.shade400,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 16),
          // Column headers (vehicle names)
          Row(
            children: [
              SizedBox(
                width: 80,
                child: Text(
                  'Metric',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color:
                        isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                  ),
                ),
              ),
              Expanded(child: buildVehicleHeaders()),
            ],
          ),
          Divider(
              color: isDark ? Colors.grey.shade800 : Colors.grey.shade300),
          ...List.generate(metrics.length, (metricIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      metrics[metricIndex],
                      style: TextStyle(
                        fontSize: 13,
                        color: isDark
                            ? Colors.grey.shade300
                            : Colors.grey.shade700,
                      ),
                    ),
                  ),
                  Expanded(child: buildMetricRow(metricIndex)),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
