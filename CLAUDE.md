# Fuel Cost - Project Guide

## Overview

**Fuel Cost** is a Flutter mobile app for tracking fuel consumption, costs, and vehicle maintenance. Users log fuel fill-ups with odometer readings, and the app calculates mileage (km/L), tracks spending over time, and provides budgeting/comparison tools.

- **Package**: `com.blackshadowsoftwareltd.fuel_cost`
- **Version**: 1.1.0+6
- **Languages**: 7 — English, Bangla, Spanish, French, Portuguese, Arabic, Persian (`lib/l10n/*.arb`, `flutter gen-l10n`). Arabic and Persian are RTL
- **Min SDK**: Dart ^3.8.1
- **Platforms**: Android, iOS (portrait-only)
- **Repo extras**: `assets/` (registered in pubspec — `img.png`, `fuel_entries_fixed.csv` sample), `privacy_policy.html` at the repo root (published policy for the store listing)

## Architecture

### State Management

- **Riverpod** with mixed approach:
  - `fuel_entries_provider.dart`, `summary_providers.dart` use `@riverpod` annotations (code-gen, `.g.dart` files)
  - `theme_provider.dart`, `vehicle_provider.dart`, `maintenance_provider.dart` use plain Riverpod (no code-gen)
- **Important**: Running `build_runner` regenerates `.g.dart` files. The Isar `.g.dart` was pre-generated; there is no `isar_generator` in dev_dependencies.

### Database & Storage

- **Isar Community 3.3.0** (NoSQL embedded DB) for `FuelEntry` — the only Isar collection
- **SharedPreferences** for everything else:
  - Vehicles list, selected vehicle, entry-vehicle mapping
  - Maintenance entries (backed up)
  - Theme mode, accent color
  - Currency selection
  - Monthly budget
  - Google Drive backup metadata
  - Tutorial flags (`onboarding_completed`, `tour_completed`)
  - Language (`app_language`)
  - Per-entry fuel units (`entry_unit_map`)

### Navigation

- `MaterialPageRoute` push/pop — no named routes, no router package

### Theming

- Material Design 3 with `ColorScheme.fromSeed()`
- Custom `ThemeService` builds light/dark themes with configurable accent color
- 10 preset accent colors, persisted in SharedPreferences

## Project Structure

