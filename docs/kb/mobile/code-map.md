# DriveUp Mobile Code Map

## Purpose

This is the source-code reference for DriveUp Mobile (Flutter). It describes the implemented app, not product requirements. For expected behavior, use product docs/specs; when they disagree with the code, identify the discrepancy rather than assuming either is correct. For the structural overview and conventions, see `architecture.md` in this folder.

## Architecture

- Flutter app under `driveup-mobile/`, entry points `lib/main-dev.dart`, `lib/main-test.dart`, `lib/main-prod.dart` (dev/test/prod flavors). See `architecture.md` for the full stack.
- Every feature follows three layers: `data/` (`data_provider` = Retrofit calls, `repository` = `Either<Failure, T>`), `logic/` (Freezed BLoC), `presentation/` (`@RoutePage` widgets).
- One Retrofit `RestClient` covers all endpoints (`lib/shared/core/network/dio_client/dio_client_service.dart`); paths are constants in `lib/shared/core/network/endpoints.dart`.
- Routes are declared in `lib/shared/core/presentation/router/app_router.dart`; the initial route is `/splash` (`app_router.dart:9`).
- Global state lives in root-level blocs registered in each `main-*.dart`'s `MyApp` (theme, locale, notifications, alerts, profile, countries, trainings, invitation).

## Core infrastructure

| Concern           | Location                                                                                                                          | Notes                                                                                                         |
| ----------------- | --------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| HTTP client       | `lib/shared/core/network/dio_client/dio_client_service_config.dart:22-51`                                                         | `baseUrl` from `.env`, 20s/20s/60s timeouts, `PrettyDioLogger`, Bearer-token interceptor from `CacheManager`. |
| Retrofit client   | `lib/shared/core/network/dio_client/dio_client_service.dart`                                                                      | Single abstract `RestClient` (~200 methods).                                                                  |
| API wrapper       | `lib/shared/core/network/api_caller.dart:8-52`                                                                                    | `safeApiCall` catches exceptions; `mapHttpExceptionToFailure` maps 401/403/404/4xx/connection/unknown.         |
| Endpoint paths    | `lib/shared/core/network/endpoints.dart:1-193`                                                                                    | All path constants.                                                                                           |
| Error model       | `lib/shared/core/models/failure.dart`                                                                                             | Sealed `Failure` (network, operationCanceled, accountBlocked, unauthenticated, notFound, unknown, serverMessage, serverInternal). |
| Response envelope | `lib/shared/core/models/basic_response.dart`; pagination `lib/shared/core/models/pagination.dart`                                  | `BasicResponseModel<T>{data?, message?}`, `PaginationModel<T>{totalPages, currentPage, hasNext, data}`.       |
| Storage           | `lib/shared/core/storage/cache_manager.dart` + `shared_prefrences_cache.dart`                                                     | Keys: `TOKEN`, `LANGUAGE`, `COUNTRY`, `fcmToken`. `clearAll()` preserves locale+country.                      |
| DI                | `lib/shared/core/di/injection.dart`, `service_locator.dart`, `injectable_modules.dart`, `injection.config.dart`                    | `@InjectableInit`; `ServiceLocator.resolve<T>()`; `RestClient` from `DioClientService.client`.                 |
| Router            | `lib/shared/core/presentation/router/app_router.dart:5-201`, `app_router.gr.dart`, `navigator_observer.dart`                       | `@AutoRouterConfig(replaceInRouteName: 'Page,Route')`; `KeyboardDismissObserver` unfocuses on pop.             |
| Theme             | `lib/shared/core/presentation/theme/theme_provider/theme_bloc.dart` + `theme_state.dart`                                          | `ThemeBloc` switches `InstructorTheme`/`AgentTheme`/`StudentTheme`.                                           |
| Theme tokens      | `lib/shared/core/presentation/theme/app_theme.dart` + `app_theme_provider.dart` + `context.dart`                                   | `ThemeExtension<AppTheme>` fields (textStyles, primaryTextStyles, neutral2-6, success/warning colors, backgrounds); access via `context.appTheme`. |
| Localization      | `lib/shared/core/presentation/l10n/l10n.dart`; ARB in `lib/l10n/arb/app_{en,de,fr,it}.arb`                                        | `context.l10n.someKey` extension.                                                                             |
| Enums             | `lib/shared/core/models/enums.dart`                                                                                               | `ProfileType`, `TrainingType`, `TrainingStatus`, `CourseType` (FLEXIBLE/FIXED), `CarTransmission`, `SortOrder`/`SortLogic`, `PaymentType`. |
| Token             | `lib/shared/core/models/token.dart`                                                                                               | `refreshToken`, `accessToken`, `accessTokenExpires`, `refreshTokenExpires`.                                    |

