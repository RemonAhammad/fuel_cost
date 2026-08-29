// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Fuel Cost';

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonSave => 'Enregistrer';

  @override
  String get commonDelete => 'Supprimer';

  @override
  String get commonEdit => 'Modifier';

  @override
  String get commonClear => 'Effacer';

  @override
  String get commonAll => 'Tous';

  @override
  String get commonNotAvailable => 'N/D';

  @override
  String get commonNotSet => 'Non défini';

  @override
  String get homeTotalCost => 'Coût total';

  @override
  String get homeTotalFuels => 'Carburant total';

  @override
  String get homeTotalDistance => 'Distance totale';

  @override
  String homeTotalOf(String unit) {
    return 'Total $unit';
  }

  @override
  String get homeLastTripMileage => 'Consommation du dernier trajet';

  @override
  String get homeOverallMileage => 'Consommation globale';

  @override
  String get homeMaxMileage => 'Consommation max';

  @override
  String get homeMinMileage => 'Consommation min';

  @override
  String get homeThisMonth => 'Ce mois-ci';

  @override
  String get homeAddFuel => 'Ajouter du carburant';

  @override
  String get homeHistory => 'Historique';

  @override
  String get homeSettings => 'Paramètres';

  @override
  String get addFuelTitle => 'Ajouter un plein';

  @override
  String get addFuelEditTitle => 'Modifier le plein';

  @override
  String addFuelAmountLabel(String unit) {
    return 'Quantité de carburant ($unit)';
  }

  @override
  String addFuelChargeAmountLabel(String unit) {
    return 'Quantité de charge ($unit)';
  }

  @override
  String addFuelPricePerUnit(String unit) {
    return 'Prix par $unit';
  }

  @override
  String get addFuelOdometer => 'Relevé du compteur';

  @override
  String get addFuelVehicle => 'Véhicule';

  @override
  String get addFuelFuelType => 'Type de carburant';

  @override
  String get addFuelPetrol => 'Essence';

  @override
  String get addFuelCharge => 'Charge';

  @override
  String get addFuelSelectVehicle => 'Veuillez sélectionner un véhicule';

  @override
  String get addFuelSaved => 'Plein enregistré avec succès !';

  @override
  String get addFuelUpdated => 'Plein mis à jour !';

  @override
  String addFuelLastRecorded(String value) {
    return 'Dernier relevé : $value km';
  }

  @override
  String get historyTitle => 'Historique des pleins';

  @override
  String get historyRecentEntries => 'Entrées récentes';

  @override
  String get historySearchHint => 'Rechercher montant, compteur ou véhicule';

  @override
  String get historyExportTooltip => 'Exporter ces entrées';

  @override
  String historyEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entrées',
      one: '1 entrée',
    );
    return '$_temp0';
  }

  @override
  String historyFilteredCount(int shown, int total) {
    return '$shown entrées sur $total';
  }

  @override
  String historyExported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entrées exportées',
      one: '1 entrée exportée',
    );
    return '$_temp0';
  }

  @override
  String get historyNoEntriesYet => 'Aucun plein enregistré';

  @override
  String get historyNoMatches => 'Aucune entrée ne correspond à vos filtres';

  @override
  String get historyNoEntriesSubtitle =>
      'Ajoutez votre premier plein pour commencer\nà suivre vos dépenses !';

  @override
  String get historyNoMatchesSubtitle =>
      'Essayez une période plus large ou effacez vos filtres';

  @override
  String get dateAll => 'Tout';

  @override
  String get dateThisMonth => 'Ce mois-ci';

  @override
  String get dateLastThreeMonths => '3 derniers mois';

  @override
  String get dateThisYear => 'Cette année';

  @override
  String get dateCustom => 'Personnalisé';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get settingsCurrency => 'Devise';

  @override
  String get settingsLanguage => 'Langue';

  @override
  String get settingsLanguageSystem => 'Langue du système';

  @override
  String get settingsTheme => 'Thème';

  @override
  String get settingsMonthlyBudget => 'Budget mensuel';

  @override
  String settingsBudgetPerMonth(String amount) {
    return '$amount par mois';
  }

  @override
  String get settingsBackupToDrive => 'Sauvegarder sur Google Drive';

  @override
  String get settingsRestoreFromDrive => 'Restaurer depuis Google Drive';

  @override
  String get settingsExportCsv => 'Exporter en CSV';

  @override
  String get settingsImportCsv => 'Importer un CSV';

  @override
  String get settingsReplayTutorial => 'Revoir le tutoriel';

  @override
  String settingsVersion(String version, String build) {
    return 'Version $version (build $build)';
  }

  @override
  String get settingsRestoreCancelled => 'Restauration annulée';

  @override
  String get settingsBackupSuccess => 'Sauvegarde réussie !';

  @override
  String get commonAdd => 'Ajouter';

  @override
  String get commonUpdate => 'Mettre à jour';

  @override
  String get commonRemove => 'Retirer';

  @override
  String get commonOther => 'Autre';

  @override
  String commonError(String message) {
    return 'Erreur : $message';
  }

  @override
  String get commonNoData => 'Aucune donnée';

  @override
  String get commonTotalCost => 'Coût total';

  @override
  String get commonDistance => 'Distance';

  @override
  String get commonMonth => 'Mois';

  @override
  String get commonLiters => 'Litres';

  @override
  String get splashTagline => 'SUIVRE  •  CALCULER  •  ÉCONOMISER';

  @override
  String get splashLoading => 'Démarrage de votre trajet…';

  @override
  String get splashTrackFuel => 'Suivi carburant';

  @override
  String get splashDriveSmart => 'Conduite maligne';

  @override
  String get splashSaveMoney => 'Économies';

  @override
  String get onboardingSkip => 'Passer';

  @override
  String get onboardingNext => 'Suivant';

  @override
  String get onboardingGetStarted => 'Commencer';

  @override
  String get onboardingTrackTitle => 'Suivez chaque plein';

  @override
  String get onboardingTrackBody =>
      'Notez vos pleins avec les litres, le prix et le relevé du compteur. Ne perdez plus jamais le fil de vos dépenses.';

  @override
  String get onboardingVehiclesTitle => 'Plusieurs véhicules';

  @override
  String get onboardingVehiclesBody =>
      'Gérez votre voiture, moto, camion ou tout autre véhicule séparément. Basculez à tout moment pour voir des statistiques distinctes.';

  @override
  String get onboardingMileageTitle => 'Calcul intelligent de la consommation';

  @override
  String get onboardingMileageBody =>
      'Nous calculons automatiquement votre efficacité à partir du compteur. Suivez son évolution dans le temps.';

  @override
  String get onboardingBudgetTitle => 'Budget et rapports';

  @override
  String get onboardingBudgetBody =>
      'Définissez un budget mensuel et visualisez vos dépenses avec des graphiques clairs. Gardez le contrôle de vos coûts.';

  @override
  String get onboardingBackupTitle => 'Sauvegarde dans le cloud';

  @override
  String get onboardingBackupBody =>
      'Synchronisez vos données en toute sécurité avec Google Drive. Restaurez-les quand vous voulez, sur n\'importe quel appareil.';

  @override
  String get tripTitle => 'Calculateur de trajet';

  @override
  String get tripSubtitle => 'Estimez le coût en carburant de votre trajet';

  @override
  String get tripDetails => 'Détails du trajet';

  @override
  String get tripDistanceLabel => 'Distance du trajet (km)';

  @override
  String get tripRoundTrip => 'Aller-retour';

  @override
  String get tripUseCustomMileage => 'Utiliser une consommation personnalisée';

  @override
  String get tripUseCustomPrice => 'Utiliser un prix personnalisé';

  @override
  String tripMileageLabel(String unit) {
    return 'Consommation ($unit)';
  }

  @override
  String tripFuelPriceLabel(String currency, String unit) {
    return 'Prix du carburant ($currency/$unit)';
  }

  @override
  String get tripEstimate => 'Estimation du trajet';

  @override
  String get tripEstimatedTotal => 'Coût total estimé';

  @override
  String get tripFuelNeeded => 'Carburant nécessaire';

  @override
  String get tripChargeNeeded => 'Charge nécessaire';

  @override
  String get tripMileageUsed => 'Consommation utilisée';

  @override
  String get tripFuelPrice => 'Prix du carburant';

  @override
  String get tripCostPerKm => 'Coût par km';

  @override
  String get tripEnterDistance => 'Saisissez la distance pour calculer';

  @override
  String get tripNoPriceData =>
      'Aucune donnée de prix disponible. Saisissez un prix personnalisé.';

  @override
  String get vehiclesTitle => 'Mes véhicules';

  @override
  String get vehiclesSubtitle => 'Gérez vos véhicules';

  @override
  String get vehiclesAdd => 'Ajouter un véhicule';

  @override
  String get vehiclesEdit => 'Modifier le véhicule';

  @override
  String get vehiclesDelete => 'Supprimer le véhicule';

  @override
  String get vehiclesNameLabel => 'Nom du véhicule';

  @override
  String get vehiclesTypeLabel => 'Type de véhicule';

  @override
  String get vehiclesFuelTypeLabel => 'Type de carburant';

  @override
  String get vehiclesSoldBy => 'Vendu par';

  @override
  String vehiclesTankCapacity(String unit) {
    return 'Capacité du réservoir ($unit) - facultatif';
  }

  @override
  String get vehiclesBatteryCapacity =>
      'Capacité de la batterie (kWh) - facultatif';

  @override
  String get vehiclesNameRequired => 'Veuillez saisir un nom de véhicule';

  @override
  String get vehiclesEmpty => 'Aucun véhicule ajouté';

  @override
  String get vehiclesEmptyHint =>
      'Appuyez sur + pour ajouter votre premier véhicule';

  @override
  String vehiclesTankSuffix(String amount, String unit) {
    return 'réservoir de $amount$unit';
  }

  @override
  String vehiclesBatterySuffix(String amount, String unit) {
    return 'batterie de $amount$unit';
  }

  @override
  String get maintenanceTitle => 'Carnet d\'entretien';

  @override
  String get maintenanceSubtitle => 'Suivez les entretiens de votre véhicule';

  @override
  String get maintenanceAdd => 'Ajouter un entretien';

  @override
  String get maintenanceEdit => 'Modifier l\'entretien';

  @override
  String get maintenanceDelete => 'Supprimer l\'enregistrement';

  @override
  String maintenanceDeleteConfirm(String type) {
    return 'Voulez-vous vraiment supprimer « $type » ?';
  }

  @override
  String get maintenanceServiceType => 'Type d\'entretien';

  @override
  String get maintenanceVehicleRequired => 'Véhicule *';

  @override
  String get maintenanceSelectVehicle => 'Veuillez sélectionner un véhicule';

  @override
  String maintenanceCostLabel(String currency) {
    return 'Coût ($currency)';
  }

  @override
  String get maintenanceDate => 'Date';

  @override
  String get maintenanceNotes => 'Notes (facultatif)';

  @override
  String get maintenanceNotesHint => 'Notes supplémentaires...';

  @override
  String get maintenanceSummary => 'Résumé';

  @override
  String get maintenanceRecords => 'Enregistrements';

  @override
  String get maintenanceLastService => 'Dernier entretien';

  @override
  String get maintenanceEmpty => 'Aucun entretien enregistré';

  @override
  String get maintenanceEmptyHint =>
      'Appuyez sur + pour ajouter votre premier entretien';

  @override
  String get budgetTitle => 'Budget et rapports';

  @override
  String get budgetSubtitle => 'Suivez vos dépenses de carburant';

  @override
  String get budgetSetTitle => 'Définir le budget mensuel';

  @override
  String get budgetSetAction => 'Définir le budget';

  @override
  String get budgetRemove => 'Supprimer le budget';

  @override
  String budgetAmountLabel(String currency) {
    return 'Budget ($currency)';
  }

  @override
  String get budgetSpent => 'Dépensé';

  @override
  String get budgetAvgPerDay => 'Moy./jour';

  @override
  String get budgetFills => 'Pleins';

  @override
  String get budgetMonthlySpending => 'Dépenses mensuelles';

  @override
  String get budgetWeeklyBreakdown => 'Détail hebdomadaire';

  @override
  String get budgetMonthlyComparison => 'Comparaison mensuelle';

  @override
  String budgetDayRange(String range) {
    return 'Jour $range';
  }

  @override
  String budgetOverBy(String amount) {
    return '$amount au-dessus du budget';
  }

  @override
  String budgetRemaining(String amount) {
    return '$amount restant';
  }

  @override
  String get spendingTitle => 'Comparaison des dépenses';

  @override
  String get spendingSubtitle => 'Comparez les périodes côte à côte';

  @override
  String get spendingDetailed => 'Comparaison détaillée';

  @override
  String get spendingMetric => 'Indicateur';

  @override
  String get spendingTotalSpent => 'Total dépensé';

  @override
  String get spendingTotalLiters => 'Litres au total';

  @override
  String get spendingFillUps => 'Pleins';

  @override
  String get spendingAvgPerFill => 'Moy./plein';

  @override
  String spendingSelectPeriod(String label) {
    return 'Sélectionner $label';
  }

  @override
  String spendingPeriod(String letter) {
    return 'Période $letter';
  }

  @override
  String get comparisonTitle => 'Comparer les véhicules';

  @override
  String get comparisonNeedTwo => 'Ajoutez au moins 2 véhicules pour comparer';

  @override
  String get comparisonMaintenance => 'Entretien';

  @override
  String get comparisonTotalFuel => 'Carburant total';

  @override
  String get comparisonFillUps => 'Pleins';

  @override
  String get comparisonEfficiency => 'Efficacité';

  @override
  String get comparisonCostPerKmAllIn => 'Coût par km · tout compris';

  @override
  String get comparisonCostPerKmNote => 'carburant + entretien ÷ distance';

  @override
  String get comparisonCostPerKmShort => 'Coût/km';

  @override
  String get comparisonMixedUnits =>
      'Ces véhicules utilisent des unités différentes : comparez chaque barre à elle-même, pas aux autres.';

  @override
  String get howToTitle => 'Mode d\'emploi';

  @override
  String get howToWelcome => 'Bienvenue dans Fuel Cost !';

  @override
  String get howToWelcomeBody =>
      'Suivez facilement votre consommation, vos coûts et votre efficacité.';

  @override
  String get howToGettingStarted => 'Comment démarrer';

  @override
  String get howToStep1 =>
      'Ajoutez votre premier plein en appuyant sur « Ajouter du carburant »';

  @override
  String get howToStep2 =>
      'Saisissez la quantité de carburant et le prix unitaire';

  @override
  String get howToStep3 =>
      'Ajoutez éventuellement le relevé du compteur pour suivre la consommation';

  @override
  String get howToStep4 =>
      'Consultez votre historique et vos statistiques sur l\'écran principal';

  @override
  String get howToMileageTitle => 'Comment la consommation est calculée';

  @override
  String get howToMileageFormulaTitle => 'Formule de consommation';

  @override
  String get howToMileageFormula =>
      'Consommation = distance parcourue ÷ carburant ajouté';

  @override
  String get howToDistanceFormula =>
      'Distance = compteur actuel - compteur précédent';

  @override
  String get howToExample => 'Exemple de calcul :';

  @override
  String get howToPreviousOdometer => 'Compteur précédent :';

  @override
  String get howToCurrentOdometer => 'Compteur actuel :';

  @override
  String get howToDistanceTraveled => 'Distance parcourue :';

  @override
  String get howToFuelAdded => 'Carburant ajouté :';

  @override
  String get howToMileageResult => 'Consommation :';

  @override
  String get howToKeyFeatures => 'Fonctions principales';

  @override
  String get howToFeatureDashboard => 'Tableau de bord intelligent';

  @override
  String get howToFeatureDashboardBody =>
      'Consultez d\'un coup d\'œil coûts, consommation et efficacité';

  @override
  String get howToFeatureHistory => 'Historique détaillé';

  @override
  String get howToFeatureHistoryBody =>
      'Suivez tous vos pleins avec dates, quantités et coûts';

  @override
  String get howToFeatureEfficiency => 'Suivi de l\'efficacité';

  @override
  String get howToFeatureEfficiencyBody =>
      'Surveillez l\'efficacité de votre véhicule dans le temps';

  @override
  String get howToFeatureData => 'Gestion des données';

  @override
  String get howToFeatureDataBody =>
      'Gérez et effacez facilement vos données au besoin';

  @override
  String get howToTips => 'Conseils pour un meilleur suivi';

  @override
  String get howToTip1 =>
      'Faites toujours le plein complet pour des mesures précises';

  @override
  String get howToTip2 => 'Notez le relevé du compteur à chaque plein';

  @override
  String get howToTip3 => 'Ajoutez vos pleins juste après avoir fait le plein';

  @override
  String get howToTip4 => 'Consultez régulièrement vos tendances d\'efficacité';

  @override
  String get howToTip5 => 'Tirez vers le bas pour actualiser vos données';

  @override
  String get restoreTitle => 'Examiner les conflits';

  @override
  String get restoreConfirm => 'CONFIRMER';

  @override
  String get restoreUseBackupAll => 'Utiliser la sauvegarde partout';

  @override
  String get restoreKeepAllMine => 'Tout conserver';

  @override
  String get restoreMine => 'Le mien';

  @override
  String get restoreBackup => 'Sauvegarde';

  @override
  String get restoreExplainer =>
      'Ces éléments ont changé des deux côtés. Choisissez la version à conserver ; les nouveaux sont ajoutés automatiquement.';

  @override
  String get restoreSectionVehicles => 'Véhicules';

  @override
  String get restoreSectionSettings => 'Paramètres';

  @override
  String get restoreSectionMaintenance => 'Entretien';

  @override
  String get restoreSectionEntries => 'Pleins';

  @override
  String get restoreUnchanged => 'inchangé';

  @override
  String restoreConflictCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count conflits',
      one: '1 conflit',
    );
    return '$_temp0';
  }

  @override
  String restoreNewCount(int count) {
    return '$count nouveaux';
  }

  @override
  String restoreUnchangedCount(int count) {
    return '$count inchangés';
  }
}
