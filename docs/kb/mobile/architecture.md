# DriveUp Mobile Architecture

## Purpose

DriveUp Mobile is the Flutter client for the DriveUp ecosystem. It serves four distinct user types — students, instructors, sales agents, and driving-school companies — each with its own top-level module and theme. This document describes the implemented Flutter application (its layout, stack, and conventions), not product requirements. For the surrounding ecosystem context, see `projects/mobile.md`; for a code-level tour of every feature, see `code-map.md` in this folder.

## Tech stack

| Concern                | Choice                                                                                                   |
| ---------------------- | -------------------------------------------------------------------------------------------------------- |
| Language / SDK         | Dart (>=3.9.0), Flutter                                                     |
| State management       | `flutter_bloc` ^9 with Freezed sealed unions (`logic/`)                                                    |
| Networking             | Dio ^5 + Retrofit ^4 (`RestClient`), `safeApiCall()` maps exceptions to `Failure` variants                 |
| Dependency injection   | Injectable + GetIt, `@InjectableInit` bootstrap, `ServiceLocator.resolve<T>()`                             |
| Routing                | AutoRoute ^11, `@RoutePage()` widgets, `app_router.gr.dart` generated registry                             |
| Serialization          | Freezed + json_serializable (`*.freezed.dart`, `*.g.dart`)                                                |
| Localization           | Flutter gen-l10n over `lib/l10n/arb/app_*.arb` (EN, DE, FR, IT)                                           |
| Persistence            | `shared_preferences` behind `CacheManager` (token, locale, country, FCM token)                            |
| Notifications          | `firebase_messaging` + `flutter_downloader`; live handover data via `cloud_firestore`                     |
| Charts / calendar      | `fl_chart`, `syncfusion_flutter_calendar`/`_datepicker`/`_sliders`/`_signaturepad`, `percent_indicator`    |
| Code generation        | `build_runner` (Freezed, Retrofit, Injectable, AutoRoute)                                                 |

Source: `driveup-mobile/pubspec.yaml:30-101`.

## Application entry points

Each flavor has its own `main-*.dart` that bootstraps the environment, dependency graph, and widget tree. The `MyApp` widget is duplicated per entry file (small divergence today, e.g. `ProfileBloc` listener wiring differs between dev and test).

| Flavor | Entry point                   | Env file                 | Firebase options                             |
| ------ | ----------------------------- | ------------------------ | -------------------------------------------- |
| Dev    | `lib/main-dev.dart`           | `environment/.env.dev`   | `lib/firebase_options_dev.dart`              |
| Test   | `lib/main-test.dart`          | `environment/.env.test`  | `lib/firebase_options_staging.dart`          |
| Prod   | `lib/main-prod.dart`          | `environment/.env.prod`  | `lib/firebase_options_prod.dart`             |

Startup order (`main-dev.dart:29-60`, `main-test.dart:29-41`):

1. `WidgetsFlutterBinding.ensureInitialized()`.
2. `dotenv.load(fileName: 'environment/.env.<flavor>')` — the `baseUrl` is read here by `DioClientServiceConfig` (`dio_client_service_config.dart:22-24`).
3. `configureDependencies()` — GetIt initialization from `injection.config.dart`.
4. `Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)`.
5. `FlutterDownloader.initialize(...)`.
6. `runApp(MyApp())`.

`MyApp` (`main-test.dart:43-127`, mirrored in `main-dev.dart`):

- `MultiBlocProvider` registers the global blocs: `NotificationsBloc`, `ThemeBloc`, `DismissAlertBloc`, `LocaleBloc`, `InstructorTrainingsBloc`, `InvitationBloc`, `AddPaymentBloc`, `AddExpenseBloc`, `StudentTrainingsBloc`, `ProfileBloc`, `CountriesBloc` (started eagerly), `AddCalendarItemBloc`, `CalendarControllerCubit`.
- A `BlocListener<ProfileBloc, ProfileState>` syncs the active `Locale` from the loaded profile's `language`.
- `MaterialApp.router` uses `AppRouter.config(navigatorObservers: [AutoRouteObserver(), KeyboardDismissObserver()])`, the active role `ThemeData` from `ThemeBloc`, and `AppLocalizations` delegates for EN/DE/FR/IT.