## Authentication and account lifecycle

### Splash and version gate

- `shared/features/splash/` — `SplashRepository.isLoggedIn()` checks the cached token and expiry, refreshing through `/auth/token/refresh` when expired; `isVersionSupported` gates updates (`/auth/info/{version}/supported`).
- `SplashBloc` drives the `/splash` → `/update` or `/phone_number` redirect.

### Phone sign-in and OTP

Routes under `app_router.dart:11-14` (`/phone_number`, `/phone_number/verification`, `/create_account`, `/empty_account`).

- `shared/features/sign_in/` — `SignInDataProvider.requestOTP(phone)` → `POST /auth/verify/phone` (`dio_client_service.dart:66-67`); `sendOtp(OTPModel)` builds a `DeviceModel` (from `android_id` + `device_info_plus`), strips `countryId`, attaches `device` JSON, and calls `POST /auth/signIn` (`dio_client_service.dart:69-72`). Success persists the `TokenModel` under `tokenKey`; failure fetches remaining attempts via `/auth/status`.
- Country list loads via `shared/features/country/` (`CountriesBloc` — `countries_bloc.dart`), `CountryModel` + `Language` enum in `shared/features/country/data/data_provider/country_model.dart:8-52`.

### Signup

- `SignInDataProvider.signUp(OTPModel)` → `POST /auth/signUp` (`dio_client_service.dart:95-98`).
- Language selection and account-setup loading routes at `app_router.dart:28-35`.

### Profile bootstrap

- `GET /user/init` (`dio_client_service.dart:74-75`) returns `ProfileModel` (`shared/features/profile/data/`): language, status, phone, country, alerts, `selectedProfile`, company/instructor/agent/student sub-models, `companies` list, `overdatedActivity`, `numberOfProfiles` getter.
- `ProfileBloc` (`shared/features/profile/logic/profile_bloc.dart`) refreshes after every profile mutation and cache-busts the avatar URL with `?t=millis`; loading states carry the previous success.
- `ProfileImageBloc` (`profile_image_bloc.dart`) handles upload/removal with progress (`uploading(count/total)`).
- `ProfileRepository` + `ProfileDataProvider.createProfile(profile, type)` dispatches to company/student/agent endpoints; instructor creation is `UnimplementedError` (instructors are invited).

### Overdated account and recovery

Routes at `app_router.dart:15-27`.

- `shared/features/account_recovery/` — email recovery via `/auth/recovery` (`requestEmailRecovery`, `requestEmailOtp`, `sendEmailOtp` → `sendEmailOtp({'email','otp'})`), then `overwriteAccount()` → `DELETE /auth/recovery` which clears the cache.
- `shared/features/empty_account/` — `deleteAccount(otp, phone)` → `PUT /user/account/close` (`dio_client_service.dart:218-219`).
- `shared/features/contact_support/` — `POST /ticket` (FormData with `name`, `type='recovery'`, `description`, optional file) and `getPendingTickets('recovery')` (`dio_client_service.dart:315-318`).

## Onboarding

