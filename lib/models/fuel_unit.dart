/// The unit a fuel entry's quantity is measured in.
///
/// The app stores quantities in `FuelEntry.liters` regardless of unit — that
/// field is an Isar column and the schema is frozen (no `isar_generator` in
/// dev_dependencies), so the unit itself lives outside the collection. See
/// `FuelUnitResolver` for how an entry's unit is resolved.
///
/// The arithmetic is unit-agnostic: every efficiency figure is
/// `distance / quantity`, which holds for L, kg, m³ and kWh alike. Only labels
/// and cross-unit aggregation depend on which unit is in play.
enum FuelUnit {
  liter('L', 'L', 'Liters', 'Liter', 'km/L'),
  kilogram('kg', 'kg', 'Kilograms', 'kg', 'km/kg'),
  cubicMeter('m3', 'm³', 'Cubic Meters', 'm³', 'km/m³'),
  kilowattHour('kWh', 'kWh', 'Kilowatt-hours', 'kWh', 'km/kWh');

  /// Stable storage key. ASCII on purpose so it is safe in JSON and CSV —
  /// note `m3` rather than the display form `m³`.
  final String id;

  /// Compact suffix for values, e.g. `45.0 kWh`.
  final String short;

  /// Plural noun for input labels, e.g. `Fuel Amount (Liters)`.
  final String long;

  /// Singular form used in per-unit price labels.
  final String priceUnit;

  /// Efficiency label, e.g. `km/kWh`.
  final String efficiencyLabel;

  const FuelUnit(
    this.id,
    this.short,
    this.long,
    this.priceUnit,
    this.efficiencyLabel,
  );

  /// Label for the quantity input field.
  String get quantityLabel =>
      this == kilowattHour ? 'Charge Amount ($long)' : 'Fuel Amount ($long)';

  /// Label for the per-unit price input field.
  String get priceLabel => 'Price per $priceUnit';

  /// Electricity is charged, not filled — lets copy adapt without every screen
  /// branching on the enum itself.
  bool get isEnergy => this == kilowattHour;

  /// Resolves a stored id. Null, empty or unrecognised values fall back to
  /// [liter], which is what every pre-units entry implicitly was.
  static FuelUnit fromId(String? id) {
    if (id == null || id.isEmpty) return liter;
    for (final unit in values) {
      if (unit.id == id) return unit;
    }
    return liter;
  }

  /// The unit a vehicle of this fuel type is assumed to use. Vehicles may
  /// override it — CNG is sold by kg in India and Pakistan but by m³ in
  /// Bangladesh, so the per-vehicle choice is what actually settles it.
  static FuelUnit defaultFor(String fuelType) {
    switch (fuelType) {
      case 'electric':
        return kilowattHour;
      case 'cng':
        return kilogram;
      // Hybrids default to petrol; the add-entry screen lets each entry pick
      // between liter and kilowattHour.
      case 'petrol':
      case 'diesel':
      case 'hybrid':
      default:
        return liter;
    }
  }

  /// Units a vehicle of this fuel type may be set to. A single-entry list means
  /// there is nothing to choose and the UI hides the selector.
  static List<FuelUnit> optionsFor(String fuelType) {
    switch (fuelType) {
      case 'cng':
        return const [kilogram, cubicMeter];
      case 'electric':
        return const [kilowattHour];
      case 'hybrid':
        return const [liter, kilowattHour];
      default:
        return const [liter];
    }
  }
}