```text
lib/
  main.dart                          # App entry, ProviderScope + MaterialApp (home: SplashScreen)
  business_logic/
    fuel_calculations.dart           # Mileage metrics, efficiency chart data, total distance, per-unit quantity totals
    fuel_unit_resolver.dart          # Resolves each entry's fuel unit (snapshot -> vehicle -> liter)
    entry_filter.dart                # Pure vehicle/date/search filter for fuel history + date presets
    type_labels.dart                 # Localized display labels for stored ids (fuel types, vehicle types, service types)
  models/
    fuel_entry.dart + .g.dart        # Isar @collection (id, liters, pricePerLiter, totalCost, dateTime, odometerReading)
    vehicle.dart                     # Plain Dart class (id, name, iconName, fuelType, tankCapacity, unitId)
    fuel_unit.dart                   # FuelUnit enum (L/kg/m³/kWh) + all unit-dependent labels
    maintenance_entry.dart           # Plain Dart class (id, vehicleId, type, description, cost, mileage, etc.)
  providers/
    fuel_entries_provider.dart + .g.dart   # @riverpod FuelEntries (AsyncNotifier)
    summary_providers.dart + .g.dart      # @riverpod totalCost, totalLiters, averageMileage, currency, etc.
    theme_provider.dart                   # Plain StateNotifier<ThemeState>
    language_provider.dart                # Plain StateNotifier<Locale?> (null = device locale)
    vehicle_provider.dart                 # Plain FutureProvider/StateProvider for vehicles
    maintenance_provider.dart             # Plain FutureProvider for maintenance
  services/
    database_service.dart            # Singleton Isar instance with Completer guard
    fuel_storage_service.dart        # CRUD, mileage calc, CSV import/export
    vehicle_service.dart             # Vehicle CRUD + entry-vehicle mapping via SharedPreferences
    maintenance_service.dart         # Maintenance CRUD via SharedPreferences
    budget_service.dart              # Monthly budget + spending calculations
    theme_service.dart               # Theme mode + accent color persistence
    currency_service.dart            # 160+ currency symbols, persistence
    drive_backup_service.dart        # Google Sign-In + Google Drive appDataFolder backup/restore
    backup_data_service.dart         # Backup payload format (v2 JSON) + merge-on-restore logic
    app_update_service.dart          # Google Play in-app update check (Android-only, via in_app_update)
    tutorial_service.dart            # Onboarding + showcase tour completion flags; resetAll() for "Replay Tutorial"
    language_service.dart            # Language choice (app_language; null = follow device)
    review_service.dart              # Store-rating eligibility (5 entries on one vehicle) + snooze/give-up state
    fuel_unit_service.dart           # Per-entry unit snapshots (entry_unit_map)
  screens/
    splash_screen.dart               # Animated splash: layered particles, gauge logo, letter reveal, road dashes (~3.6s)
    onboarding_screen.dart           # 5-page intro carousel shown once on first launch, then pushes HomeScreen
    restore_conflicts_screen.dart    # Side-by-side review of backup-vs-local conflicts before a restore writes
    home_screen.dart                 # Dashboard: quick stats, fuel chart, action buttons grid
    add_fuel_screen.dart             # Add/edit fuel entry with vehicle selector + mileage preview
    fuel_history_screen.dart         # Fuel entry list filterable by vehicle, date range and search
    settings_screen.dart             # Currency, theme, budget, backup, CSV, data management
    trip_calculator_screen.dart      # Estimate trip fuel cost based on distance + avg mileage
    budget_report_screen.dart        # Monthly spending vs budget with FL Chart bar graphs
    spending_comparison_screen.dart  # Side-by-side 4-month spending comparison
    vehicle_comparison_screen.dart   # Per-vehicle cost, mileage, distance stats
    vehicle_management_screen.dart   # Add/edit/delete vehicles
    maintenance_log_screen.dart      # Add/view maintenance entries per vehicle
    how_to_use_screen.dart           # In-app usage guide
  widgets/
    widgets.dart                     # Barrel export for all widgets
    stat_card.dart                   # Stat display card (home)
    action_button.dart               # Grid action button (home)
    glass_text_field.dart            # Glassmorphism text input (add fuel)
    fuel_calculation_row.dart        # Key-value display row
    fuel_summary_card.dart           # Cost/mileage preview (add fuel)
    mileage_calculation_card.dart    # Detailed mileage breakdown
    fuel_entry_card.dart             # Swipeable entry card (history)
    fuel_summary_stats.dart          # Summary stats widget
    fuel_chart.dart                  # FL Chart line/bar chart
    fuel_chart_dashboard.dart        # Chart container with controls
    empty_state_widget.dart          # Empty state placeholder
    delete_confirmation_dialog.dart  # Delete confirm dialog
    confirmation_dialog.dart         # Generic confirm dialog
    currency_selection_dialog.dart   # Currency picker
    rate_app_dialog.dart             # "Enjoying Fuel Cost?" gate before the store review sheet
    cupertino_section.dart           # iOS-style section (settings)
    cupertino_list_tile.dart         # iOS-style list tile (settings)
    staggered_animation_wrapper.dart # Staggered entrance animation
```

## Key Design Decisions

### Vehicle-Entry Mapping

Vehicle-to-fuel-entry mapping is stored in SharedPreferences as a JSON map (`entryId -> vehicleId`), NOT in the Isar schema. This avoids needing to regenerate the Isar `.g.dart` file.

### Backup Payload Versions

`BackupDataService` owns the Drive payload. **v4** (`fuel_cost_backup.json`) carries `fuelEntries`, `vehicles`, `entryVehicleMap`, `entryUnitMap`, `selectedVehicleId`, `maintenanceEntries`, and `settings`. Earlier versions are the same minus the later keys (v3 had no maintenance/settings, v2 no `entryUnitMap`) and restore fine — an absent key means "no data", never "cleared". **v1** (`fuel_cost_backup.csv`) was fuel entries only — still read on restore, never written.

- The v2 Drive file id is stored under `drive_backup_json_file_id`, a *different* key from v1's `drive_backup_file_id`; sharing the key would make `files.update` write JSON into the user's `.csv` file
- The backup's `selectedVehicleId` is applied only when the device has no selection
- Serialization reuses `FuelEntry.toJson()/fromJson()` and `Vehicle.toJson()/fromJson()` — no duplicate mappers