| Role      | Profile setup page                                  | Complete endpoint                                        | Reactivation                    |
| --------- | --------------------------------------------------- | -------------------------------------------------------- | ------------------------------- |
| Company   | `company/onboarding/presentation/` (owner_data, company_data, services, categories, promotion, complete) | `PUT /onboarding/company/{id}/complete` (`dio_client_service.dart:240-241`) | —                               |
| Student   | `student/onboarding/presentation/student_profile_setup_page.dart` | `PUT /onboarding/student/complete` (`dio_client_service.dart:245-246`) | `PUT /onboarding/student/activate` (`:248-249`) |
| Agent     | `agent/onboarding/presentation/agent_setup_page.dart` | `PUT /onboarding/agent/complete` (`dio_client_service.dart:251-252`) | `PUT /onboarding/agent/activate` (`:254-255`) |
| Instructor| `instructor/onboarding/` (InvitationPage, ProfileSetupPage, InstructorInfo) | accepts invitation `POST /onboarding/invitation/{companyId}` (re-persists token) then `PUT /instructor/profile/{companyId}` (`:197-198`) | — |

- `CompanyOnboardingBloc` (`company/onboarding/logic/`) is a Freezed state machine driven by a constructor flag `hasName` (skips owner data when a company name already exists); `promotion` state forward transition throws `UnimplementedError`.
- `PromotionCodeDataProvider.applyPromotionCode(code, companyId)` → `PUT /onboarding/promotion/{companyId}` (`dio_client_service.dart:234-235`).

## Student module (`lib/student/`)

### Home

- `student/features/home/` — `StudentHomeDataProvider.getTrainings()` → `GET /student/home` (`dio_client_service.dart:1937`), returns `List<StudentTrainingModel>` (`student_training_model.dart`; `progress` getter computes course vs driving completion). Bloc: `student_trainings_bloc.dart` (registered at app root). Page: `home_page.dart`.

### Driving training

Layout route `/student/driving/layout` with children overview/history/payment/assessment/calender (`app_router.dart:67-92`). Providers are wired in `driving_training/presentation/driving_training_layout.dart`.

| Feature   | Data provider / endpoints                                                                                       | Notes                                                                  |
| --------- | --------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| Overview  | `getStudentDrivingTraining` → `GET /student/driving/training/{id}` (`dio_client_service.dart:1979`); `rateTraining` (:342), `endTraining` (:354) | Model `StudentDrivingDetailsModel`.                                   |
| Topics    | `getStudentDrivingTrainingTopics` → `GET /student/driving/training/{id}/topics` (`:2014`)                       |                                                                        |
| History   | `getStudentDrivingHistory` → `GET /student/driving/history/{id}` (`:2213`)                                      |                                                                        |
| Assessment| `getStudentDrivingAssessment` → `GET /student/driving/assessment/{id}` (`:2254`); `getTopicAssessment` (`:2296`) | `StudentAssessmentGraphBloc`, `StudentTopicAssessmentBloc`.           |
| Calendar  | `getStudentAppointments` → `GET /student/driving/calendar/{id}` (`:2628`); `getBlockedTimeSlots` (`:2670`); add/edit/cancel appointment (`:2714`,`:2747`,`:2780`) | `StudentCalenderDataProvider.loadCalendar(id)` does `Future.wait` of appointments + blocked slots from start-of-week; `StudentCalenderBloc` sets end date startOfWeek+28d. |
| Financial | `getStudentDrivingFinancialFlow` → `GET /student/driving/finances/{id}` (`:2334`)                                | `StudentDrivingFinancialFlowBloc`.                                     |

### Course training

Layout route `/student/course/layout` with children overview/parts/payment (`app_router.dart:93-107`).

