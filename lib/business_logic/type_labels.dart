import 'package:flutter/widgets.dart';

import '../l10n/app_localizations.dart';
import '../models/maintenance_entry.dart';
import '../models/vehicle.dart';

/// Localized display labels for the app's stored ids.
///
/// The ids themselves (`petrol`, `oil_change`, `two_wheeler`, …) are persisted
/// in SharedPreferences and in the backup payload, so they must never change.
/// Only their presentation is translated; each lookup falls back to the English
/// map in the model, then to the raw id, so nothing can ever render blank.
String fuelTypeLabel(BuildContext context, String id) {
  final l10n = AppLocalizations.of(context);
  switch (id) {
    case 'petrol':
      return l10n.fuelType_petrol;
    case 'diesel':
      return l10n.fuelType_diesel;
    case 'cng':
      return l10n.fuelType_cng;
    case 'electric':
      return l10n.fuelType_electric;
    case 'hybrid':
      return l10n.fuelType_hybrid;
    default:
      return Vehicle.fuelTypes[id] ?? id;
  }
}

String vehicleTypeLabel(BuildContext context, String id) {
  final l10n = AppLocalizations.of(context);
  switch (id) {
    case 'directions_car':
      return l10n.vehicleType_directions_car;
    case 'two_wheeler':
      return l10n.vehicleType_two_wheeler;
    case 'local_shipping':
      return l10n.vehicleType_local_shipping;
    case 'airport_shuttle':
      return l10n.vehicleType_airport_shuttle;
    case 'electric_car':
      return l10n.vehicleType_electric_car;
    case 'pedal_bike':
      return l10n.vehicleType_pedal_bike;
    default:
      return Vehicle.vehicleIcons[id]?.label ?? id;
  }
}

String maintenanceTypeLabel(BuildContext context, String id) {
  final l10n = AppLocalizations.of(context);
  switch (id) {
    case 'oil_change':
      return l10n.maintenanceType_oil_change;
    case 'tire_rotation':
      return l10n.maintenanceType_tire_rotation;
    case 'brake_service':
      return l10n.maintenanceType_brake_service;
    case 'air_filter':
      return l10n.maintenanceType_air_filter;
    case 'transmission':
      return l10n.maintenanceType_transmission;
    case 'battery':
      return l10n.maintenanceType_battery;
    case 'coolant':
      return l10n.maintenanceType_coolant;
    case 'spark_plugs':
      return l10n.maintenanceType_spark_plugs;
    case 'belt_replacement':
      return l10n.maintenanceType_belt_replacement;
    case 'wheel_alignment':
      return l10n.maintenanceType_wheel_alignment;
    case 'suspension':
      return l10n.maintenanceType_suspension;
    case 'exhaust':
      return l10n.maintenanceType_exhaust;
    case 'ac_service':
      return l10n.maintenanceType_ac_service;
    case 'wiper_blades':
      return l10n.maintenanceType_wiper_blades;
    case 'headlights':
      return l10n.maintenanceType_headlights;
    case 'car_wash':
      return l10n.maintenanceType_car_wash;
    case 'detailing':
      return l10n.maintenanceType_detailing;
    case 'inspection':
      return l10n.maintenanceType_inspection;
    case 'insurance':
      return l10n.maintenanceType_insurance;
    case 'registration':
      return l10n.maintenanceType_registration;
    case 'towing':
      return l10n.maintenanceType_towing;
    case 'general_service':
      return l10n.maintenanceType_general_service;
    case 'body_repair':
      return l10n.maintenanceType_body_repair;
    case 'other':
      return l10n.maintenanceType_other;
    default:
      return MaintenanceEntry.maintenanceTypes[id] ?? id;
  }
}