## Source layout

| Directory                       | Responsibility                                                                                             |
| ------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `lib/shared/core/`              | Cross-cutting infrastructure: networking, DI, routing, theme, storage, models, code generation.            |
| `lib/shared/features/`          | Cross-role user features: splash/auth, profile (image/name/company name), notifications, alerts, settings. |
| `lib/student/`                  | Student module: home, driving-training layout, course-training layout, onboarding, profile settings.       |
| `lib/instructor/`               | Instructor module: layout, home, calendar, training list/details, workdays, expenses, handover, payments.  |
| `lib/agent/`                    | Agent module: home, clients, earnings, assets, onboarding, profile settings.                               |
| `lib/company/`                  | Company module: onboarding and company categories (driving categories).                                    |
| `lib/l10n/`                     | ARB sources (`app_en/de/fr/it.arb`) plus generated `app_localizations*.dart`.                              |
| `lib/firebase_options_*.dart`   | Per-flavor Firebase configuration.                                                                         |

## Feature structure (Clean Architecture)

Every feature in every role module follows a three-layer pattern. Data provider classes are `@lazySingleton`; repositories wrap them and return `Either<Failure, T>`.

```
features/<feature_name>/
  data/
    data_models/       # Freezed models with fromJson (shared/core for cross-role)
    data_provider/     # Retrofit API calls + raw models, annotated @lazySingleton
    repository/        # wraps data provider, returns Either<Failure, T>
  logic/               # BLoC/Cubit files (events, states, bloc — all Freezed)
  presentation/        # @RoutePage widgets + sub-widgets
```

Naming: `*_data_provider.dart`, `*_repository.dart`, `*_bloc.dart`, `*_event.dart`, `*_state.dart`. Generated parts (`*.freezed.dart`, `*.g.dart`) are never edited manually.

## State management

- All state is `flutter_bloc`; events and states are sealed Freezed unions (`*_event.dart` / `*_state.dart`) with `_Loaded`/`_FutureLoaded`-style event casing and `initial`/`loadSuccess`/`loadFailure` state constructors.
- BLoCs fold the repository's `Either<Failure, T>` directly into emissions, e.g. `InstructorCalenderBloc` (`instructor/features/calendar/logic/load/instructor_calender_bloc.dart:24-62`).
- Pagination uses `Future` chaining, e.g. calendar "load more" appends 29–30 days per request (`instructor_calender_bloc.dart:63-80`).
- Cross-cutting global blocs (theme, locale, notifications, profile, countries) are registered at the app root; feature blocs are provided via `MultiBlocProvider` in each layout/feature page.

## Networking

- `RestClient` (`lib/shared/core/network/dio_client/dio_client_service.dart`) is a single Retrofit-annotated abstract class covering every endpoint. All endpoint paths are string constants in `lib/shared/core/network/endpoints.dart`.
- `DioClientServiceConfig` builds the Dio instance: `baseUrl` from the loaded `.env`, 20s connect/receive and 60s send timeouts, `PrettyDioLogger`, and an interceptor that injects the `Bearer` token from `CacheManager` on every request (`dio_client_service_config.dart:22-51`).
- `safeApiCall<T>()` (`lib/shared/core/network/api_caller.dart:8-24`) wraps any Retrofit call in try/catch; `mapHttpExceptionToFailure()` (`:26-52`) maps `DioException` types: 403 → `accountBlocked`, 404 → `notFound`, 401 → `unauthenticated`, other 4xx with `message` → `serverMessage(statusCode, message)`, connection/timeout → `network`, cancelled → `operationCanceled`, else `unknown`.
- `Failure` is a sealed Freezed union (`lib/shared/core/models/failure.dart`) with variants `network`, `operationCanceled`, `accountBlocked`, `unauthenticated`, `notFound`, `unknown`, `serverMessage(statusCode, message)`, `serverInternal`. `getFailureMessage(context)` maps each to a localized string.
- Repositories return `Either<Failure, T>` (dartz `Either`); data providers return `Either<Failure, BasicResponseModel<T>>` where the backend wraps payloads in a generic `data`/`message` envelope (`lib/shared/core/models/basic_response.dart`).
- Pagination responses use `PaginationModel<T>` (`lib/shared/core/models/pagination.dart`): `totalPages`, `currentPage`, `hasNext`, `data`.