| Feature   | Data provider / endpoints                                                                                       | Notes                                                                  |
| --------- | --------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| Overview  | `getStudentCourseTraining` → `GET /student/course/training/{id}` (`:2052`); `rateCourse` (:348), `endCourse` (:359) | Model `StudentCourseDetailsModel` (has `trainingBase` getter → `StudentTrainingModel`). |
| Parts     | `getCourseParts` → `GET /student/course/parts/{id}` (`:2408`); `getFlexibleCourseAppointments` (`:2446`); `registerCourseAppointment` → `POST .../appointments/{trainingId}/{appointmentId}` (:397); `cancelCourseAppointment` (:404) | `CoursePartsBloc`. |
| Financial | `getStudentCourseFinancialFlow` → `GET /student/course/finances/{id}` (`:2371`)                                  | `StudentCourseFinancialFlowBloc`.                                      |

### Onboarding and profile

- `student/features/onboarding/` — `StudentProfileSetupPage` (ProfileBloc + CompleteOnboarding + ProfileName + ProfileImage blocs).
- `student/features/profile/` — `StudentProfileSettingsPage` (takes `studentModel`), delete-profile flow (`PUT /student/profile/close`, `dio_client_service.dart:208-209`).

## Instructor module (`lib/instructor/`)

Layout route `/instructor/layout` with children home/calender/training/business (`app_router.dart:108-117`); `instructor_layout.dart` wires the layout-level blocs (CalendarControllerCubit, DeleteSession/DeleteTask, LoadInstructorsBloc, InstructorHomeBloc, InstructorTrainingsBloc, reassign blocs).