### Restore: analyze → resolve → apply

Restore never writes straight from the backup. `DriveBackupService.fetchRestorePreview()` downloads and calls `BackupDataService.analyzeJson` (or `analyzeLegacyCsv`), producing a `RestorePreview`; the UI resolves conflicts; `applyRestore()` writes. Abandoning the review leaves local data byte-identical.

- A record is a **conflict** only when the same id exists on both sides *with different values*. Identical records are skipped silently; backup-only records are added without asking; local-only records are never touched
- Entry equality includes **the mapped vehicle id and the unit**, so an entry reassigned to another vehicle — or recorded in a different unit — conflicts even when its numbers match. A backup with no mapping/unit map (v1 CSV, v2 JSON) inherits the local values rather than reporting a false change
- `BackupDataService.diff()` is the pure comparison, deliberately free of storage calls so the rules are unit-testable without Isar (`test/restore_conflict_test.dart`)
- "Keep mine" on an entry also keeps its vehicle assignment — `applyRestore` strips those ids from the incoming `entryVehicleMap` before merging
- CSV export appends a `unit` column last, so parsers reading fixed indices 0-5 (including `parseLegacyCsv`) still read new files
- **Settings** (`selected_currency`, `monthly_fuel_budget`, `theme_mode`, `accent_color`) have no id to merge on, so the rule is: backup value + device never set it → applied silently; same value → nothing; different value → **conflict, user picks**; absent from backup → nothing. Distinguishing "never set" from "set to the default" needs the raw getters (`CurrencyService.getSelectedCurrencyOrNull`, `ThemeService.getThemeModeRaw` / `getAccentColorValue`) — the normal getters return a default and would make every fresh device look like it had chosen `$`/light
- Restored settings must be pushed into the UI: `ref.invalidate(currencyNotifierProvider)` plus `themeProvider.notifier.reload()`, or a restored theme/currency stays invisible until relaunch
- **Never backed up**: `onboarding_completed` and `tour_completed` (device-local UX state), and `drive_backup_json_file_id` / `last_drive_backup_time` / `auto_backup_enabled` — restoring a Drive file id onto a second device would aim its backups at the first device's file
- `RestoreConflictsScreen` pops a `ConflictResolution` (two sets of keep-local ids) or `null` to abort. It only appears when `preview.hasConflicts`, so a clean restore stays one tap

### Fuel Units

`FuelEntry.liters` stores a **quantity in whatever unit the entry was logged in** — the field name is historical. The unit cannot live on the entry: `FuelEntry` is an Isar `@collection` with a pre-generated `.g.dart`, so it lives in SharedPreferences alongside the vehicle mapping.

Resolution order (`FuelUnitResolver`):

1. `entry_unit_map[entryId]` — snapshot written when the entry was saved
2. else the mapped vehicle's `fuelUnit`
3. else `FuelUnit.liter`

- **Snapshot, not live lookup.** CNG conversions are common; deriving the unit from the vehicle would relabel a converted car's entire petrol history. The snapshot keeps it truthful
- A vehicle's unit defaults from `fuelType` but `Vehicle.unitId` can override it — CNG is sold by kg in India/Pakistan and m³ in Bangladesh. `FuelUnit.optionsFor` drives the selector
- **Hybrids choose per entry** (Petrol or Charge) in AddFuel, since one vehicle uses two units
- The arithmetic is unit-agnostic — every efficiency figure is `distance / quantity` — so only labels and aggregation are unit-dependent
- **Never sum across units.** Cost and distance always aggregate; quantity must go through `FuelCalculations.quantityByUnit`, and efficiency is only meaningful within one unit. Home splits the quantity tile when `hasMixedUnits`; Vehicle Comparison labels each bar with its own unit and warns that bars aren't comparable
- Backward compatible with no migration: pre-units entries have no snapshot and resolve to liters, exactly as before

### Localization

ARB files in `lib/l10n/` (`app_en.arb` is the template, `app_bn.arb` is Bangla); `l10n.yaml` drives `flutter gen-l10n`, which generates `lib/l10n/app_localizations*.dart` at build time.