## Dependency injection

- `configureDependencies()` in `lib/shared/core/di/injection.dart` bootstraps GetIt via `@InjectableInit` (`injection.config.dart` is generated).
- `ServiceLocator.resolve<T>()` (`lib/shared/core/di/service_locator.dart`) supports optional `instanceName` and `param`.
- `lib/shared/core/di/injectable_modules.dart` pre-resolves `SharedPreferences` and builds the single `RestClient` from `DioClientService.client`.
- Storage is `SharedPreferencesCache`, annotated `@LazySingleton(as: CacheManager)` (`lib/shared/core/storage/shared_prefrences_cache.dart`); `clearAll()` preserves the locale and country keys. Keys are defined in `cache_manager.dart` (`tokenKey='TOKEN'`, `languageKey='LANGUAGE'`, `countryKey='COUNTRY'`, `fcmToken`).

## Routing

- Routes are declared in `lib/shared/core/presentation/router/app_router.dart` under `@AutoRouterConfig(replaceInRouteName: 'Page,Route')`. The initial route is `/splash` (`:9`).
- Page widgets are annotated `@RoutePage()`; route argument classes (`*RouteArgs`) carry required data. `app_router.gr.dart` is generated and never edited manually.
- Nested layouts use child routes: `StudentDrivingTrainingLayout` (overview/history/payment/assessment/calender), `StudentCourseTrainingLayout` (overview/parts/payment), `InstructorLayout` (home/calender/training/business), `InstructorTrainingLayout` (home/history/payment/assessment), `AgentLayout` (home/clients/earnings/assets).
- `KeyboardDismissObserver` (`lib/shared/core/presentation/router/navigator_observer.dart`) unfocuses the current field whenever a route pops.

## Authentication and account lifecycle

- **Splash**: `SplashRepository.isLoggedIn()` checks the cached token and expiry; if expired it refreshes via `/auth/token/refresh` and re-persists the token; `isVersionSupported` gates app updates (`shared/features/splash/`).
- **Sign-in** (`shared/features/sign_in/`): phone + OTP. `SignInDataProvider.requestOTP(phone)` → `POST /auth/verify/phone`; `sendOtp(OTPModel)` builds a `DeviceModel` from `android_id` + `device_info_plus`, strips `countryId`, attaches `device` JSON, and calls `POST /auth/signIn`. Success stores the `TokenModel` under `tokenKey`; failure fetches remaining attempts via `/auth/status` (`sign_in/data/data_provider.dart`).
- **Profile**: `GET /user/init` returns `ProfileModel` (language, status, phone, country, alerts, `selectedProfile`, company/instructor/agent/student sub-profiles, `companies` list, `overdatedActivity`; `numberOfProfiles` counts active companies + agent + student). `ProfileBloc` refreshes it after every mutation; image URLs get a `?t=millis` cache-buster (`shared/features/profile/logic/profile_bloc.dart`).
- **Onboarding**: company, student, agent each have `/onboarding/<type>/profile` create + `/onboarding/<type>/complete`; instructors accept a company invitation (`POST/DELETE /onboarding/invitation/{companyId}`, accept re-persists the returned token) and then complete `/instructor/profile/{companyId}`. Student/agent reactivation uses `/onboarding/student/activate` / `/onboarding/agent/activate`. Overdated accounts go through email-recovery (`/auth/recovery`, `/user/email`) and can be closed via `/user/account/close`.
- **Settings**: `/account_settings` covers name, language, email recovery, phone change, role-specific profile settings (instructor off-days/working hours/calendar links, student, agent), and notification preferences. Language changes call `/user/language` and cache the value; phone changes call `/user/phone` with OTP.