| Feature        | Data provider / endpoints                                                                                                      | Notes                                                                 |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------- |
| Home           | `features/home/` — `getInstructorCalendar` (`dio_client_service.dart:2855`) with `instructorId=null`, plus `deleteTask`/`deleteSession`/`editTask` | `InstructorHomeRepository` computes startOfDay→UTC→+30d, types [flexible, fixed, driving], converts to local with endDate ms==999 fix. `InstructorHomeBloc` sorts by startDate, groups by day. |
| Calendar       | `features/calendar/` — `loadCalendar(start,end,types,instructorId,cancelToken)` (`:2855`), `addInstructorTask` (`:505`), `instructorAddSession` (`:510`) | `InstructorCalenderBloc` loads 14 days back + 42 forward, "load more" appends 29-day chunks (`instructor_calender_bloc.dart:24-80`). Item model `instructor_calendar_item_model.dart` (type/isExam/cancelled/allday/completed/busy/transmission/instructor/student/drivingCategory, `isAllDay` getter). Add-item flow split into `add_item` (AddCalendarItemBloc) + `calendar_controller_cubit`. |
| Training list  | `features/training_list/` — `getInstructorTrainings(sort, sortLogic)` → `GET /instructor/driving/trainings` (`:2810`)           | Model `instructor_training_model.dart` (full financial fields, transmission, completed/total topics, pickupLocation). Pages: `training_page.dart`, `training_card.dart`, `filter_bottom_sheet.dart`. |
| Training det.  | `features/training_details/` — overview `getInstructorTrainingDetails` (`:3128`), history `getInstructorDrivingHistory` (`:3128` area), assessment graph+topics (`:2254`,`:2296`), financial flow `getInstructorDrivingFinancialFlow`, transmission/calendar/permissions | `TrainingStudentModel` (`training_student_model.dart`) with `referenceModel` → `ProfileReferenceModel`. |
| Driving workday| `features/driving_workday/session/` — `instructorSessionDetails` (`:516`), `getInstructorTrainingTopics` (`:3312`), `getInstructorExamTopics` (`:3350`), `setExamTopicStatus` (`:531`), `setExamStatus` (:538), `switchCompletionStatus` (:544), `setExamFeedback` (:549), `addSkillScore` (:556), `getTrainingNotes`, `toggleTopicDone` | Session layout route `/instructor/driving_session` (`app_router.dart:126-129`). |
| Course workday | `features/course_workday/` — `getFixedCourseAttendance`/`setFixedCourseAttendance` (`:470`), `getFlexibleCourseAttendance`/`setFlexibleCourseAttendance` (:473), cancel fixed/flexible appointments (:409,:414) | Route `/instructor/course_session` (`app_router.dart:122-125`).       |
| Business       | `features/business/` — `getBusinessDashboardChart` (`:142-143`), `getBusinessDashboardTotals` (`:148-149`)                      | Pages `business_page.dart`, `line_chart.dart`.                          |
| Expenses       | `features/expenses/` — `getInstructorExpenses` (`GET /instructor/expenses/{instructorId}?limit=10`, :152-153 area), `getExpenseCategories`, `downloadReceipt` (raw bytes via Dio) | Blocs: `load_expense_bloc`, `add_expense_bloc` (registered at root). Route `/instructor/expenses` (`app_router.dart:121`). |
| Handover       | `features/handover/` — REST `getHandoverItems`/`getHandoverHistory`/`getHandoverInstructors` + FirebaseFirestore live stream on `handovers/{instructorId}`; Firebase payment/expense state endpoints (`changeHandoverPaymentState`/`changeHandoverExpenseState`) | Route `/instructor/handover` (`app_router.dart:118`).                   |
| Payments       | `features/payments/` — `getInstructorPayments` (`GET /instructor/payments/{instructorId}?limit=10`), `addPayment` (`POST /instructor/payment/{trainingId}`), `editPayment` (`PUT /instructor/payment/{id}/{trainingId}`) | Blocs `load_payment_bloc` + `add_payment_bloc` (root-registered). Route `/instructor/payments` (`app_router.dart:120`). |
| Sign session   | `features/sign_session/` — `signSession(file, sessionId)` (`POST /instructor/driving/session/{id}/signature`), `removeSessionSignature` | Syncfusion signature pad.                                             |
| Subscriptions  | `features/subscriptions/` — `getActiveSubscription` (`GET /company/subscription/init`, `dio_client_service.dart:77-78`)         |                                                                       |
| Add training   | `features/add_training/` — `getActiveCategories` (`:139-140`), `instructorAddTraining` → `POST /instructor/driving/training/{categoryId}` multipart with nested `person[id]/person[name]/person[phone]/person[address][place]` |                                                                       |
| Company roster | `features/company_instructors/` — `getCompanyInstructors` (`GET /company/team`), `getCompanyInstructorsWithBusyStatus` (`GET /company/team/busy`) | `LoadInstructorsBloc` for reassign flows.                              |
| Reassign       | `features/reassign/` — three sheets (`reassign_task_sheet`, `reassign_session_sheet`, `reassign_course_sheet`) + logics (`reassign_task_instructor_bloc`, `reassign_session...`, `reassign_course...`) | Backed by reassign endpoints (`:3049`, `:3088`, `:123`).               |
| Off days       | `features/profile/off_days/` — `editOffDays(holidays, instructorId)` → `PUT /instructor/holidays/{instructorId}` (`dio_client_service.dart:303`), returns `BasicResponseModel<InstructorModel>` | Route `/account_settings/instructor_profile/off_days` (`app_router.dart:166-169`), args `{instructor, instructorProfileBloc}`. |
| Working hours  | `features/profile/working_hours/` — `editWorkingHours` → `PUT /instructor/schedule/{instructorId}` (`:309`); `WorkingHoursBloc` posts 5 different payload shapes | Widgets `time_wheel.dart`, `add_period_bottom_sheet.dart`. Route `/account_settings/instructor_profile/working_hours`. |
| Profile menu   | `features/profile/menu/` — `InstructorProfileSettingsPage` (takes `companyModel`); `InstructorProfileDataProvider.getInstructorData` → `GET /instructor/profile/{companyId}`, `deleteProfile(instructorId, otp)` → `PUT /instructor/profile/close/{instructorId}` then re-caches returned token | Sub-routes off-days/working-hours/calendar-links (`app_router.dart:162-177`). |
| Onboarding     | `features/onboarding/` — `InvitationPage`, `ProfileSetupPage`, `InstructorInfo`; `InvitationDataProvider` reject `DELETE /onboarding/invitation/{companyId}` / accept `POST` (accept re-caches token) | `InvitationBloc` registered at root.                                    |

