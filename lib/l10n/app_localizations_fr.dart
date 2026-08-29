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
  String howToWelcome(String app) {
    return 'Bienvenue dans $app !';
  }

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

  @override
  String get commonRestore => 'Restaurer';

  @override
  String get commonSignIn => 'Se connecter';

  @override
  String get commonDisconnect => 'Déconnecter';

  @override
  String get commonProcessing => 'Traitement...';

  @override
  String get commonNoThanks => 'Non merci';

  @override
  String get commonNotNow => 'Pas maintenant';

  @override
  String get commonMileage => 'Consommation';

  @override
  String get settingsSubtitle => 'Gérez vos préférences et vos données';

  @override
  String get settingsAppearance => 'Apparence';

  @override
  String get settingsPreferences => 'Préférences';

  @override
  String get settingsDataManagement => 'Gestion des données';

  @override
  String get settingsExportImport => 'Export et import';

  @override
  String get settingsAdvanced => 'Avancé';

  @override
  String get settingsAbout => 'À propos';

  @override
  String get settingsAccentColor => 'Couleur d\'accent';

  @override
  String get settingsAccentColorSubtitle =>
      'Personnalisez la couleur de l\'app';

  @override
  String get settingsChooseAccentColor => 'Choisir la couleur d\'accent';

  @override
  String get settingsChooseTheme => 'Choisir le thème';

  @override
  String settingsThemeCurrent(String theme) {
    return 'Actuel : $theme';
  }

  @override
  String settingsCurrencyCurrent(String symbol, String name) {
    return 'Actuelle : $symbol ($name)';
  }

  @override
  String settingsCurrencyChanged(String symbol, String name) {
    return 'Devise changée pour $symbol ($name)';
  }

  @override
  String settingsBudgetLabel(String currency) {
    return 'Budget ($currency)';
  }

  @override
  String get settingsBudgetHint => 'ex. 5000';

  @override
  String get settingsGoogleDriveBackup => 'Sauvegarde Google Drive';

  @override
  String settingsSignedInAs(String email) {
    return 'Connecté en tant que $email';
  }

  @override
  String get settingsSignOutSubtitle =>
      'Se déconnecter de la sauvegarde Google';

  @override
  String get settingsDisconnected => 'Déconnecté de Google Drive';

  @override
  String get settingsBackupNow => 'Sauvegarder maintenant';

  @override
  String get settingsBackupNowSubtitle =>
      'Envoyez vos données vers Google Drive';

  @override
  String get settingsAutoBackup => 'Sauvegarde automatique';

  @override
  String get settingsAutoBackupSubtitle =>
      'Sauvegarder automatiquement après chaque enregistrement';

  @override
  String get settingsAutoBackupOffWarning =>
      'Les sauvegardes existantes seront conservées. Aucune nouvelle sauvegarde ne sera faite.';

  @override
  String get settingsRestoreFromBackup => 'Restaurer depuis la sauvegarde';

  @override
  String get settingsRestoreSubtitle => 'Téléchargez et restaurez vos données';

  @override
  String get settingsRestoreWarning =>
      'Cela remplacera toutes les données actuelles par la sauvegarde. Action irréversible.';

  @override
  String settingsRestoreFailed(String message) {
    return 'Échec de la restauration : $message';
  }

  @override
  String settingsBackupFailed(String message) {
    return 'Échec de la sauvegarde : $message';
  }

  @override
  String get settingsExportData => 'Exporter les données';

  @override
  String get settingsExportToCsv => 'Exporter en CSV';

  @override
  String get settingsExportSubtitle =>
      'Exportez tous les pleins dans un fichier CSV';

  @override
  String get settingsSelectExportVehicle => 'Choisissez le véhicule à exporter';

  @override
  String get settingsAllVehicles => 'Tous les véhicules';

  @override
  String get settingsIncludeAllVehicles =>
      'Inclure les données de tous les véhicules';

  @override
  String get settingsNoVehicle => 'Aucun véhicule';

  @override
  String get settingsNoVehicleSubtitle => 'N\'assigner à aucun véhicule';

  @override
  String get settingsNothingToExport =>
      'Aucune entrée à exporter pour ce véhicule';

  @override
  String settingsEntriesExported(int count) {
    return '$count entrées exportées';
  }

  @override
  String get settingsImportData => 'Importer des données';

  @override
  String get settingsImportFromCsv => 'Importer depuis un CSV';

  @override
  String get settingsImportSubtitle =>
      'Importez des pleins depuis un fichier CSV';

  @override
  String get settingsAssignImported =>
      'Assigner les entrées importées à un véhicule';

  @override
  String get settingsCsvInvalid => 'Le fichier CSV est vide ou invalide';

  @override
  String settingsEntriesImported(int count) {
    return '$count entrées importées';
  }

  @override
  String settingsExportFailed(String message) {
    return 'Erreur d\'export CSV : $message';
  }

  @override
  String settingsImportFailed(String message) {
    return 'Erreur d\'import CSV : $message';
  }

  @override
  String get settingsClearEntries => 'Effacer les pleins';

  @override
  String get settingsClearEntriesAction => 'Effacer les entrées';

  @override
  String get settingsClearEntriesSubtitle => 'Supprime tous les pleins';

  @override
  String get settingsClearEntriesWarning =>
      'Cela supprimera définitivement tous vos pleins.';

  @override
  String get settingsEntriesCleared => 'Pleins effacés avec succès';

  @override
  String get settingsClearOdometer => 'Effacer les données du compteur';

  @override
  String get settingsClearOdometerAction => 'Effacer le compteur';

  @override
  String get settingsClearOdometerSubtitle =>
      'Réinitialise le relevé actuel du compteur';

  @override
  String get settingsClearOdometerWarning =>
      'Cela réinitialisera le relevé de votre compteur.';

  @override
  String get settingsOdometerCleared =>
      'Données du compteur effacées avec succès';

  @override
  String get settingsClearAllData => 'Effacer toutes les données';

  @override
  String get settingsClearAllAction => 'Tout effacer';

  @override
  String get settingsClearAllSubtitle =>
      'Supprime toutes les entrées et le compteur';

  @override
  String get settingsClearAllWarning =>
      'Cela supprimera définitivement TOUTES les données. Action irréversible.';

  @override
  String get settingsAllDataCleared => 'Toutes les données ont été effacées';

  @override
  String get settingsResetApp => 'Réinitialiser l\'app';

  @override
  String get settingsClearAllCache => 'Effacer le cache et les préférences';

  @override
  String get settingsClearCacheAction => 'Tout effacer';

  @override
  String get settingsResetSubtitle => 'Remet l\'app aux réglages d\'usine';

  @override
  String get settingsResetWarning =>
      'Cela réinitialisera complètement l\'app. TOUTES les données seront perdues.';

  @override
  String get settingsCacheCleared => 'Cache et préférences effacés';

  @override
  String settingsClearFailed(String message) {
    return 'Erreur lors de l\'effacement : $message';
  }

  @override
  String get settingsAppVersion => 'Version de l\'app';

  @override
  String get settingsRateApp => 'Noter l\'application';

  @override
  String settingsRateSubtitle(String app) {
    return 'Vous aimez $app ? Laissez un avis';
  }

  @override
  String get settingsReplayTutorialSubtitle =>
      'Revoir l\'introduction et la visite guidée';

  @override
  String get homeYourFuelStats => 'Vos statistiques';

  @override
  String get homeQuickActions => 'Actions rapides';

  @override
  String get homeAddFuelEntry => 'Ajouter un plein';

  @override
  String get homeViewFuelHistory => 'Voir l\'historique';

  @override
  String get homeSwitchVehicles => 'Changer de véhicule';

  @override
  String get homeTripCalculator => 'Calculateur de trajet';

  @override
  String get homeTripCalculatorSubtitle => 'Estimez le coût d\'un trajet';

  @override
  String get homeBudgetReports => 'Budget et rapports';

  @override
  String get homeBudgetReportsSubtitle =>
      'Dépenses mensuelles et suivi du budget';

  @override
  String get homeSpendingComparison => 'Comparaison des dépenses';

  @override
  String get homeSpendingComparisonSubtitle => 'Comparez les mois côte à côte';

  @override
  String get homeCompareVehicles => 'Comparer les véhicules';

  @override
  String get homeCompareVehiclesSubtitle =>
      'Analyse comparative de l\'efficacité';

  @override
  String get homeMaintenanceLog => 'Carnet d\'entretien';

  @override
  String get homeMaintenanceLogSubtitle =>
      'Suivez les entretiens de votre véhicule';

  @override
  String get homeThanksFeedback => 'Merci pour votre retour !';

  @override
  String get addFuelAddVehicle => 'Ajouter un véhicule';

  @override
  String addFuelSaveFailed(String message) {
    return 'Erreur lors de l\'enregistrement : $message';
  }

  @override
  String get addFuelAutoBackupOk => 'Sauvegarde automatique réussie !';

  @override
  String addFuelAutoBackupFailed(String message) {
    return 'Échec de la sauvegarde automatique : $message';
  }

  @override
  String get addFuelBackupOk => 'Sauvegarde réussie !';

  @override
  String get addFuelConnectedBackedUp => 'Connecté et sauvegardé !';

  @override
  String get historyEntryDeleted => 'Entrée supprimée';

  @override
  String get historyTimeUpdated => 'Heure de l\'entrée mise à jour';

  @override
  String historyDeleteFailed(String message) {
    return 'Erreur lors de la suppression : $message';
  }

  @override
  String historyLoadFailed(String message) {
    return 'Erreur de chargement : $message';
  }

  @override
  String historyExportFailed(String message) {
    return 'Erreur d\'export CSV : $message';
  }

  @override
  String get entryCardEdit => 'Modifier';

  @override
  String get entryCardDelete => 'Supprimer';

  @override
  String get entryCardChangeTime => 'Changer l\'heure';

  @override
  String get deleteEntryTitle => 'Supprimer l\'entrée';

  @override
  String rateTitle(String app) {
    return 'Vous aimez $app ?';
  }

  @override
  String get rateNow => 'Noter maintenant';

  @override
  String get rateLater => 'Pas maintenant';

  @override
  String get currencyDialogTitle => 'Sélectionner la devise';

  @override
  String get currencyDialogSearch => 'Rechercher une devise...';

  @override
  String get chartNeedMoreData =>
      'Ajoutez d\'autres pleins pour voir les tendances';

  @override
  String summaryAvgPricePerUnit(String unit) {
    return 'Prix moyen par $unit';
  }

  @override
  String summaryAvgPriceShort(String unit) {
    return 'Prix moy./$unit';
  }

  @override
  String get mileageDistanceTraveled => 'Distance parcourue :';

  @override
  String get mileageFuelEfficiency => 'Efficacité :';

  @override
  String budgetWeekShort(int number) {
    return 'S$number';
  }

  @override
  String get vehiclesNameHint => 'ex. Ma voiture';

  @override
  String get maintenanceCostHint => 'ex. 150';

  @override
  String vehiclesDeleteConfirm(String name) {
    return 'Voulez-vous vraiment supprimer « $name » ? Les pleins ne seront pas supprimés.';
  }

  @override
  String get restoreLabelVehicle => 'Véhicule';

  @override
  String get restoreLabelSetting => 'Paramètre';

  @override
  String get fuelType_petrol => 'Essence';

  @override
  String get fuelType_diesel => 'Diesel';

  @override
  String get fuelType_cng => 'GNV';

  @override
  String get fuelType_electric => 'Électrique';

  @override
  String get fuelType_hybrid => 'Hybride';

  @override
  String get vehicleType_directions_car => 'Voiture';

  @override
  String get vehicleType_two_wheeler => 'Moto';

  @override
  String get vehicleType_local_shipping => 'Camion';

  @override
  String get vehicleType_airport_shuttle => 'Fourgon';

  @override
  String get vehicleType_electric_car => 'Voiture électrique';

  @override
  String get vehicleType_pedal_bike => 'Vélo';

  @override
  String get maintenanceType_oil_change => 'Vidange';

  @override
  String get maintenanceType_tire_rotation => 'Permutation des pneus';

  @override
  String get maintenanceType_brake_service => 'Freins';

  @override
  String get maintenanceType_air_filter => 'Filtre à air';

  @override
  String get maintenanceType_transmission => 'Transmission';

  @override
  String get maintenanceType_battery => 'Batterie';

  @override
  String get maintenanceType_coolant => 'Liquide de refroidissement';

  @override
  String get maintenanceType_spark_plugs => 'Bougies';

  @override
  String get maintenanceType_belt_replacement => 'Remplacement de courroie';

  @override
  String get maintenanceType_wheel_alignment => 'Parallélisme';

  @override
  String get maintenanceType_suspension => 'Suspension';

  @override
  String get maintenanceType_exhaust => 'Échappement';

  @override
  String get maintenanceType_ac_service => 'Climatisation';

  @override
  String get maintenanceType_wiper_blades => 'Essuie-glaces';

  @override
  String get maintenanceType_headlights => 'Phares';

  @override
  String get maintenanceType_car_wash => 'Lavage';

  @override
  String get maintenanceType_detailing => 'Nettoyage complet';

  @override
  String get maintenanceType_inspection => 'Contrôle technique';

  @override
  String get maintenanceType_insurance => 'Assurance';

  @override
  String get maintenanceType_registration => 'Carte grise';

  @override
  String get maintenanceType_towing => 'Remorquage';

  @override
  String get maintenanceType_general_service => 'Révision générale';

  @override
  String get maintenanceType_body_repair => 'Carrosserie';

  @override
  String get maintenanceType_other => 'Autre';

  @override
  String get homeAddFuelSubtitle => 'Enregistrez vos pleins';

  @override
  String get homeViewHistorySubtitle => 'Parcourez vos enregistrements';

  @override
  String settingsEntriesImportedTo(int count, String vehicle) {
    return '$count entrées importées vers $vehicle';
  }

  @override
  String get homeOverallSummary => 'Résumé global';

  @override
  String get homeSummary => 'Résumé';

  @override
  String get homeMonitorEfficiency => 'Surveillez votre efficacité';

  @override
  String get tourVehiclesTitle => 'Changer de véhicule';

  @override
  String get tourVehiclesBody =>
      'Choisissez « Tous » pour des statistiques combinées, ou sélectionnez un véhicule précis. Appuyez sur + à la fin pour en ajouter un.';

  @override
  String get tourSettingsBody =>
      'Personnalisez la devise, le thème et le budget mensuel, et sauvegardez vos données sur Google Drive depuis ici.';

  @override
  String get tourStatsBody =>
      'Voyez d\'un coup d\'œil les dépenses du mois, le coût du dernier plein, les jours écoulés et votre efficacité globale.';

  @override
  String get tourActionsBody =>
      'Accédez à l\'historique, au calculateur de trajet, aux rapports de budget, au carnet d\'entretien et à d\'autres outils.';

  @override
  String get tourAddFuelBody =>
      'Appuyez ici pour enregistrer un plein. Vous saisirez la quantité, le prix et le relevé du compteur.';

  @override
  String get comparisonMetric => 'Indicateur';

  @override
  String get comparisonScroll => 'Faire défiler';

  @override
  String get comparisonSummary => 'Résumé';

  @override
  String get comparisonSelectTwo =>
      'Sélectionnez au moins 2 véhicules à comparer';

  @override
  String get comparisonSubtitle => 'Efficacité comparée';

  @override
  String get historyLoading => 'Chargement des données...';

  @override
  String get historyLoadingHint =>
      'Veuillez patienter pendant la récupération de vos données';

  @override
  String get currencyNoResults => 'Aucune devise trouvée';

  @override
  String get currencyNoResultsHint => 'Essayez d\'autres mots-clés';

  @override
  String get mileageCalculationTitle => 'Calcul de la consommation';

  @override
  String mileageSinceLastFill(String date) {
    return 'Depuis le dernier plein : $date';
  }

  @override
  String get addFuelNoVehicles => 'Aucun véhicule. Ajoutez-en un d\'abord.';

  @override
  String budgetProgressLabel(String amount, String percent) {
    return 'Budget : $amount  |  $percent% utilisé';
  }

  @override
  String get howToAutoCalc =>
      'L\'app calcule automatiquement votre efficacité lorsque vous saisissez les relevés du compteur :';

  @override
  String get deleteEntryMessage =>
      'Voulez-vous vraiment supprimer ce plein ? Cette action est irréversible.';

  @override
  String get chartNotEnoughData => 'Données insuffisantes';

  @override
  String get chartAnalytics => 'Analyses';

  @override
  String entryCardOdometer(String value) {
    return 'Compteur : $value km';
  }

  @override
  String get summaryFillUpTitle => 'Résumé du plein';

  @override
  String get unitLong_L => 'Litres';

  @override
  String get unitWord_L => 'litre';

  @override
  String get unitLong_kg => 'Kilogrammes';

  @override
  String get unitWord_kg => 'kg';

  @override
  String get unitLong_m3 => 'Mètres cubes';

  @override
  String get unitWord_m3 => 'm³';

  @override
  String get unitLong_kWh => 'Kilowattheures';

  @override
  String get unitWord_kWh => 'kWh';

  @override
  String get summaryTotalFuel => 'Carburant total';

  @override
  String summaryTotalOf(String unit) {
    return 'Total $unit';
  }

  @override
  String get chartCostTrend => 'Évolution des coûts';

  @override
  String get chartConsumption => 'Consommation';

  @override
  String get chartEfficiency => 'Efficacité';

  @override
  String get chartTrend => 'Évolution';

  @override
  String chartCostAxis(String currency) {
    return 'Coût ($currency)';
  }

  @override
  String get trendCostsUp => 'Coûts en hausse';

  @override
  String get trendCostsDown => 'Coûts en baisse';

  @override
  String get trendVolumeUp => 'Volume en hausse';

  @override
  String get trendVolumeDown => 'Volume en baisse';

  @override
  String get trendEfficiencyUp => 'Efficacité en amélioration';

  @override
  String get trendEfficiencyDown => 'Efficacité en baisse';

  @override
  String get addFuelSaveButton => 'Enregistrer le plein';

  @override
  String get addFuelUpdateButton => 'Mettre à jour';

  @override
  String get addFuelSubtitle => 'Suivez votre consommation';

  @override
  String get addFuelEditSubtitle => 'Modifiez votre plein';

  @override
  String get addFuelAmountRequired => 'Saisissez la quantité';

  @override
  String get addFuelPriceRequired => 'Saisissez le prix unitaire';

  @override
  String get addFuelPositiveNumber => 'Saisissez un nombre positif valide';

  @override
  String get addFuelCurrentOdometer => 'Relevé actuel du compteur (km)';

  @override
  String get addFuelOdometerOptional => 'Relevé du compteur (km) - facultatif';

  @override
  String addFuelOdometerTooLow(String value) {
    return 'Le relevé ne peut pas être inférieur au dernier ($value km)';
  }

  @override
  String get addFuelBackupTitle => 'Sauvegarder les données';

  @override
  String get addFuelBackupCloudTitle => 'Sauvegarde dans le cloud';

  @override
  String get addFuelBackupPrompt =>
      'Voulez-vous sauvegarder vos données sur Google Drive ?';

  @override
  String get addFuelConnectPrompt =>
      'Connectez votre Gmail pour sauvegarder vos données sur Google Drive.';

  @override
  String get addFuelConnectGmail => 'Connecter Gmail';

  @override
  String get dateToday => 'Aujourd\'hui';

  @override
  String get dateYesterday => 'Hier';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get themeSystem => 'Système';

  @override
  String get commonLoading => 'Chargement...';

  @override
  String get settingsConnected => 'Connecté';

  @override
  String get settingsConnectDrive => 'Connecter Google Drive';

  @override
  String get settingsSignInPrompt =>
      'Connectez-vous pour sauvegarder vos données sur Google Drive';

  @override
  String get exportShareText => 'Export Fuel Cost';

  @override
  String get homeJustStarted => 'Vous débutez';

  @override
  String get homeAlmostThere => 'Presque prêt !';

  @override
  String get homeAddFirstEntryHint =>
      'Ajoutez votre premier plein pour suivre consommation, coûts et tendances.';

  @override
  String homeNoEntriesForVehicle(String vehicle) {
    return 'Aucune entrée pour $vehicle. Ajoutez-en une pour voir ses statistiques.';
  }

  @override
  String homeAddMoreEntries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'entrées',
      one: 'entrée',
    );
    return 'Ajoutez encore $count $_temp0 pour une meilleure vue de votre efficacité, vos coûts et vos tendances.';
  }

  @override
  String homeAddMoreEntriesForVehicle(int count, String vehicle) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'entrées',
      one: 'entrée',
    );
    return 'Ajoutez encore $count $_temp0 pour $vehicle afin d\'obtenir consommation et graphiques précis.';
  }

  @override
  String get homeThisVehicle => 'ce véhicule';

  @override
  String get spendingPeriodA => 'Période A';

  @override
  String get spendingPeriodB => 'Période B';

  @override
  String get spendingPeriodC => 'Période C';

  @override
  String get spendingPeriodD => 'Période D';

  @override
  String comparisonFuelOnly(String amount) {
    return '(carburant $amount)';
  }

  @override
  String get restoreNoDescription => 'aucune description';

  @override
  String get restoreNoNotes => 'aucune note';

  @override
  String get restoreNotesChanged => 'notes modifiées';

  @override
  String get restoreNoOdometer => 'aucun compteur';

  @override
  String restoreOdometerValue(String value) {
    return 'compteur $value';
  }

  @override
  String get restoreNoTankSize => 'sans capacité';

  @override
  String get restoreNoNextDueDate => 'sans prochaine échéance';

  @override
  String restoreNextDueDate(String date) {
    return 'échéance $date';
  }

  @override
  String get restoreNoNextDueOdometer => 'sans prochain relevé';

  @override
  String restoreNextDueOdometer(String value) {
    return 'échéance à $value';
  }

  @override
  String get homeNoEntriesYet => 'Aucune entrée';
}