- **`flutter gen-l10n` is unrelated to `build_runner`** — it never touches the Riverpod or Isar `.g.dart` files, so the standing regeneration warning does not apply
- **Numbers and every input field stay Latin digits.** `intl` renders native digits for `bn` (০১২৩), `ar` (٠١٢٣) and `fa` (۰۱۲۳); AddFuel, the budget dialog and tank capacity all parse with `double.parse`, which throws on those. Translate text, localize dates, leave numeric formatting alone
- `DateFormat` must be given `Localizations.localeOf(context).toLanguageTag()` or a Bangla UI shows English month names
- Language is stored in `app_language` (null = follow device) and is carried in the backup `settings` map like currency and theme
- **The app name is never translated.** `appTitle` is `Fuel Cost` in every ARB; strings that mention it (`howToWelcome`, `rateTitle`, `settingsRateSubtitle`) take an `{app}` placeholder so the prose stays translated while the brand is injected verbatim. Pinned by a test
- Adding a locale means: a new ARB, a code in `LanguageService.supportedCodes`, and a `languageNames` entry (an endonym — the language in its own script). Add to `rtlCodes` if right-to-left
- **RTL**: Flutter flips `Directionality` from the locale, but raw `EdgeInsets.only(left:)` / `Alignment.centerLeft` / `TextAlign.left` do **not** mirror — always use `EdgeInsetsDirectional.only(start:)`, `AlignmentDirectional.*Start`, `TextAlign.start`. The splash custom painters draw in raw coordinates and are deliberately left unmirrored (decorative and near-symmetric)
- **Arabic plurals need all six ICU categories** (`zero`, `one`, `two`, `few`, `many`, `other`); two would render counts wrongly. `test/localization_test.dart` enforces this, plus key parity and placeholder parity across all 7 languages
- Native-speaker review is still advisable before release — the non-English strings were not written by native speakers
- **`test/no_hardcoded_strings_test.dart` is the completeness guard.** Localizing by hand-listing substitutions has no completeness check, which is how ~190 strings were once missed while the screens still *imported* `AppLocalizations`. The test scans `lib/` for user-facing literals and fails on any that isn't localized; a second case proves the detector actually fires
- **Stored-id display labels** go through `business_logic/type_labels.dart` (`fuelTypeLabel`, `vehicleTypeLabel`, `maintenanceTypeLabel`). The ids in `Vehicle.fuelTypes`, `Vehicle.vehicleIcons` and `MaintenanceEntry.maintenanceTypes` are persisted in SharedPreferences and the backup payload — **localize the display, never the id**
- Localized strings are not compile-time constants: `const Row(... Text(l10n.x))` will not compile. Drop the `const`
- Untranslated keys fall back to English, so partial translation is safe — screens outside Phase 1 are still English

### Running Cost vs Fuel Cost

`FuelCalculations.runningCostPerKm` folds maintenance into cost per km, and Vehicle Comparison uses it (`(fuel + maintenance) / distance`), keeping `fuelCostPerKm` alongside so the split stays explainable.

- **Only Vehicle Comparison is all-in.** Home, Budget Report and Spending Comparison stay fuel-only on purpose — the stored key is `monthly_fuel_budget`, so folding servicing in would silently redefine every existing user's budget and shift their historical charts
- Maintenance with `vehicleId == null` belongs to no vehicle and is excluded from per-vehicle stats
- `totalDistance` comes from fuel-entry odometers, so a vehicle with heavy servicing and few fill-ups shows an inflated cost/km — the per-row fuel/service split is what makes that visible

### History Filtering

`filterEntries` in `business_logic/entry_filter.dart` is pure (vehicle → date range → search) so the rules are unit-testable without pumping widgets; the screen's `_applyFilter()` just delegates.

- Date ranges are **inclusive at both ends**, compared date-only — the picker returns a midnight end date, and raw timestamp comparison would drop entries logged later that day
- Search is **not free text**: `FuelEntry` has no notes field (frozen Isar schema), so it matches cost, quantity, price, odometer, formatted date and vehicle name. The hint text says so
- The empty state distinguishes "no entries match your filters" from "no fuel entries yet"

### Mileage Calculation Logic