## Agent module (`lib/agent/`)

Layout route `/agent/layout` with children home/clients/earnings/assets (`app_router.dart:190-199`).

| Feature     | Data provider / endpoints                                                                                          | Notes                                                               |
| ----------- | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------- |
| Home        | `features/home/` — top clients via `TopClientsBloc`, `ClientCard`, `PromotionCodeBloc`, alert/invitation widgets     |                                                                     |
| Clients     | `features/clients/data/data_provider.dart` — `getActiveClients(page)` / `getExpiredClients(page)` (`GET /agent/clients/paginated?...`) / `getTopClients` | Returns `PaginationModel<ClientModel>`.                             |
| Earnings    | `features/earnings/data/data_provider.dart` — `getPayouts` (`/agent/payouts`), `getAgentEarnings` (`/agent/earnings`), `getAgentTotalIncome` (`/agent/payouts/total`), `submitBankDetails` (`PUT /agent/finances/bank`, filters null/empty), `deleteBankDetails` (`DELETE /agent/finances/bank`) | `AgentEarningsBloc`.                                                |
| Assets      | `features/assets/data/data_provider.dart` — `getAssets` (`GET /agent/assets`)                                        |                                                                     |
| Layout      | `features/layout/data/data_provider.dart` — `getPromotionCode` → `List<String>` (`GET /agent/codes`)                  |                                                                     |
| Profile     | `features/profile/menu/` — `AgentProfileSettingsPage` (no model), delete-agent flow (`PUT /agent/profile/close`)     | `app_router.dart:182-185`.                                          |
| Onboarding  | `features/onboarding/` — `AgentProfileSetupPage`, `AgentInfo`                                                        | `AgentProfileSetupBloc`.                                            |

## Company module (`lib/company/`)

| Feature              | Location                                                                                        | Endpoints                                                                  |
| -------------------- | ----------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| Onboarding           | `company/onboarding/` (bloc + pages: owner_data, company_data, services, categories, promotion, complete) | `createCompanyProfile` → `POST /onboarding/company/profile` (`dio_client_service.dart:80-81`); `completeCompanyOnboarding` → `PUT /onboarding/company/{id}/complete` (:240). |
| Company categories   | `company/company_categories/` — `category_data_provider.dart`                                    | `getCategories(id)` (`GET /onboarding/company/{id}/courses`, `:136-137`); `activateCategory` (`POST /onboarding/company/{id}/courses/{categoryId}`, `:221-222`); `deactivateCategory` (`DELETE`, `:228-229`). |
| Category model       | `shared/features/category/` — `CategoryModel` + `CategoryContext` enum (info/warning/primary/success/error color mapping) | `getActiveCategories` (`/company/driving/categories/active`, `:139-140`).    |

Note: there is no company dashboard/calendar module in the mobile app — company management is handled by the DriveUp Admin web app (see `docs/kb/code-map.md`). The mobile company module only covers onboarding and category selection.

## Shared cross-role features (`lib/shared/features/`)

