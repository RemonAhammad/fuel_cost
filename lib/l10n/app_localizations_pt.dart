// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

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
  String get commonClear => 'Limpar';

  @override
  String get commonAll => 'Todos';

  @override
  String get commonNotAvailable => 'N/D';

  @override
  String get commonNotSet => 'Não definido';

  @override
  String get homeTotalCost => 'Custo total';

  @override
  String get homeTotalFuels => 'Combustível total';

  @override
  String get homeTotalDistance => 'Distância total';

  @override
  String homeTotalOf(String unit) {
    return 'Total de $unit';
  }

  @override
  String get homeLastTripMileage => 'Consumo da última viagem';

  @override
  String get homeOverallMileage => 'Consumo geral';

  @override
  String get homeMaxMileage => 'Consumo máximo';

  @override
  String get homeMinMileage => 'Consumo mínimo';

  @override
  String get homeThisMonth => 'Este mês';

  @override
  String get homeAddFuel => 'Adicionar combustível';

  @override
  String get homeHistory => 'Histórico';

  @override
  String get homeSettings => 'Definições';

  @override
  String get addFuelTitle => 'Adicionar abastecimento';

  @override
  String get addFuelEditTitle => 'Editar abastecimento';

  @override
  String addFuelAmountLabel(String unit) {
    return 'Quantidade de combustível ($unit)';
  }

  @override
  String addFuelChargeAmountLabel(String unit) {
    return 'Quantidade de carga ($unit)';
  }

  @override
  String addFuelPricePerUnit(String unit) {
    return 'Preço por $unit';
  }

  @override
  String get addFuelOdometer => 'Leitura do odómetro';

  @override
  String get addFuelVehicle => 'Veículo';

  @override
  String get addFuelFuelType => 'Tipo de combustível';

  @override
  String get addFuelPetrol => 'Gasolina';

  @override
  String get addFuelCharge => 'Carga';

  @override
  String get addFuelSelectVehicle => 'Selecione um veículo';

  @override
  String get addFuelSaved => 'Abastecimento guardado com sucesso!';

  @override
  String get addFuelUpdated => 'Abastecimento atualizado!';

  @override
  String addFuelLastRecorded(String value) {
    return 'Último registo: $value km';
  }

  @override
  String get historyTitle => 'Histórico de abastecimentos';

  @override
  String get historyRecentEntries => 'Registos recentes';

  @override
  String get historySearchHint => 'Pesquisar valor, odómetro ou veículo';

  @override
  String get historyExportTooltip => 'Exportar estes registos';

  @override
  String historyEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registos',
      one: '1 registo',
    );
    return '$_temp0';
  }

  @override
  String historyFilteredCount(int shown, int total) {
    return '$shown de $total registos';
  }

  @override
  String historyExported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registos exportados',
      one: '1 registo exportado',
    );
    return '$_temp0';
  }

  @override
  String get historyNoEntriesYet => 'Ainda não há abastecimentos';

  @override
  String get historyNoMatches => 'Nenhum registo corresponde aos filtros';

  @override
  String get historyNoEntriesSubtitle =>
      'Adicione o seu primeiro abastecimento para começar\na controlar os seus gastos!';

  @override
  String get historyNoMatchesSubtitle =>
      'Experimente um intervalo de datas maior ou limpe os filtros';

  @override
  String get dateAll => 'Tudo';

  @override
  String get dateThisMonth => 'Este mês';

  @override
  String get dateLastThreeMonths => 'Últimos 3 meses';

  @override
  String get dateThisYear => 'Este ano';

  @override
  String get dateCustom => 'Personalizado';

  @override
  String get settingsTitle => 'Definições';

  @override
  String get settingsCurrency => 'Moeda';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsLanguageSystem => 'Predefinição do sistema';

  @override
  String get settingsTheme => 'Tema';

  @override
  String get settingsMonthlyBudget => 'Orçamento mensal';

  @override
  String settingsBudgetPerMonth(String amount) {
    return '$amount por mês';
  }

  @override
  String get settingsBackupToDrive => 'Cópia de segurança no Google Drive';

  @override
  String get settingsRestoreFromDrive => 'Restaurar do Google Drive';

  @override
  String get settingsExportCsv => 'Exportar CSV';

  @override
  String get settingsImportCsv => 'Importar CSV';

  @override
  String get settingsReplayTutorial => 'Rever tutorial';

  @override
  String settingsVersion(String version, String build) {
    return 'Versão $version (compilação $build)';
  }

  @override
  String get settingsRestoreCancelled => 'Restauro cancelado';

  @override
  String get settingsBackupSuccess => 'Cópia de segurança concluída!';

  @override
  String get commonAdd => 'Adicionar';

  @override
  String get commonUpdate => 'Atualizar';

  @override
  String get commonRemove => 'Remover';

  @override
  String get commonOther => 'Outro';

  @override
  String commonError(String message) {
    return 'Erro: $message';
  }

  @override
  String get commonNoData => 'Sem dados';

  @override
  String get commonTotalCost => 'Custo total';

  @override
  String get commonDistance => 'Distância';

  @override
  String get commonMonth => 'Mês';

  @override
  String get commonLiters => 'Litros';

  @override
  String get splashTagline => 'REGISTAR  •  CALCULAR  •  POUPAR';

  @override
  String get splashLoading => 'A iniciar a sua viagem…';

  @override
  String get splashTrackFuel => 'Controlar combustível';

  @override
  String get splashDriveSmart => 'Conduzir melhor';

  @override
  String get splashSaveMoney => 'Poupar dinheiro';

  @override
  String get onboardingSkip => 'Ignorar';

  @override
  String get onboardingNext => 'Seguinte';

  @override
  String get onboardingGetStarted => 'Começar';

  @override
  String get onboardingTrackTitle => 'Registe cada abastecimento';

  @override
  String get onboardingTrackBody =>
      'Registe os seus abastecimentos com litros, preço e leitura do odómetro. Nunca mais perca a conta às suas despesas.';

  @override
  String get onboardingVehiclesTitle => 'Vários veículos';

  @override
  String get onboardingVehiclesBody =>
      'Faça a gestão do seu carro, mota, camião ou qualquer veículo em separado. Alterne entre eles para ver estatísticas individuais.';

  @override
  String get onboardingMileageTitle => 'Cálculo inteligente do consumo';

  @override
  String get onboardingMileageBody =>
      'Calculamos automaticamente a sua eficiência a partir do odómetro. Veja a evolução ao longo do tempo.';

  @override
  String get onboardingBudgetTitle => 'Orçamento e relatórios';

  @override
  String get onboardingBudgetBody =>
      'Defina um orçamento mensal e visualize os seus gastos com gráficos claros. Mantenha o controlo dos custos.';

  @override
  String get onboardingBackupTitle => 'Cópia na nuvem';

  @override
  String get onboardingBackupBody =>
      'Sincronize os seus dados em segurança com o Google Drive. Restaure quando quiser, em qualquer dispositivo.';

  @override
  String get tripTitle => 'Calculadora de viagem';

  @override
  String get tripSubtitle => 'Estime o custo de combustível da sua viagem';

  @override
  String get tripDetails => 'Detalhes da viagem';

  @override
  String get tripDistanceLabel => 'Distância da viagem (km)';

  @override
  String get tripRoundTrip => 'Ida e volta';

  @override
  String get tripUseCustomMileage => 'Usar consumo personalizado';

  @override
  String get tripUseCustomPrice => 'Usar preço personalizado';

  @override
  String tripMileageLabel(String unit) {
    return 'Consumo ($unit)';
  }

  @override
  String tripFuelPriceLabel(String currency, String unit) {
    return 'Preço do combustível ($currency/$unit)';
  }

  @override
  String get tripEstimate => 'Estimativa da viagem';

  @override
  String get tripEstimatedTotal => 'Custo total estimado';

  @override
  String get tripFuelNeeded => 'Combustível necessário';

  @override
  String get tripChargeNeeded => 'Carga necessária';

  @override
  String get tripMileageUsed => 'Consumo utilizado';

  @override
  String get tripFuelPrice => 'Preço do combustível';

  @override
  String get tripCostPerKm => 'Custo por km';

  @override
  String get tripEnterDistance => 'Introduza a distância para calcular';

  @override
  String get tripNoPriceData =>
      'Sem dados de preço disponíveis. Introduza um preço personalizado.';

  @override
  String get vehiclesTitle => 'Os meus veículos';

  @override
  String get vehiclesSubtitle => 'Faça a gestão dos seus veículos';

  @override
  String get vehiclesAdd => 'Adicionar veículo';

  @override
  String get vehiclesEdit => 'Editar veículo';

  @override
  String get vehiclesDelete => 'Eliminar veículo';

  @override
  String get vehiclesNameLabel => 'Nome do veículo';

  @override
  String get vehiclesTypeLabel => 'Tipo de veículo';

  @override
  String get vehiclesFuelTypeLabel => 'Tipo de combustível';

  @override
  String get vehiclesSoldBy => 'Vendido por';

  @override
  String vehiclesTankCapacity(String unit) {
    return 'Capacidade do depósito ($unit) - opcional';
  }

  @override
  String get vehiclesBatteryCapacity =>
      'Capacidade da bateria (kWh) - opcional';

  @override
  String get vehiclesNameRequired => 'Introduza um nome para o veículo';

  @override
  String get vehiclesEmpty => 'Ainda não há veículos';

  @override
  String get vehiclesEmptyHint =>
      'Toque em + para adicionar o seu primeiro veículo';

  @override
  String vehiclesTankSuffix(String amount, String unit) {
    return 'depósito de $amount$unit';
  }

  @override
  String vehiclesBatterySuffix(String amount, String unit) {
    return 'bateria de $amount$unit';
  }

  @override
  String get maintenanceTitle => 'Registo de manutenção';

  @override
  String get maintenanceSubtitle => 'Acompanhe as revisões do seu veículo';

  @override
  String get maintenanceAdd => 'Adicionar serviço';

  @override
  String get maintenanceEdit => 'Editar serviço';

  @override
  String get maintenanceDelete => 'Eliminar registo';

  @override
  String maintenanceDeleteConfirm(String type) {
    return 'Tem a certeza de que quer eliminar «$type»?';
  }

  @override
  String get maintenanceServiceType => 'Tipo de serviço';

  @override
  String get maintenanceVehicleRequired => 'Veículo *';

  @override
  String get maintenanceSelectVehicle => 'Selecione um veículo';

  @override
  String maintenanceCostLabel(String currency) {
    return 'Custo ($currency)';
  }

  @override
  String get maintenanceDate => 'Data';

  @override
  String get maintenanceNotes => 'Notas (opcional)';

  @override
  String get maintenanceNotesHint => 'Notas adicionais...';

  @override
  String get maintenanceSummary => 'Resumo';

  @override
  String get maintenanceRecords => 'Registos';

  @override
  String get maintenanceLastService => 'Último serviço';

  @override
  String get maintenanceEmpty => 'Ainda não há registos de manutenção';

  @override
  String get maintenanceEmptyHint =>
      'Toque em + para adicionar o seu primeiro serviço';

  @override
  String get budgetTitle => 'Orçamento e relatórios';

  @override
  String get budgetSubtitle => 'Acompanhe os seus gastos em combustível';

  @override
  String get budgetSetTitle => 'Definir orçamento mensal';

  @override
  String get budgetSetAction => 'Definir orçamento';

  @override
  String get budgetRemove => 'Remover orçamento';

  @override
  String budgetAmountLabel(String currency) {
    return 'Orçamento ($currency)';
  }

  @override
  String get budgetSpent => 'Gasto';

  @override
  String get budgetAvgPerDay => 'Média/dia';

  @override
  String get budgetFills => 'Abastecimentos';

  @override
  String get budgetMonthlySpending => 'Gastos mensais';

  @override
  String get budgetWeeklyBreakdown => 'Detalhe semanal';

  @override
  String get budgetMonthlyComparison => 'Comparação mensal';

  @override
  String budgetDayRange(String range) {
    return 'Dia $range';
  }

  @override
  String budgetOverBy(String amount) {
    return '$amount acima do orçamento';
  }

  @override
  String budgetRemaining(String amount) {
    return '$amount restante';
  }

  @override
  String get spendingTitle => 'Comparação de gastos';

  @override
  String get spendingSubtitle => 'Compare períodos lado a lado';

  @override
  String get spendingDetailed => 'Comparação detalhada';

  @override
  String get spendingMetric => 'Métrica';

  @override
  String get spendingTotalSpent => 'Total gasto';

  @override
  String get spendingTotalLiters => 'Litros totais';

  @override
  String get spendingFillUps => 'Abastecimentos';

  @override
  String get spendingAvgPerFill => 'Média/abastecimento';

  @override
  String spendingSelectPeriod(String label) {
    return 'Selecionar $label';
  }

  @override
  String spendingPeriod(String letter) {
    return 'Período $letter';
  }

  @override
  String get comparisonTitle => 'Comparar veículos';

  @override
  String get comparisonNeedTwo =>
      'Adicione pelo menos 2 veículos para comparar';

  @override
  String get comparisonMaintenance => 'Manutenção';

  @override
  String get comparisonTotalFuel => 'Combustível total';

  @override
  String get comparisonFillUps => 'Abastecimentos';

  @override
  String get comparisonEfficiency => 'Eficiência';

  @override
  String get comparisonCostPerKmAllIn => 'Custo por km · total';

  @override
  String get comparisonCostPerKmNote => 'combustível + manutenção ÷ distância';

  @override
  String get comparisonCostPerKmShort => 'Custo/km';

  @override
  String get comparisonMixedUnits =>
      'Estes veículos usam unidades diferentes: compare cada barra consigo mesma, não com as outras.';

  @override
  String get howToTitle => 'Como usar';

  @override
  String get howToWelcome => 'Bem-vindo ao Fuel Cost!';

  @override
  String get howToWelcomeBody =>
      'Acompanhe facilmente o seu consumo, custos e eficiência.';

  @override
  String get howToGettingStarted => 'Como começar';

  @override
  String get howToStep1 =>
      'Adicione o seu primeiro abastecimento tocando em «Adicionar combustível»';

  @override
  String get howToStep2 =>
      'Introduza a quantidade de combustível e o preço por unidade';

  @override
  String get howToStep3 =>
      'Opcionalmente, adicione a leitura do odómetro para acompanhar o consumo';

  @override
  String get howToStep4 =>
      'Veja o seu histórico e estatísticas no ecrã principal';

  @override
  String get howToMileageTitle => 'Como o consumo é calculado';

  @override
  String get howToMileageFormulaTitle => 'Fórmula do consumo';

  @override
  String get howToMileageFormula =>
      'Consumo = distância percorrida ÷ combustível adicionado';

  @override
  String get howToDistanceFormula =>
      'Distância = odómetro atual - odómetro anterior';

  @override
  String get howToExample => 'Exemplo de cálculo:';

  @override
  String get howToPreviousOdometer => 'Odómetro anterior:';

  @override
  String get howToCurrentOdometer => 'Odómetro atual:';

  @override
  String get howToDistanceTraveled => 'Distância percorrida:';

  @override
  String get howToFuelAdded => 'Combustível adicionado:';

  @override
  String get howToMileageResult => 'Consumo:';

  @override
  String get howToKeyFeatures => 'Funcionalidades principais';

  @override
  String get howToFeatureDashboard => 'Painel inteligente';

  @override
  String get howToFeatureDashboardBody =>
      'Veja num relance custos, consumo e eficiência';

  @override
  String get howToFeatureHistory => 'Histórico detalhado';

  @override
  String get howToFeatureHistoryBody =>
      'Acompanhe todos os abastecimentos com datas, quantidades e custos';

  @override
  String get howToFeatureEfficiency => 'Acompanhamento da eficiência';

  @override
  String get howToFeatureEfficiencyBody =>
      'Monitorize a eficiência do seu veículo ao longo do tempo';

  @override
  String get howToFeatureData => 'Gestão de dados';

  @override
  String get howToFeatureDataBody =>
      'Faça a gestão e limpe os seus dados facilmente quando precisar';

  @override
  String get howToTips => 'Dicas para um melhor acompanhamento';

  @override
  String get howToTip1 =>
      'Encha sempre o depósito por completo para medições precisas';

  @override
  String get howToTip2 => 'Registe a leitura do odómetro em cada abastecimento';

  @override
  String get howToTip3 => 'Adicione os abastecimentos logo após abastecer';

  @override
  String get howToTip4 =>
      'Verifique regularmente as suas tendências de eficiência';

  @override
  String get howToTip5 => 'Puxe para baixo para atualizar os seus dados';

  @override
  String get restoreTitle => 'Rever conflitos';

  @override
  String get restoreConfirm => 'CONFIRMAR';

  @override
  String get restoreUseBackupAll => 'Usar a cópia em tudo';

  @override
  String get restoreKeepAllMine => 'Manter tudo o meu';

  @override
  String get restoreMine => 'Meu';

  @override
  String get restoreBackup => 'Cópia';

  @override
  String get restoreExplainer =>
      'Estes registos mudaram de ambos os lados. Escolha qual versão manter; os novos são adicionados automaticamente.';

  @override
  String get restoreSectionVehicles => 'Veículos';

  @override
  String get restoreSectionSettings => 'Definições';

  @override
  String get restoreSectionMaintenance => 'Manutenção';

  @override
  String get restoreSectionEntries => 'Abastecimentos';

  @override
  String get restoreUnchanged => 'inalterado';

  @override
  String restoreConflictCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count conflitos',
      one: '1 conflito',
    );
    return '$_temp0';
  }

  @override
  String restoreNewCount(int count) {
    return '$count novos';
  }

  @override
  String restoreUnchangedCount(int count) {
    return '$count inalterados';
  }
}