- Fuel at entry `i` is considered consumed between entry `i` and entry `i+1`
- Per-trip mileage: `(odometer[i+1] - odometer[i]) / liters[i]`
- Overall mileage: `totalDistance / (totalFuel - lastEntryFuel)` (last entry's fuel hasn't been consumed yet)
- Located in `lib/business_logic/fuel_calculations.dart`

### Rating Prompt Eligibility

`ReviewService.meetsEntryThreshold()` is a pure predicate — no storage calls — so the counting rules are unit-testable without Isar (`test/review_eligibility_test.dart`), the same split as `BackupDataService.diff()`.

- The threshold is **per vehicle**: 5 entries spread over 5 vehicles is not a habit, 5 on one is
- Mappings are filtered against **live Isar entry ids and existing vehicle ids** before counting, because `entry_vehicle_map` is not self-cleaning. `clearFuelEntries()`/`clearAllData()` wipe Isar but leave the map fully populated, and `deleteVehicle()` leaves its entries mapped — counting the raw map would make a user who just erased everything look eligible. (`deleteFuelEntry()` *does* clean up, via `removeEntryMapping`)
- Neither store reports back whether a review was actually left, so `review_prompt_done` only means "we ran the flow for this user"
- `HomeScreen._maybeAskForReview()` bails when the showcase tour is unfinished — both run from the same `addPostFrameCallback`, and a dialog on top of a spotlight overlay traps the user

### No build_runner for Isar

The `fuel_entry.g.dart` was pre-generated. Do NOT add `isar_generator` to dev_dependencies — it conflicts with other analyzer versions. If you modify the `FuelEntry` model, you must manually update the `.g.dart` or temporarily add the generator.

### Provider Code Generation

Only `fuel_entries_provider` and `summary_providers` use `@riverpod` code-gen. All newer providers (vehicle, theme, maintenance) use plain Riverpod to avoid the build_runner dependency chain.

## Features

1. **Fuel Tracking** - CRUD fuel entries with liters, price, odometer, vehicle assignment
2. **Mileage Calculation** - Automatic efficiency from odometer readings, in the vehicle's own unit (km/L, km/kg, km/m³, km/kWh)
3. **Multiple Vehicles** - Add vehicles with type/icon/fuel type/unit/tank capacity; filter entries by vehicle
4. **Trip Cost Calculator** - Estimate fuel cost for a planned trip
5. **Budget & Reports** - Set monthly budget, view spending bar charts (FL Chart)
6. **Spending Comparison** - Compare 4 months side-by-side
7. **Vehicle Comparison** - Per-vehicle stats (fuel cost, maintenance cost, mileage, distance, **all-in cost/km**)
8. **Maintenance Log** - Track 24 maintenance types with cost, mileage, next-due dates
9. **Google Drive Backup** - Sign in with Google; backs up fuel entries, vehicles, entry-vehicle mapping, per-entry units, the maintenance log, and app settings (currency, budget, theme, accent) as JSON to Drive appDataFolder. Restore merges by id, **prompting the user to resolve every record that differs on both sides**, and still reads v1 CSV backups
10. **CSV Import/Export** - Share or import fuel data as CSV; History exports exactly the filtered view. All exports go through `FuelStorageService.buildCsv` — never build CSV inline, that is how the `unit` column went missing once
11. **Theme Customization** - Light/dark/system mode + 10 accent colors
12. **Currency Support** - 160+ world currencies
13. **How-to Guide** - In-app tutorial screen
14. **In-App Update** - Google Play in-app update prompts (Android-only); priority >= 4 forces immediate update, otherwise flexible background update
15. **Animated Splash Screen** - Custom-painted splash with floating particles, dual rotating dashed rings, liquid-fill gauge logo, letter-by-letter title reveal, shimmer tagline, and animated road dashes
16. **Onboarding Carousel** - 5-page swipeable intro (tracking, multi-vehicle, mileage, budget, cloud backup) shown once on first launch; completion persisted by `TutorialService`
17. **Interactive Tour** - `showcaseview` spotlights on the home screen (vehicle selector → settings → stats card → actions grid → add-fuel FAB), auto-started for first-time users and replayable from Settings → Replay Tutorial
18. **Rating Prompt** - Asks for a store rating once a *single* vehicle has 5+ fuel entries. A custom gate dialog comes first; only users who say yes reach the native review sheet. "Not now" snoozes 30 days, and the app stops asking after 3 tries. Always available from Settings → About → Rate this App