| Feature             | Location                                                                                          | Notes                                                                                          |
| ------------------- | ------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| Notification        | `notification/` — `NotificationsBloc` (20s polling, dismiss/dismissAll/seen), `NotificationsDataProvider` (`dio_client_service.dart:180-187` area) | Data provider methods `getNotifications`/`dismissNotification`/`dismissAllNotifications`/`seen`. |
| Notification settings | `notification_settings/` — data provider switch: company → `UnimplementedError`, student/agent direct, instructor `getInstructorNotificationSettings(id!)`; `setNotificationPreference(name, value, companyId)` (`PUT /user/notification/preferences/`) | Page takes `profileType` + `companyId`.                                                         |
| Alerts              | `alerts/` — `AlertsDataProvider.dismissAlert(id)` → `PUT /user/alerts/{id}/dismiss`; `DismissAlertBloc` (root-registered) |                                                                                               |
| Firebase messaging  | `firebase_messaging/` — `FirebaseMessagingBloc` stores FCM token via `setToken` → `POST /user/device/push/enable`; authorized/denied states |                                                                                               |
| Account settings    | `account_settings/` — pages for name, language, email recovery, phone change; `verifyNewNumber(number, otp)` → `PUT /user/phone`; `changeLanguage(language)` → `PUT /user/language` + caches `languageKey` | Route `/account_settings` + sub-routes (`app_router.dart:147-189`).                             |
| Profile (shared)    | `profile/` — `ProfileBloc`, `ProfileRepository`, `ProfileDataProvider` (create/init/name/image), `ProfileImageBloc`, `CreateProfileModel` | `PUT /user/name`, `POST|DELETE /user/image` (`dio_client_service.dart:103-119`).                |
| Country             | `country/` — `CountryModel`/`Language`, `CountriesBloc`, `CountryRepository`                       |                                                                                               |
| Language            | `language/` — `LocaleBloc` (`Bloc<LocaleEvent, Locale?>`), `LocaleChanged`/`SetFromStorage`        |                                                                                               |
| Contact support     | `contact_support/` — `POST /ticket`, `getPendingTickets('recovery')`                                | Used from email-recovery flow.                                                                 |
| Empty account       | `empty_account/` — `deleteAccount(otp, phone)` → `PUT /user/account/close`                          |                                                                                               |

## Noteworthy endpoints

All paths are constants in `lib/shared/core/network/endpoints.dart` (line references below); all are implemented on `RestClient` (`dio_client_service.dart`, method lines referenced where captured).

