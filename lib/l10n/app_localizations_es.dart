// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Fuel Cost';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonSave => 'Guardar';

  @override
  String get commonDelete => 'Eliminar';

  @override
  String get commonEdit => 'Editar';

  @override
  String get commonClear => 'Limpiar';

  @override
  String get commonAll => 'Todos';

  @override
  String get commonNotAvailable => 'N/D';

  @override
  String get commonNotSet => 'Sin definir';

  @override
  String get homeTotalCost => 'Coste total';

  @override
  String get homeTotalFuels => 'Combustible total';

  @override
  String get homeTotalDistance => 'Distancia total';

  @override
  String homeTotalOf(String unit) {
    return 'Total de $unit';
  }

  @override
  String get homeLastTripMileage => 'Consumo del último viaje';

  @override
  String get homeOverallMileage => 'Consumo general';

  @override
  String get homeMaxMileage => 'Consumo máximo';

  @override
  String get homeMinMileage => 'Consumo mínimo';

  @override
  String get homeThisMonth => 'Este mes';

  @override
  String get homeAddFuel => 'Añadir combustible';

  @override
  String get homeHistory => 'Historial';

  @override
  String get homeSettings => 'Ajustes';

  @override
  String get addFuelTitle => 'Añadir repostaje';

  @override
  String get addFuelEditTitle => 'Editar repostaje';

  @override
  String addFuelAmountLabel(String unit) {
    return 'Cantidad de combustible ($unit)';
  }

  @override
  String addFuelChargeAmountLabel(String unit) {
    return 'Cantidad de carga ($unit)';
  }

  @override
  String addFuelPricePerUnit(String unit) {
    return 'Precio por $unit';
  }

  @override
  String get addFuelOdometer => 'Lectura del odómetro';

  @override
  String get addFuelVehicle => 'Vehículo';

  @override
  String get addFuelFuelType => 'Tipo de combustible';

  @override
  String get addFuelPetrol => 'Gasolina';

  @override
  String get addFuelCharge => 'Carga';

  @override
  String get addFuelSelectVehicle => 'Selecciona un vehículo';

  @override
  String get addFuelSaved => '¡Repostaje guardado correctamente!';

  @override
  String get addFuelUpdated => '¡Repostaje actualizado!';

  @override
  String addFuelLastRecorded(String value) {
    return 'Último registro: $value km';
  }

  @override
  String get historyTitle => 'Historial de repostajes';

  @override
  String get historyRecentEntries => 'Registros recientes';

  @override
  String get historySearchHint => 'Busca importe, odómetro o vehículo';

  @override
  String get historyExportTooltip => 'Exportar estos registros';

  @override
  String historyEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registros',
      one: '1 registro',
    );
    return '$_temp0';
  }

  @override
  String historyFilteredCount(int shown, int total) {
    return '$shown de $total registros';
  }

  @override
  String historyExported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registros exportados',
      one: '1 registro exportado',
    );
    return '$_temp0';
  }

  @override
  String get historyNoEntriesYet => 'Aún no hay repostajes';

  @override
  String get historyNoMatches => 'Ningún registro coincide con los filtros';

  @override
  String get historyNoEntriesSubtitle =>
      '¡Añade tu primer repostaje para empezar\na controlar tus gastos!';

  @override
  String get historyNoMatchesSubtitle =>
      'Prueba un rango de fechas más amplio o limpia los filtros';

  @override
  String get dateAll => 'Todo';

  @override
  String get dateThisMonth => 'Este mes';

  @override
  String get dateLastThreeMonths => 'Últimos 3 meses';

  @override
  String get dateThisYear => 'Este año';

  @override
  String get dateCustom => 'Personalizado';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsCurrency => 'Moneda';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsLanguageSystem => 'Predeterminado del sistema';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsMonthlyBudget => 'Presupuesto mensual';

  @override
  String settingsBudgetPerMonth(String amount) {
    return '$amount al mes';
  }

  @override
  String get settingsBackupToDrive => 'Copia de seguridad en Google Drive';

  @override
  String get settingsRestoreFromDrive => 'Restaurar desde Google Drive';

  @override
  String get settingsExportCsv => 'Exportar CSV';

  @override
  String get settingsImportCsv => 'Importar CSV';

  @override
  String get settingsReplayTutorial => 'Repetir tutorial';

  @override
  String settingsVersion(String version, String build) {
    return 'Versión $version (compilación $build)';
  }

  @override
  String get settingsRestoreCancelled => 'Restauración cancelada';

  @override
  String get settingsBackupSuccess => '¡Copia de seguridad realizada!';

  @override
  String get commonAdd => 'Añadir';

  @override
  String get commonUpdate => 'Actualizar';

  @override
  String get commonRemove => 'Quitar';

  @override
  String get commonOther => 'Otro';

  @override
  String commonError(String message) {
    return 'Error: $message';
  }

  @override
  String get commonNoData => 'Sin datos';

  @override
  String get commonTotalCost => 'Coste total';

  @override
  String get commonDistance => 'Distancia';

  @override
  String get commonMonth => 'Mes';

  @override
  String get commonLiters => 'Litros';

  @override
  String get splashTagline => 'REGISTRA  •  CALCULA  •  AHORRA';

  @override
  String get splashLoading => 'Comenzando tu viaje…';

  @override
  String get splashTrackFuel => 'Controla el combustible';

  @override
  String get splashDriveSmart => 'Conduce mejor';

  @override
  String get splashSaveMoney => 'Ahorra dinero';

  @override
  String get onboardingSkip => 'Saltar';

  @override
  String get onboardingNext => 'Siguiente';

  @override
  String get onboardingGetStarted => 'Empezar';

  @override
  String get onboardingTrackTitle => 'Registra cada repostaje';

  @override
  String get onboardingTrackBody =>
      'Anota tus repostajes con litros, precio y lectura del odómetro. Nunca vuelvas a perder de vista tus gastos.';

  @override
  String get onboardingVehiclesTitle => 'Varios vehículos';

  @override
  String get onboardingVehiclesBody =>
      'Gestiona tu coche, moto, camión o cualquier vehículo por separado. Cambia entre ellos para ver estadísticas individuales.';

  @override
  String get onboardingMileageTitle => 'Cálculo inteligente del consumo';

  @override
  String get onboardingMileageBody =>
      'Calculamos automáticamente tu eficiencia a partir del odómetro. Observa la evolución con el tiempo.';

  @override
  String get onboardingBudgetTitle => 'Presupuesto e informes';

  @override
  String get onboardingBudgetBody =>
      'Define un presupuesto mensual y visualiza tus gastos con gráficos claros. Mantén el control de tus costes.';

  @override
  String get onboardingBackupTitle => 'Copia en la nube';

  @override
  String get onboardingBackupBody =>
      'Sincroniza tus datos de forma segura con Google Drive. Restaura cuando quieras en cualquier dispositivo.';

  @override
  String get tripTitle => 'Calculadora de viaje';

  @override
  String get tripSubtitle => 'Estima el coste de combustible de tu viaje';

  @override
  String get tripDetails => 'Detalles del viaje';

  @override
  String get tripDistanceLabel => 'Distancia del viaje (km)';

  @override
  String get tripRoundTrip => 'Ida y vuelta';

  @override
  String get tripUseCustomMileage => 'Usar consumo personalizado';

  @override
  String get tripUseCustomPrice => 'Usar precio personalizado';

  @override
  String tripMileageLabel(String unit) {
    return 'Consumo ($unit)';
  }

  @override
  String tripFuelPriceLabel(String currency, String unit) {
    return 'Precio del combustible ($currency/$unit)';
  }

  @override
  String get tripEstimate => 'Estimación del viaje';

  @override
  String get tripEstimatedTotal => 'Coste total estimado';

  @override
  String get tripFuelNeeded => 'Combustible necesario';

  @override
  String get tripChargeNeeded => 'Carga necesaria';

  @override
  String get tripMileageUsed => 'Consumo utilizado';

  @override
  String get tripFuelPrice => 'Precio del combustible';

  @override
  String get tripCostPerKm => 'Coste por km';

  @override
  String get tripEnterDistance => 'Introduce la distancia para calcular';

  @override
  String get tripNoPriceData =>
      'No hay datos de precio. Introduce un precio personalizado.';

  @override
  String get vehiclesTitle => 'Mis vehículos';

  @override
  String get vehiclesSubtitle => 'Gestiona tus vehículos';

  @override
  String get vehiclesAdd => 'Añadir vehículo';

  @override
  String get vehiclesEdit => 'Editar vehículo';

  @override
  String get vehiclesDelete => 'Eliminar vehículo';

  @override
  String get vehiclesNameLabel => 'Nombre del vehículo';

  @override
  String get vehiclesTypeLabel => 'Tipo de vehículo';

  @override
  String get vehiclesFuelTypeLabel => 'Tipo de combustible';

  @override
  String get vehiclesSoldBy => 'Se vende por';

  @override
  String vehiclesTankCapacity(String unit) {
    return 'Capacidad del depósito ($unit) - opcional';
  }

  @override
  String get vehiclesBatteryCapacity =>
      'Capacidad de la batería (kWh) - opcional';

  @override
  String get vehiclesNameRequired => 'Introduce un nombre para el vehículo';

  @override
  String get vehiclesEmpty => 'Aún no hay vehículos';

  @override
  String get vehiclesEmptyHint => 'Pulsa + para añadir tu primer vehículo';

  @override
  String vehiclesTankSuffix(String amount, String unit) {
    return 'depósito de $amount$unit';
  }

  @override
  String vehiclesBatterySuffix(String amount, String unit) {
    return 'batería de $amount$unit';
  }

  @override
  String get maintenanceTitle => 'Registro de mantenimiento';

  @override
  String get maintenanceSubtitle => 'Controla las revisiones de tu vehículo';

  @override
  String get maintenanceAdd => 'Añadir servicio';

  @override
  String get maintenanceEdit => 'Editar servicio';

  @override
  String get maintenanceDelete => 'Eliminar registro';

  @override
  String maintenanceDeleteConfirm(String type) {
    return '¿Seguro que quieres eliminar «$type»?';
  }

  @override
  String get maintenanceServiceType => 'Tipo de servicio';

  @override
  String get maintenanceVehicleRequired => 'Vehículo *';

  @override
  String get maintenanceSelectVehicle => 'Selecciona un vehículo';

  @override
  String maintenanceCostLabel(String currency) {
    return 'Coste ($currency)';
  }

  @override
  String get maintenanceDate => 'Fecha';

  @override
  String get maintenanceNotes => 'Notas (opcional)';

  @override
  String get maintenanceNotesHint => 'Notas adicionales...';

  @override
  String get maintenanceSummary => 'Resumen';

  @override
  String get maintenanceRecords => 'Registros';

  @override
  String get maintenanceLastService => 'Último servicio';

  @override
  String get maintenanceEmpty => 'Aún no hay registros de mantenimiento';

  @override
  String get maintenanceEmptyHint => 'Pulsa + para añadir tu primer servicio';

  @override
  String get budgetTitle => 'Presupuesto e informes';

  @override
  String get budgetSubtitle => 'Controla tu gasto en combustible';

  @override
  String get budgetSetTitle => 'Definir presupuesto mensual';

  @override
  String get budgetSetAction => 'Definir presupuesto';

  @override
  String get budgetRemove => 'Quitar presupuesto';

  @override
  String budgetAmountLabel(String currency) {
    return 'Presupuesto ($currency)';
  }

  @override
  String get budgetSpent => 'Gastado';

  @override
  String get budgetAvgPerDay => 'Media/día';

  @override
  String get budgetFills => 'Repostajes';

  @override
  String get budgetMonthlySpending => 'Gasto mensual';

  @override
  String get budgetWeeklyBreakdown => 'Desglose semanal';

  @override
  String get budgetMonthlyComparison => 'Comparación mensual';

  @override
  String budgetDayRange(String range) {
    return 'Día $range';
  }

  @override
  String budgetOverBy(String amount) {
    return '$amount por encima del presupuesto';
  }

  @override
  String budgetRemaining(String amount) {
    return '$amount restante';
  }

  @override
  String get spendingTitle => 'Comparación de gastos';

  @override
  String get spendingSubtitle => 'Compara periodos lado a lado';

  @override
  String get spendingDetailed => 'Comparación detallada';

  @override
  String get spendingMetric => 'Métrica';

  @override
  String get spendingTotalSpent => 'Total gastado';

  @override
  String get spendingTotalLiters => 'Litros totales';

  @override
  String get spendingFillUps => 'Repostajes';

  @override
  String get spendingAvgPerFill => 'Media/repostaje';

  @override
  String spendingSelectPeriod(String label) {
    return 'Seleccionar $label';
  }

  @override
  String spendingPeriod(String letter) {
    return 'Periodo $letter';
  }

  @override
  String get comparisonTitle => 'Comparar vehículos';

  @override
  String get comparisonNeedTwo => 'Añade al menos 2 vehículos para comparar';

  @override
  String get comparisonMaintenance => 'Mantenimiento';

  @override
  String get comparisonTotalFuel => 'Combustible total';

  @override
  String get comparisonFillUps => 'Repostajes';

  @override
  String get comparisonEfficiency => 'Eficiencia';

  @override
  String get comparisonCostPerKmAllIn => 'Coste por km · total';

  @override
  String get comparisonCostPerKmNote =>
      'combustible + mantenimiento ÷ distancia';

  @override
  String get comparisonCostPerKmShort => 'Coste/km';

  @override
  String get comparisonMixedUnits =>
      'Estos vehículos usan unidades distintas: compara cada barra consigo misma, no con las demás.';

  @override
  String get howToTitle => 'Cómo usar';

  @override
  String get howToWelcome => '¡Bienvenido a Fuel Cost!';

  @override
  String get howToWelcomeBody =>
      'Controla fácilmente tu consumo, tus costes y tu eficiencia.';

  @override
  String get howToGettingStarted => 'Cómo empezar';

  @override
  String get howToStep1 =>
      'Añade tu primer repostaje pulsando «Añadir combustible»';

  @override
  String get howToStep2 =>
      'Introduce la cantidad de combustible y el precio por unidad';

  @override
  String get howToStep3 =>
      'Opcionalmente añade la lectura del odómetro para calcular el consumo';

  @override
  String get howToStep4 =>
      'Consulta tu historial y estadísticas en la pantalla principal';

  @override
  String get howToMileageTitle => 'Cómo se calcula el consumo';

  @override
  String get howToMileageFormulaTitle => 'Fórmula del consumo';

  @override
  String get howToMileageFormula =>
      'Consumo = distancia recorrida ÷ combustible añadido';

  @override
  String get howToDistanceFormula =>
      'Distancia = odómetro actual - odómetro anterior';

  @override
  String get howToExample => 'Ejemplo de cálculo:';

  @override
  String get howToPreviousOdometer => 'Odómetro anterior:';

  @override
  String get howToCurrentOdometer => 'Odómetro actual:';

  @override
  String get howToDistanceTraveled => 'Distancia recorrida:';

  @override
  String get howToFuelAdded => 'Combustible añadido:';

  @override
  String get howToMileageResult => 'Consumo:';

  @override
  String get howToKeyFeatures => 'Funciones principales';

  @override
  String get howToFeatureDashboard => 'Panel inteligente';

  @override
  String get howToFeatureDashboardBody =>
      'Consulta de un vistazo costes, consumo y eficiencia';

  @override
  String get howToFeatureHistory => 'Historial detallado';

  @override
  String get howToFeatureHistoryBody =>
      'Registra todos tus repostajes con fechas, cantidades y costes';

  @override
  String get howToFeatureEfficiency => 'Seguimiento de eficiencia';

  @override
  String get howToFeatureEfficiencyBody =>
      'Controla la eficiencia de tu vehículo a lo largo del tiempo';

  @override
  String get howToFeatureData => 'Gestión de datos';

  @override
  String get howToFeatureDataBody =>
      'Gestiona y borra tus datos fácilmente cuando lo necesites';

  @override
  String get howToTips => 'Consejos para un mejor seguimiento';

  @override
  String get howToTip1 =>
      'Llena siempre el depósito por completo para medir con precisión';

  @override
  String get howToTip2 => 'Anota la lectura del odómetro en cada repostaje';

  @override
  String get howToTip3 => 'Añade los repostajes justo después de repostar';

  @override
  String get howToTip4 => 'Revisa tus tendencias de eficiencia con regularidad';

  @override
  String get howToTip5 => 'Desliza hacia abajo para actualizar tus datos';

  @override
  String get restoreTitle => 'Revisar conflictos';

  @override
  String get restoreConfirm => 'CONFIRMAR';

  @override
  String get restoreUseBackupAll => 'Usar la copia en todo';

  @override
  String get restoreKeepAllMine => 'Conservar todo lo mío';

  @override
  String get restoreMine => 'Mío';

  @override
  String get restoreBackup => 'Copia';

  @override
  String get restoreExplainer =>
      'Estos registros cambiaron en ambos lados. Elige qué versión conservar; los nuevos se añaden automáticamente.';

  @override
  String get restoreSectionVehicles => 'Vehículos';

  @override
  String get restoreSectionSettings => 'Ajustes';

  @override
  String get restoreSectionMaintenance => 'Mantenimiento';

  @override
  String get restoreSectionEntries => 'Repostajes';

  @override
  String get restoreUnchanged => 'sin cambios';

  @override
  String restoreConflictCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count conflictos',
      one: '1 conflicto',
    );
    return '$_temp0';
  }

  @override
  String restoreNewCount(int count) {
    return '$count nuevos';
  }

  @override
  String restoreUnchangedCount(int count) {
    return '$count sin cambios';
  }

  @override
  String get commonRestore => 'Restaurar';

  @override
  String get commonSignIn => 'Iniciar sesión';

  @override
  String get commonDisconnect => 'Desconectar';

  @override
  String get commonProcessing => 'Procesando...';

  @override
  String get commonNoThanks => 'No, gracias';

  @override
  String get commonNotNow => 'Ahora no';

  @override
  String get commonMileage => 'Consumo';

  @override
  String get settingsSubtitle => 'Gestiona tus preferencias y datos';

  @override
  String get settingsAppearance => 'Apariencia';

  @override
  String get settingsPreferences => 'Preferencias';

  @override
  String get settingsDataManagement => 'Gestión de datos';

  @override
  String get settingsExportImport => 'Exportar e importar';

  @override
  String get settingsAdvanced => 'Avanzado';

  @override
  String get settingsAbout => 'Acerca de';

  @override
  String get settingsAccentColor => 'Color de acento';

  @override
  String get settingsAccentColorSubtitle => 'Personaliza el color de la app';

  @override
  String get settingsChooseAccentColor => 'Elegir color de acento';

  @override
  String get settingsChooseTheme => 'Elegir tema';

  @override
  String settingsThemeCurrent(String theme) {
    return 'Actual: $theme';
  }

  @override
  String settingsCurrencyCurrent(String symbol, String name) {
    return 'Actual: $symbol ($name)';
  }

  @override
  String settingsCurrencyChanged(String symbol, String name) {
    return 'Moneda cambiada a $symbol ($name)';
  }

  @override
  String settingsBudgetLabel(String currency) {
    return 'Presupuesto ($currency)';
  }

  @override
  String get settingsBudgetHint => 'p. ej. 5000';

  @override
  String get settingsGoogleDriveBackup => 'Copia en Google Drive';

  @override
  String settingsSignedInAs(String email) {
    return 'Sesión iniciada como $email';
  }

  @override
  String get settingsSignOutSubtitle => 'Cerrar sesión de la copia de Google';

  @override
  String get settingsDisconnected => 'Desconectado de Google Drive';

  @override
  String get settingsBackupNow => 'Hacer copia ahora';

  @override
  String get settingsBackupNowSubtitle => 'Sube tus datos a Google Drive';

  @override
  String get settingsAutoBackup => 'Copia automática';

  @override
  String get settingsAutoBackupSubtitle =>
      'Hacer copia automáticamente al guardar un registro';

  @override
  String get settingsAutoBackupOffWarning =>
      'Las copias existentes se mantendrán. No se harán copias nuevas.';

  @override
  String get settingsRestoreFromBackup => 'Restaurar desde la copia';

  @override
  String get settingsRestoreSubtitle => 'Descarga y restaura tus datos';

  @override
  String get settingsRestoreWarning =>
      'Esto reemplazará todos los datos actuales con la copia. No se puede deshacer.';

  @override
  String settingsRestoreFailed(String message) {
    return 'Error al restaurar: $message';
  }

  @override
  String settingsBackupFailed(String message) {
    return 'Error en la copia: $message';
  }

  @override
  String get settingsExportData => 'Exportar datos';

  @override
  String get settingsExportToCsv => 'Exportar a CSV';

  @override
  String get settingsExportSubtitle =>
      'Exporta todos los registros como archivo CSV';

  @override
  String get settingsSelectExportVehicle => 'Selecciona qué vehículo exportar';

  @override
  String get settingsAllVehicles => 'Todos los vehículos';

  @override
  String get settingsIncludeAllVehicles =>
      'Incluir datos de todos los vehículos';

  @override
  String get settingsNoVehicle => 'Sin vehículo';

  @override
  String get settingsNoVehicleSubtitle => 'No asignar a ningún vehículo';

  @override
  String get settingsNothingToExport =>
      'No hay registros para exportar de este vehículo';

  @override
  String settingsEntriesExported(int count) {
    return '$count registros exportados';
  }

  @override
  String get settingsImportData => 'Importar datos';

  @override
  String get settingsImportFromCsv => 'Importar desde CSV';

  @override
  String get settingsImportSubtitle => 'Importa registros desde un archivo CSV';

  @override
  String get settingsAssignImported =>
      'Asignar los registros importados a un vehículo';

  @override
  String get settingsCsvInvalid => 'El archivo CSV está vacío o no es válido';

  @override
  String settingsEntriesImported(int count) {
    return '$count registros importados';
  }

  @override
  String settingsExportFailed(String message) {
    return 'Error al exportar CSV: $message';
  }

  @override
  String settingsImportFailed(String message) {
    return 'Error al importar CSV: $message';
  }

  @override
  String get settingsClearEntries => 'Borrar repostajes';

  @override
  String get settingsClearEntriesAction => 'Borrar registros';

  @override
  String get settingsClearEntriesSubtitle => 'Elimina todos los repostajes';

  @override
  String get settingsClearEntriesWarning =>
      'Esto eliminará permanentemente todos tus repostajes.';

  @override
  String get settingsEntriesCleared => 'Repostajes borrados correctamente';

  @override
  String get settingsClearOdometer => 'Borrar datos del odómetro';

  @override
  String get settingsClearOdometerAction => 'Borrar odómetro';

  @override
  String get settingsClearOdometerSubtitle =>
      'Reinicia la lectura actual del odómetro';

  @override
  String get settingsClearOdometerWarning =>
      'Esto reiniciará la lectura de tu odómetro.';

  @override
  String get settingsOdometerCleared =>
      'Datos del odómetro borrados correctamente';

  @override
  String get settingsClearAllData => 'Borrar todos los datos';

  @override
  String get settingsClearAllAction => 'Borrar todo';

  @override
  String get settingsClearAllSubtitle =>
      'Elimina todos los registros y el odómetro';

  @override
  String get settingsClearAllWarning =>
      'Esto eliminará permanentemente TODOS los datos. No se puede deshacer.';

  @override
  String get settingsAllDataCleared => 'Todos los datos borrados correctamente';

  @override
  String get settingsResetApp => 'Restablecer app';

  @override
  String get settingsClearAllCache => 'Borrar caché y preferencias';

  @override
  String get settingsClearCacheAction => 'Borrar todo';

  @override
  String get settingsResetSubtitle => 'Restablece la app a valores de fábrica';

  @override
  String get settingsResetWarning =>
      'Esto restablecerá la app por completo. Se perderán TODOS los datos.';

  @override
  String get settingsCacheCleared => 'Caché y preferencias borrados';

  @override
  String settingsClearFailed(String message) {
    return 'Error al borrar datos: $message';
  }

  @override
  String get settingsAppVersion => 'Versión de la app';

  @override
  String get settingsRateApp => 'Valorar la app';

  @override
  String get settingsRateSubtitle => '¿Te gusta Fuel Cost? Déjanos una reseña';

  @override
  String get settingsReplayTutorialSubtitle =>
      'Ver de nuevo la introducción y el tour';

  @override
  String get homeYourFuelStats => 'Tus estadísticas';

  @override
  String get homeQuickActions => 'Acciones rápidas';

  @override
  String get homeAddFuelEntry => 'Añadir repostaje';

  @override
  String get homeViewFuelHistory => 'Ver historial';

  @override
  String get homeSwitchVehicles => 'Cambiar de vehículo';

  @override
  String get homeTripCalculator => 'Calculadora de viaje';

  @override
  String get homeTripCalculatorSubtitle => 'Estima el coste de un viaje';

  @override
  String get homeBudgetReports => 'Presupuesto e informes';

  @override
  String get homeBudgetReportsSubtitle =>
      'Gasto mensual y control de presupuesto';

  @override
  String get homeSpendingComparison => 'Comparación de gastos';

  @override
  String get homeSpendingComparisonSubtitle => 'Compara meses lado a lado';

  @override
  String get homeCompareVehicles => 'Comparar vehículos';

  @override
  String get homeCompareVehiclesSubtitle => 'Análisis de eficiencia comparado';

  @override
  String get homeMaintenanceLog => 'Registro de mantenimiento';

  @override
  String get homeMaintenanceLogSubtitle =>
      'Controla las revisiones de tu vehículo';

  @override
  String get homeThanksFeedback => '¡Gracias por tu opinión!';

  @override
  String get addFuelAddVehicle => 'Añadir vehículo';

  @override
  String addFuelSaveFailed(String message) {
    return 'Error al guardar el registro: $message';
  }

  @override
  String get addFuelAutoBackupOk => '¡Copia automática realizada!';

  @override
  String addFuelAutoBackupFailed(String message) {
    return 'Error en la copia automática: $message';
  }

  @override
  String get addFuelBackupOk => '¡Copia realizada!';

  @override
  String get addFuelConnectedBackedUp => '¡Conectado y copia realizada!';

  @override
  String get historyEntryDeleted => 'Registro eliminado';

  @override
  String get historyTimeUpdated => 'Hora del registro actualizada';

  @override
  String historyDeleteFailed(String message) {
    return 'Error al eliminar el registro: $message';
  }

  @override
  String historyLoadFailed(String message) {
    return 'Error al cargar los datos: $message';
  }

  @override
  String historyExportFailed(String message) {
    return 'Error al exportar CSV: $message';
  }

  @override
  String get entryCardEdit => 'Editar';

  @override
  String get entryCardDelete => 'Eliminar';

  @override
  String get entryCardChangeTime => 'Cambiar hora';

  @override
  String get deleteEntryTitle => 'Eliminar registro';

  @override
  String get rateTitle => '¿Te gusta Fuel Cost?';

  @override
  String get rateNow => 'Valorar ahora';

  @override
  String get rateLater => 'Ahora no';

  @override
  String get currencyDialogTitle => 'Seleccionar moneda';

  @override
  String get currencyDialogSearch => 'Buscar monedas...';

  @override
  String get chartNeedMoreData => 'Añade más repostajes para ver tendencias';

  @override
  String summaryAvgPricePerUnit(String unit) {
    return 'Precio medio por $unit';
  }

  @override
  String summaryAvgPriceShort(String unit) {
    return 'Precio medio/$unit';
  }

  @override
  String get mileageDistanceTraveled => 'Distancia recorrida:';

  @override
  String get mileageFuelEfficiency => 'Eficiencia:';

  @override
  String budgetWeekShort(int number) {
    return 'S$number';
  }

  @override
  String get vehiclesNameHint => 'p. ej. Mi coche';

  @override
  String get maintenanceCostHint => 'p. ej. 150';

  @override
  String vehiclesDeleteConfirm(String name) {
    return '¿Seguro que quieres eliminar «$name»? Los repostajes no se eliminarán.';
  }

  @override
  String get restoreLabelVehicle => 'Vehículo';

  @override
  String get restoreLabelSetting => 'Ajuste';

  @override
  String get fuelType_petrol => 'Gasolina';

  @override
  String get fuelType_diesel => 'Diésel';

  @override
  String get fuelType_cng => 'GNC';

  @override
  String get fuelType_electric => 'Eléctrico';

  @override
  String get fuelType_hybrid => 'Híbrido';

  @override
  String get vehicleType_directions_car => 'Coche';

  @override
  String get vehicleType_two_wheeler => 'Moto';

  @override
  String get vehicleType_local_shipping => 'Camión';

  @override
  String get vehicleType_airport_shuttle => 'Furgoneta';

  @override
  String get vehicleType_electric_car => 'Coche eléctrico';

  @override
  String get vehicleType_pedal_bike => 'Bicicleta';

  @override
  String get maintenanceType_oil_change => 'Cambio de aceite';

  @override
  String get maintenanceType_tire_rotation => 'Rotación de neumáticos';

  @override
  String get maintenanceType_brake_service => 'Frenos';

  @override
  String get maintenanceType_air_filter => 'Filtro de aire';

  @override
  String get maintenanceType_transmission => 'Transmisión';

  @override
  String get maintenanceType_battery => 'Batería';

  @override
  String get maintenanceType_coolant => 'Refrigerante';

  @override
  String get maintenanceType_spark_plugs => 'Bujías';

  @override
  String get maintenanceType_belt_replacement => 'Cambio de correa';

  @override
  String get maintenanceType_wheel_alignment => 'Alineación';

  @override
  String get maintenanceType_suspension => 'Suspensión';

  @override
  String get maintenanceType_exhaust => 'Escape';

  @override
  String get maintenanceType_ac_service => 'Aire acondicionado';

  @override
  String get maintenanceType_wiper_blades => 'Limpiaparabrisas';

  @override
  String get maintenanceType_headlights => 'Faros';

  @override
  String get maintenanceType_car_wash => 'Lavado';

  @override
  String get maintenanceType_detailing => 'Detallado';

  @override
  String get maintenanceType_inspection => 'Inspección';

  @override
  String get maintenanceType_insurance => 'Seguro';

  @override
  String get maintenanceType_registration => 'Matriculación';

  @override
  String get maintenanceType_towing => 'Grúa';

  @override
  String get maintenanceType_general_service => 'Revisión general';

  @override
  String get maintenanceType_body_repair => 'Carrocería';

  @override
  String get maintenanceType_other => 'Otro';

  @override
  String get homeAddFuelSubtitle => 'Registra tus repostajes';

  @override
  String get homeViewHistorySubtitle => 'Consulta tus registros';

  @override
  String settingsEntriesImportedTo(int count, String vehicle) {
    return '$count registros importados a $vehicle';
  }

  @override
  String get homeOverallSummary => 'Resumen general';

  @override
  String get homeSummary => 'Resumen';

  @override
  String get homeMonitorEfficiency => 'Controla tu eficiencia';

  @override
  String get tourVehiclesTitle => 'Cambiar de vehículo';

  @override
  String get tourVehiclesBody =>
      'Elige «Todos» para ver estadísticas combinadas o selecciona un vehículo concreto. Pulsa el botón + al final para añadir uno nuevo.';

  @override
  String get tourSettingsBody =>
      'Personaliza la moneda, el tema y el presupuesto mensual, y haz copia de tus datos en Google Drive desde aquí.';

  @override
  String get tourStatsBody =>
      'Consulta de un vistazo el gasto de este mes, el coste del último repostaje, los días transcurridos y tu eficiencia general.';

  @override
  String get tourActionsBody =>
      'Accede al historial, la calculadora de viaje, los informes de presupuesto, el mantenimiento y más herramientas.';

  @override
  String get tourAddFuelBody =>
      'Pulsa aquí para registrar un repostaje. Introducirás la cantidad, el precio y la lectura del odómetro.';

  @override
  String get comparisonMetric => 'Métrica';

  @override
  String get comparisonScroll => 'Desplazar';

  @override
  String get comparisonSummary => 'Resumen';

  @override
  String get comparisonSelectTwo =>
      'Selecciona al menos 2 vehículos para comparar';

  @override
  String get comparisonSubtitle => 'Eficiencia comparada';

  @override
  String get historyLoading => 'Cargando datos...';

  @override
  String get historyLoadingHint => 'Espera mientras recuperamos tus datos';

  @override
  String get currencyNoResults => 'No se encontraron monedas';

  @override
  String get currencyNoResultsHint => 'Prueba con otras palabras';

  @override
  String get mileageCalculationTitle => 'Cálculo del consumo';

  @override
  String mileageSinceLastFill(String date) {
    return 'Desde el último repostaje: $date';
  }

  @override
  String get addFuelNoVehicles => 'No hay vehículos. Añade uno primero.';

  @override
  String budgetProgressLabel(String amount, String percent) {
    return 'Presupuesto: $amount  |  $percent% usado';
  }

  @override
  String get howToAutoCalc =>
      'La app calcula automáticamente tu eficiencia cuando indicas las lecturas del odómetro:';

  @override
  String get deleteEntryMessage =>
      '¿Seguro que quieres eliminar este repostaje? Esta acción no se puede deshacer.';

  @override
  String get chartNotEnoughData => 'Datos insuficientes';

  @override
  String get chartAnalytics => 'Analíticas';

  @override
  String entryCardOdometer(String value) {
    return 'Odómetro: $value km';
  }

  @override
  String get summaryFillUpTitle => 'Resumen del repostaje';
}
