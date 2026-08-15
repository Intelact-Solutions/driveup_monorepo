# DriveUp Mobile

## Overview

**DriveUp Mobile** is the Flutter application for the DriveUp ecosystem. It serves four distinct user types — students, instructors, agents, and driving-school companies — each with its own top-level module and theme.

## Repository location

- Submodule: `driveup-mobile/`
- Remote: `https://github.com/Intelact-Solutions/driveup-mobile.git`
- Default branch: `develop`

## Knowledge base

Deep implementation references live in the `docs/kb/mobile/` folder of this KB:

- [`../mobile/architecture.md`](../mobile/architecture.md) — stack, entry points, feature structure, state management, networking, DI, routing, theming, environments, code generation.
- [`../mobile/code-map.md`](../mobile/code-map.md) — feature-by-feature source map across all role modules.

Gherkin product behavior is mirrored from Zephyr Scale in [`../features/Mobile/`](../features/Mobile/) (692 scenarios across Agent, Authentication, Instructor, and Student areas), generated from [`../source/zephyr_mobile.xml`](../source/zephyr_mobile.xml).

## Stack

- Flutter / Dart
- State management: `flutter_bloc` with Freezed sealed unions
- Networking: Dio + Retrofit (`RestClient`), `safeApiCall()` maps `DioException` to `Failure` variants
- Dependency injection: Injectable + GetIt (`ServiceLocator.resolve<T>()`)
- Routing: AutoRoute (`@RoutePage()`)
- Localization: `lib/l10n/arb/app_*.arb` (EN, DE, FR, IT)

## User roles and layout

- `lib/student/` — driving school students
- `lib/instructor/` — driving instructors
- `lib/agent/` — sales agents
- `lib/company/` — driving school companies
- `lib/shared/` — cross-role code (auth, profile, networking, DI, routing, theme)

## Feature structure (Clean Architecture)

```
features/<feature_name>/
  data/
    data_provider/   # Retrofit API calls + raw models, annotated @lazySingleton
    repository/      # wraps data provider, returns Either<Failure, T>
  logic/             # BLoC/Cubit files (events, states, bloc — all Freezed)
  presentation/      # @RoutePage widgets + sub-widgets
```

## Conventions

- Repositories always return `Either<Failure, T>` (dartz); BLoCs fold the Either into state emissions.
- All endpoint paths are constants in `lib/shared/core/network/endpoints.dart`.
- Routes live in `lib/shared/core/presentation/router/app_router.dart`; after adding/renaming routes re-run `build_runner`.
- Each role module has its own `ThemeData` (e.g. `InstructorTheme`, `StudentTheme`) applied via `ThemeBloc`; design tokens live in `ThemeExtension<AppTheme>`.

## Environments

Three flavors via `.env` files loaded with `flutter_dotenv` (files are not committed; injected from Codemagic secret variable groups in CI):

- `environment/.env.dev` → `lib/main-dev.dart`
- `environment/.env.test` → `lib/main-test.dart`
- `environment/.env.prod` → `lib/main-prod.dart`

## Code generation (never edit manually)

`*.freezed.dart`, `*.g.dart`, `app_router.gr.dart`, `injection.config.dart`, `lib/l10n/arb/app_localizations*.dart`. Regenerate with `dart run build_runner build --delete-conflicting-outputs`.
