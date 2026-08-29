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
  String howToWelcome(String app) {
    return 'Bem-vindo ao $app!';
  }

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

  @override
  String get commonRestore => 'Restaurar';

  @override
  String get commonSignIn => 'Iniciar sessão';

  @override
  String get commonDisconnect => 'Desligar';

  @override
  String get commonProcessing => 'A processar...';

  @override
  String get commonNoThanks => 'Não, obrigado';

  @override
  String get commonNotNow => 'Agora não';

  @override
  String get commonMileage => 'Consumo';

  @override
  String get settingsSubtitle => 'Faça a gestão das suas preferências e dados';

  @override
  String get settingsAppearance => 'Aparência';

  @override
  String get settingsPreferences => 'Preferências';

  @override
  String get settingsDataManagement => 'Gestão de dados';

  @override
  String get settingsExportImport => 'Exportar e importar';

  @override
  String get settingsAdvanced => 'Avançado';

  @override
  String get settingsAbout => 'Acerca de';

  @override
  String get settingsAccentColor => 'Cor de destaque';

  @override
  String get settingsAccentColorSubtitle => 'Personalize a cor da app';

  @override
  String get settingsChooseAccentColor => 'Escolher cor de destaque';

  @override
  String get settingsChooseTheme => 'Escolher tema';

  @override
  String settingsThemeCurrent(String theme) {
    return 'Atual: $theme';
  }

  @override
  String settingsCurrencyCurrent(String symbol, String name) {
    return 'Atual: $symbol ($name)';
  }

  @override
  String settingsCurrencyChanged(String symbol, String name) {
    return 'Moeda alterada para $symbol ($name)';
  }

  @override
  String settingsBudgetLabel(String currency) {
    return 'Orçamento ($currency)';
  }

  @override
  String get settingsBudgetHint => 'p. ex. 5000';

  @override
  String get settingsGoogleDriveBackup => 'Cópia no Google Drive';

  @override
  String settingsSignedInAs(String email) {
    return 'Sessão iniciada como $email';
  }

  @override
  String get settingsSignOutSubtitle => 'Terminar sessão da cópia do Google';

  @override
  String get settingsDisconnected => 'Desligado do Google Drive';

  @override
  String get settingsBackupNow => 'Fazer cópia agora';

  @override
  String get settingsBackupNowSubtitle =>
      'Envie os seus dados para o Google Drive';

  @override
  String get settingsAutoBackup => 'Cópia automática';

  @override
  String get settingsAutoBackupSubtitle =>
      'Fazer cópia automaticamente ao guardar um registo';

  @override
  String get settingsAutoBackupOffWarning =>
      'As cópias existentes serão mantidas. Não serão feitas novas cópias.';

  @override
  String get settingsRestoreFromBackup => 'Restaurar da cópia';

  @override
  String get settingsRestoreSubtitle => 'Transfira e restaure os seus dados';

  @override
  String get settingsRestoreWarning =>
      'Isto substituirá todos os dados atuais pela cópia. Não pode ser anulado.';

  @override
  String settingsRestoreFailed(String message) {
    return 'Falha ao restaurar: $message';
  }

  @override
  String settingsBackupFailed(String message) {
    return 'Falha na cópia: $message';
  }

  @override
  String get settingsExportData => 'Exportar dados';

  @override
  String get settingsExportToCsv => 'Exportar para CSV';

  @override
  String get settingsExportSubtitle =>
      'Exporte todos os registos como ficheiro CSV';

  @override
  String get settingsSelectExportVehicle => 'Selecione que veículo exportar';

  @override
  String get settingsAllVehicles => 'Todos os veículos';

  @override
  String get settingsIncludeAllVehicles => 'Incluir dados de todos os veículos';

  @override
  String get settingsNoVehicle => 'Sem veículo';

  @override
  String get settingsNoVehicleSubtitle => 'Não atribuir a nenhum veículo';

  @override
  String get settingsNothingToExport =>
      'Não há registos para exportar deste veículo';

  @override
  String settingsEntriesExported(int count) {
    return '$count registos exportados';
  }

  @override
  String get settingsImportData => 'Importar dados';

  @override
  String get settingsImportFromCsv => 'Importar de CSV';

  @override
  String get settingsImportSubtitle => 'Importe registos de um ficheiro CSV';

  @override
  String get settingsAssignImported =>
      'Atribuir os registos importados a um veículo';

  @override
  String get settingsCsvInvalid => 'O ficheiro CSV está vazio ou é inválido';

  @override
  String settingsEntriesImported(int count) {
    return '$count registos importados';
  }

  @override
  String settingsExportFailed(String message) {
    return 'Erro ao exportar CSV: $message';
  }

  @override
  String settingsImportFailed(String message) {
    return 'Erro ao importar CSV: $message';
  }

  @override
  String get settingsClearEntries => 'Limpar abastecimentos';

  @override
  String get settingsClearEntriesAction => 'Limpar registos';

  @override
  String get settingsClearEntriesSubtitle => 'Remove todos os abastecimentos';

  @override
  String get settingsClearEntriesWarning =>
      'Isto eliminará permanentemente todos os seus abastecimentos.';

  @override
  String get settingsEntriesCleared => 'Abastecimentos limpos com sucesso';

  @override
  String get settingsClearOdometer => 'Limpar dados do odómetro';

  @override
  String get settingsClearOdometerAction => 'Limpar odómetro';

  @override
  String get settingsClearOdometerSubtitle =>
      'Repõe a leitura atual do odómetro';

  @override
  String get settingsClearOdometerWarning =>
      'Isto reporá a leitura do seu odómetro.';

  @override
  String get settingsOdometerCleared => 'Dados do odómetro limpos com sucesso';

  @override
  String get settingsClearAllData => 'Limpar todos os dados';

  @override
  String get settingsClearAllAction => 'Limpar tudo';

  @override
  String get settingsClearAllSubtitle =>
      'Remove todos os registos e o odómetro';

  @override
  String get settingsClearAllWarning =>
      'Isto eliminará permanentemente TODOS os dados. Não pode ser anulado.';

  @override
  String get settingsAllDataCleared =>
      'Todos os dados foram limpos com sucesso';

  @override
  String get settingsResetApp => 'Repor app';

  @override
  String get settingsClearAllCache => 'Limpar cache e preferências';

  @override
  String get settingsClearCacheAction => 'Limpar tudo';

  @override
  String get settingsResetSubtitle => 'Repõe a app nas definições de fábrica';

  @override
  String get settingsResetWarning =>
      'Isto reporá completamente a app. TODOS os dados serão perdidos.';

  @override
  String get settingsCacheCleared => 'Cache e preferências limpas';

  @override
  String settingsClearFailed(String message) {
    return 'Erro ao limpar dados: $message';
  }

  @override
  String get settingsAppVersion => 'Versão da app';

  @override
  String get settingsRateApp => 'Avaliar a app';

  @override
  String settingsRateSubtitle(String app) {
    return 'Gosta do $app? Deixe uma avaliação';
  }

  @override
  String get settingsReplayTutorialSubtitle =>
      'Ver novamente a introdução e a visita guiada';

  @override
  String get homeYourFuelStats => 'As suas estatísticas';

  @override
  String get homeQuickActions => 'Ações rápidas';

  @override
  String get homeAddFuelEntry => 'Adicionar abastecimento';

  @override
  String get homeViewFuelHistory => 'Ver histórico';

  @override
  String get homeSwitchVehicles => 'Mudar de veículo';

  @override
  String get homeTripCalculator => 'Calculadora de viagem';

  @override
  String get homeTripCalculatorSubtitle => 'Estime o custo de uma viagem';

  @override
  String get homeBudgetReports => 'Orçamento e relatórios';

  @override
  String get homeBudgetReportsSubtitle =>
      'Gastos mensais e controlo do orçamento';

  @override
  String get homeSpendingComparison => 'Comparação de gastos';

  @override
  String get homeSpendingComparisonSubtitle => 'Compare meses lado a lado';

  @override
  String get homeCompareVehicles => 'Comparar veículos';

  @override
  String get homeCompareVehiclesSubtitle => 'Análise comparativa de eficiência';

  @override
  String get homeMaintenanceLog => 'Registo de manutenção';

  @override
  String get homeMaintenanceLogSubtitle =>
      'Acompanhe as revisões do seu veículo';

  @override
  String get homeThanksFeedback => 'Obrigado pelo seu feedback!';

  @override
  String get addFuelAddVehicle => 'Adicionar veículo';

  @override
  String addFuelSaveFailed(String message) {
    return 'Erro ao guardar o registo: $message';
  }

  @override
  String get addFuelAutoBackupOk => 'Cópia automática concluída!';

  @override
  String addFuelAutoBackupFailed(String message) {
    return 'Falha na cópia automática: $message';
  }

  @override
  String get addFuelBackupOk => 'Cópia concluída!';

  @override
  String get addFuelConnectedBackedUp => 'Ligado e cópia concluída!';

  @override
  String get historyEntryDeleted => 'Registo eliminado';

  @override
  String get historyTimeUpdated => 'Hora do registo atualizada';

  @override
  String historyDeleteFailed(String message) {
    return 'Erro ao eliminar o registo: $message';
  }

  @override
  String historyLoadFailed(String message) {
    return 'Erro ao carregar os dados: $message';
  }

  @override
  String historyExportFailed(String message) {
    return 'Erro ao exportar CSV: $message';
  }

  @override
  String get entryCardEdit => 'Editar';

  @override
  String get entryCardDelete => 'Eliminar';

  @override
  String get entryCardChangeTime => 'Alterar hora';

  @override
  String get deleteEntryTitle => 'Eliminar registo';

  @override
  String rateTitle(String app) {
    return 'Gosta do $app?';
  }

  @override
  String get rateNow => 'Avaliar agora';

  @override
  String get rateLater => 'Agora não';

  @override
  String get currencyDialogTitle => 'Selecionar moeda';

  @override
  String get currencyDialogSearch => 'Procurar moedas...';

  @override
  String get chartNeedMoreData =>
      'Adicione mais abastecimentos para ver tendências';

  @override
  String summaryAvgPricePerUnit(String unit) {
    return 'Preço médio por $unit';
  }

  @override
  String summaryAvgPriceShort(String unit) {
    return 'Preço médio/$unit';
  }

  @override
  String get mileageDistanceTraveled => 'Distância percorrida:';

  @override
  String get mileageFuelEfficiency => 'Eficiência:';

  @override
  String budgetWeekShort(int number) {
    return 'S$number';
  }

  @override
  String get vehiclesNameHint => 'p. ex. O meu carro';

  @override
  String get maintenanceCostHint => 'p. ex. 150';

  @override
  String vehiclesDeleteConfirm(String name) {
    return 'Tem a certeza de que quer eliminar «$name»? Os abastecimentos não serão eliminados.';
  }

  @override
  String get restoreLabelVehicle => 'Veículo';

  @override
  String get restoreLabelSetting => 'Definição';

  @override
  String get fuelType_petrol => 'Gasolina';

  @override
  String get fuelType_diesel => 'Gasóleo';

  @override
  String get fuelType_cng => 'GNC';

  @override
  String get fuelType_electric => 'Elétrico';

  @override
  String get fuelType_hybrid => 'Híbrido';

  @override
  String get vehicleType_directions_car => 'Carro';

  @override
  String get vehicleType_two_wheeler => 'Mota';

  @override
  String get vehicleType_local_shipping => 'Camião';

  @override
  String get vehicleType_airport_shuttle => 'Carrinha';

  @override
  String get vehicleType_electric_car => 'Carro elétrico';

  @override
  String get vehicleType_pedal_bike => 'Bicicleta';

  @override
  String get maintenanceType_oil_change => 'Mudança de óleo';

  @override
  String get maintenanceType_tire_rotation => 'Rotação de pneus';

  @override
  String get maintenanceType_brake_service => 'Travões';

  @override
  String get maintenanceType_air_filter => 'Filtro de ar';

  @override
  String get maintenanceType_transmission => 'Transmissão';

  @override
  String get maintenanceType_battery => 'Bateria';

  @override
  String get maintenanceType_coolant => 'Líquido de refrigeração';

  @override
  String get maintenanceType_spark_plugs => 'Velas';

  @override
  String get maintenanceType_belt_replacement => 'Substituição de correia';

  @override
  String get maintenanceType_wheel_alignment => 'Alinhamento';

  @override
  String get maintenanceType_suspension => 'Suspensão';

  @override
  String get maintenanceType_exhaust => 'Escape';

  @override
  String get maintenanceType_ac_service => 'Ar condicionado';

  @override
  String get maintenanceType_wiper_blades => 'Escovas limpa-vidros';

  @override
  String get maintenanceType_headlights => 'Faróis';

  @override
  String get maintenanceType_car_wash => 'Lavagem';

  @override
  String get maintenanceType_detailing => 'Limpeza completa';

  @override
  String get maintenanceType_inspection => 'Inspeção';

  @override
  String get maintenanceType_insurance => 'Seguro';

  @override
  String get maintenanceType_registration => 'Registo';

  @override
  String get maintenanceType_towing => 'Reboque';

  @override
  String get maintenanceType_general_service => 'Revisão geral';

  @override
  String get maintenanceType_body_repair => 'Chapa e pintura';

  @override
  String get maintenanceType_other => 'Outro';

  @override
  String get homeAddFuelSubtitle => 'Registe os seus abastecimentos';

  @override
  String get homeViewHistorySubtitle => 'Consulte os seus registos';

  @override
  String settingsEntriesImportedTo(int count, String vehicle) {
    return '$count registos importados para $vehicle';
  }

  @override
  String get homeOverallSummary => 'Resumo geral';

  @override
  String get homeSummary => 'Resumo';

  @override
  String get homeMonitorEfficiency => 'Acompanhe a sua eficiência';

  @override
  String get tourVehiclesTitle => 'Mudar de veículo';

  @override
  String get tourVehiclesBody =>
      'Escolha «Todos» para ver estatísticas combinadas, ou selecione um veículo específico. Toque no botão + no fim para adicionar um novo.';

  @override
  String get tourSettingsBody =>
      'Personalize a moeda, o tema e o orçamento mensal, e faça cópia dos seus dados no Google Drive a partir daqui.';

  @override
  String get tourStatsBody =>
      'Veja num relance os gastos deste mês, o custo do último abastecimento, os dias decorridos e a sua eficiência geral.';

  @override
  String get tourActionsBody =>
      'Aceda ao histórico, à calculadora de viagem, aos relatórios de orçamento, ao registo de manutenção e a mais ferramentas.';

  @override
  String get tourAddFuelBody =>
      'Toque aqui para registar um abastecimento. Irá introduzir a quantidade, o preço e a leitura do odómetro.';

  @override
  String get comparisonMetric => 'Métrica';

  @override
  String get comparisonScroll => 'Deslizar';

  @override
  String get comparisonSummary => 'Resumo';

  @override
  String get comparisonSelectTwo =>
      'Selecione pelo menos 2 veículos para comparar';

  @override
  String get comparisonSubtitle => 'Eficiência comparada';

  @override
  String get historyLoading => 'A carregar dados...';

  @override
  String get historyLoadingHint => 'Aguarde enquanto obtemos os seus dados';

  @override
  String get currencyNoResults => 'Nenhuma moeda encontrada';

  @override
  String get currencyNoResultsHint => 'Tente outras palavras';

  @override
  String get mileageCalculationTitle => 'Cálculo do consumo';

  @override
  String mileageSinceLastFill(String date) {
    return 'Desde o último abastecimento: $date';
  }

  @override
  String get addFuelNoVehicles => 'Sem veículos. Adicione um primeiro.';

  @override
  String budgetProgressLabel(String amount, String percent) {
    return 'Orçamento: $amount  |  $percent% usado';
  }

  @override
  String get howToAutoCalc =>
      'A app calcula automaticamente a sua eficiência quando indica as leituras do odómetro:';

  @override
  String get deleteEntryMessage =>
      'Tem a certeza de que quer eliminar este abastecimento? Esta ação não pode ser anulada.';

  @override
  String get chartNotEnoughData => 'Dados insuficientes';

  @override
  String get chartAnalytics => 'Análises';

  @override
  String entryCardOdometer(String value) {
    return 'Odómetro: $value km';
  }

  @override
  String get summaryFillUpTitle => 'Resumo do abastecimento';

  @override
  String get unitLong_L => 'Litros';

  @override
  String get unitWord_L => 'litro';

  @override
  String get unitLong_kg => 'Quilogramas';

  @override
  String get unitWord_kg => 'kg';

  @override
  String get unitLong_m3 => 'Metros cúbicos';

  @override
  String get unitWord_m3 => 'm³';

  @override
  String get unitLong_kWh => 'Quilowatts-hora';

  @override
  String get unitWord_kWh => 'kWh';

  @override
  String get summaryTotalFuel => 'Combustível total';

  @override
  String summaryTotalOf(String unit) {
    return 'Total de $unit';
  }

  @override
  String get chartCostTrend => 'Tendência de custos';

  @override
  String get chartConsumption => 'Consumo de combustível';

  @override
  String get chartEfficiency => 'Eficiência';

  @override
  String get chartTrend => 'Tendência';

  @override
  String chartCostAxis(String currency) {
    return 'Custo ($currency)';
  }
}