## Theming

- `ThemeBloc` holds the active `ThemeState` (sealed Freezed) and switches between `InstructorTheme`, `AgentTheme`, and `StudentTheme` based on the selected profile (`shared/core/presentation/theme/theme_provider/`).
- Each role theme is a `ThemeData` built around a `ThemeExtension<AppTheme>` (`shared/core/presentation/theme/app_theme.dart` and `shared/core/presentation/theme/app_theme_provider.dart`) that carries design tokens: text styles (`textStyles`, `primaryTextStyles`), neutrals (`neutral2`–`neutral6`), semantic colors (success, warning, their light variants and containers, light purple/green/yellow/blue backgrounds).
- Access via `context.appTheme` (the `BuildContextX` extension in `shared/core/presentation/theme/context.dart`), plus `context.theme`, `context.textTheme`, etc.
- Role brand colors: Student primary `0xff7842FB`; Instructor `0xff151515` with accent `0xffC4FF47` (dark) / `0xff60BA6E` (light); Agent primary `0xff2C86F1`.

## Localization

- ARB sources: `lib/l10n/arb/app_en.arb`, `app_de.arb`, `app_fr.arb`, `app_it.arb` (~38–42 KB each, `flutter.generate: true` in `pubspec.yaml`).
- Access strings via `context.l10n.someKey` (`lib/shared/core/presentation/l10n/l10n.dart` — `AppLocalizationsX`). Regenerate with `flutter gen-l10n`; generated files under `lib/l10n/` must not be edited manually.
- `Language` enum (`shared/features/country/data/data_provider/country_model.dart:22-52`) maps codes to fr/de/it/en; `LocaleBloc` (`shared/features/language/logic/locale_bloc.dart`) exposes the active `Locale?`.

## Environments and CI

- `.env.dev`, `.env.test`, `.env.prod` in `environment/` are not committed; CI (Codemagic) injects them from secret variable groups. `baseUrl` is read from the loaded env (`dio_client_service_config.dart`); a missing value raises an `AssertionError`.
- Flavors are wired through Android/iOS flavor configs; builds use `--flavor dev|test|prod` (see `CLAUDE.md`).

## Code generation

`dart run build_runner build --delete-conflicting-outputs` regenerates: `*.freezed.dart`, `*.g.dart`, `app_router.gr.dart`, `injection.config.dart`. Never edit these by hand. After adding or renaming a route, page, or Freezed model, re-run build_runner.

## Conventions (summary)

1. Every feature is three layers: `data/` (data_provider + repository), `logic/` (Freezed bloc), `presentation/` (`@RoutePage` widgets).
2. Repositories return `Either<Failure, T>`; BLoCs fold them into sealed Freezed states.
3. All endpoint paths live as constants in `endpoints.dart`; all HTTP calls go through the single `RestClient`.
4. Add routes only in `app_router.dart`; annotate pages with `@RoutePage()` and re-run build_runner.
5. Add translations to every `.arb` file; use `context.l10n` for strings; never hardcode user-visible text.
6. Extend `AppTheme` (via `ThemeExtension<AppTheme>`) for new design tokens; access via `context.appTheme`.
7. Never edit generated files (`*.freezed.dart`, `*.g.dart`, `app_router.gr.dart`, `injection.config.dart`, `app_localizations*.dart`).