## Dependencies (Key)

| Package | Purpose |
| --- | --- |
| `flutter_riverpod` + `riverpod_annotation` | State management |
| `isar_community` + `isar_community_flutter_libs` | Local NoSQL database |
| `shared_preferences` | Key-value storage |
| `fl_chart` | Charts (bar, line) |
| `google_sign_in` + `googleapis` + `extension_google_sign_in_as_googleapis_auth` | Google Drive backup |
| `share_plus` | Share/export files |
| `file_picker` | Import CSV |
| `google_fonts` | Typography |
| `intl` | Date formatting |
| `uuid` | Unique ID generation |
| `path_provider` | App directory paths |
| `in_app_update` | Google Play in-app update API (Android-only) |
| `in_app_review` | Play/App Store native review sheet (transitively pulls in `url_launcher`) |
| `showcaseview` | Guided tour spotlight overlays (home screen) |
| `package_info_plus` | Runtime app version/build number (Settings) |

## Build & Run

```bash
# Install dependencies
flutter pub get

# Run on connected device/emulator
flutter run

# Build APK
flutter build apk

# Regenerate Riverpod providers (NOT Isar)
dart run build_runner build --delete-conflicting-outputs
```

## Common Patterns

- **Dark mode check**: `Theme.of(context).brightness == Brightness.dark`
- **Currency loading**: Each screen loads currency from `CurrencyService.getSelectedCurrency()` in `initState`
- **Animation**: Most screens use `AnimationController` + staggered entrance animations
- **Vehicle icon resolution**: Repeated `_vehicleIconMap` const in multiple files mapping string keys to `Icons.*`
- **Error handling**: SnackBars with colored backgrounds (green=success, red=error)
- **Gradient theme**: Purple-blue gradient (`#667eea`, `#764ba2`, `#2196F3`) used in AddFuel, VehicleManagement, and History AppBar
- **In-app update**: `AppUpdateService.checkForUpdate(context)` called once via `addPostFrameCallback` in HomeScreen's `initState`; only runs on Android, silently skips on iOS
- **Tutorial flow**: `ShowcaseView.register()` in HomeScreen's `initState` and `unregister()` in `dispose` — required by showcaseview v5+, which uses a global instance rather than an inherited widget. `_maybeStartTour()` builds the key list dynamically and **omits the stats-card key when the user has no vehicles**: that card isn't built for a first-time user, and an unmounted key freezes the tour on that step. Settings → Replay Tutorial calls `TutorialService.resetAll()`
- **Splash screen flow**: `main.dart` → `SplashScreen` → (3.6s master animation + 400ms hold) → `Navigator.pushReplacement` with fade+scale transition to `OnboardingScreen` on first launch, or `HomeScreen` once `TutorialService.isOnboardingCompleted()` is true. Splash uses 5 separate `AnimationController`s (master timeline + 4 continuous loops for ring/pulse/particles/road/shimmer) and 4 custom painters (`_ParticlePainter`, `_DashedRingPainter`, `_GaugeArcPainter`, `_RoadPainter`)

## Warnings

- Do NOT modify `fuel_entry.g.dart` manually — it's Isar-generated code
- `FuelEntry.liters` / `pricePerLiter` hold a quantity and price in the entry's **resolved unit**, not necessarily liters — never label them `L` directly, resolve via `FuelUnitResolver`
- Do NOT add `isar_generator` to dev_dependencies (analyzer conflicts)
- The `clearAllSharedPreferences()` in `FuelStorageService` actually clears Isar, not SharedPreferences (naming is misleading)
- Vehicle icon map (`_vehicleIconMap`) is duplicated across 4+ files — when adding new vehicle types, update all instances
- The home screen and trip calculator screens use full-screen `Container`s for background gradients — must set `width: double.infinity, height: double.infinity` (home) or wrap content in a `ConstrainedBox` with `minHeight: screenHeight - safeAreaInsets` (trip calculator) so the gradient covers the full screen even when content is short
- The splash version label reads `PackageInfo.fromPlatform()` (same pattern as `settings_screen.dart`) and renders empty until it loads — it needs no manual bump on release. Do not reintroduce a hardcoded version string there