| Path                                                                                          | Direction | Purpose                                              | Constants (`endpoints.dart`) |
| --------------------------------------------------------------------------------------------- | --------- | ---------------------------------------------------- | ---------------------------- |
| `/auth/token/refresh`                                                                          | POST      | Refresh access token                                 | `:2`                         |
| `/auth/verify/phone`                                                                           | POST      | Request OTP for phone sign-in                        | `:5`                         |
| `/auth/signIn`                                                                                 | POST      | Verify OTP + device, return tokens                   | `:7`                         |
| `/user/init`                                                                                   | POST      | Load profile after token                             | `:10`                        |
| `/onboarding/company/{id}/courses`                                                             | GET/POST/DELETE | List/activate/deactivate driving categories   | `:21`,`:33`                  |
| `/instructor/driving/training/{categoryId}`                                                    | POST      | Add a driving training (multipart)                   | `:30-31`                     |
| `/instructor/driving/trainings`                                                                | GET       | List instructor trainings (progress/terminated/completed) | `:97-98`               |
| `/instructor/driving/training/{trainingId}/transmission`                                       | PUT       | Change transmission type                             | `:129-130`                   |
| `/instructor/driving/training/{trainingId}/calendar`                                           | PUT       | Toggle calendar permission                           | `:131`                       |
| `/instructor/calendar`                                                                         | GET       | Load instructor calendar items                       | `:84`                        |
| `/instructor/holidays/{instructorId}`                                                          | PUT       | Edit off-days                                        | `:50`                        |
| `/instructor/schedule/{instructorId}`                                                          | PUT       | Edit working hours                                   | `:51`                        |
| `/instructor/driving/session/{id}/signature`                                                   | POST/DELETE | Sign / remove session signature                    | `:122`                       |
| `/instructor/payment/{trainingId}` / `/instructor/payment/{id}/{trainingId}`                   | POST/PUT | Add / edit training payment                          | `:132-135`                   |
| `/instructor/expenses/{instructorId}?limit=10`                                                 | GET       | Paginated instructor expenses                        | `:152-153`                   |
| `/instructor/handover/{instructorId}` + `/instructor/handover/firebase/{payment\|expense}/{id}` | GET/PUT   | Handover items + Firebase status                     | `:157-164`                   |
| `/student/driving/training/{id}` (+ `/topics`, `/rate`, `/terminate`)                          | GET/PUT   | Student driving training overview/topics/lifecycle   | `:56`,`:69-72`               |
| `/student/course/training/{id}` (+ `/parts/{id}`, `/rating`)                                   | GET/PUT   | Student course training/parts/rating                 | `:57-58`,`:68`               |
| `/student/driving/calendar/{id}` (+ `/instructor` for busy slots)                               | GET       | Student driving calendar + blocked slots             | `:80-82`                     |
| `/student/driving/session/{id}` (+ `/update`, `/reassign/{instructorId}`)                      | GET/PUT   | Student session ops / reassign                       | `:83`,`:123-124`             |
| `/student/driving/finances/{id}` and `/student/course/finances/{id}`                           | GET       | Financial flow (desc/createdOn)                      | `:76-79`                     |
| `/instructor/courses/fixed\|flexible/appointment/{id}[/{date}]/{attendance\|students\|cancel}` | GET/PUT   | Course attendance + cancellation                     | `:85-92`,`:64-67`            |
| `/company/team` and `/company/team/busy`                                                       | GET       | Company instructor roster (with busy status)         | `:26-27`                     |
| `/agent/codes`, `/agent/clients/paginated`, `/agent/payouts`, `/agent/earnings`, `/agent/assets`| GET/PUT/DELETE | Agent promotion, clients, finance, assets      | `:165-176`                   |
| `/user/notification/preferences/*` and `/user/notifications*`                                   | GET/PUT   | Notification preferences + inbox                     | `:177-188`                   |

## Conventions for adding a feature

1. Create the feature folder under the owning role module, e.g. `lib/instructor/features/<name>/` with `data/`, `logic/`, `presentation/`.
2. Add any new endpoint path as a constant in `lib/shared/core/network/endpoints.dart`, and add the method to `RestClient` in `dio_client_service.dart` with the matching Retrofit annotation.
3. Create a `@lazySingleton` data provider that calls `safeApiCall(...)`, a repository returning `Either<Failure, T>`, and a Freezed BLoC (`*_event.dart` / `*_state.dart` / `*_bloc.dart`) folding the Either into `loadSuccess`/`loadFailure` states.
4. Build the page with `@RoutePage()` and register the route in `app_router.dart` (nested under the relevant layout when applicable); register feature blocs at the layout level via `MultiBlocProvider` (or at app root for cross-cutting blocs).
5. Add user-visible strings to all four ARB files and reference via `context.l10n.*`; run `flutter gen-l10n`.
6. Run `dart run build_runner build --delete-conflicting-outputs` to regenerate Freezed/Retrofit/AutoRoute/Injectable files.
7. Never edit generated files manually; verify with `flutter analyze`.

## Source lookup guide

When answering an implementation question:

1. Start with the route in `lib/shared/core/presentation/router/app_router.dart`, then open the corresponding `@RoutePage` in `presentation/`.
2. Trace the page's blocs (`logic/`) to their repositories and data providers (`data/`).
3. Check `RestClient` (`dio_client_service.dart`) and `endpoints.dart` for the underlying HTTP contract.
4. Check `lib/shared/core/` only for cross-cutting concerns (networking, DI, routing, theme, storage); check `lib/shared/features/` for cross-role flows (auth, profile, notifications, settings).
5. Cite `lib/...:line` (source file, not generated `*.g.dart`/`*.freezed.dart`) when answering an implementation question.
