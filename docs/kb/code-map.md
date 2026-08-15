# DriveUp Admin Code Map

## Purpose

This is the source-code reference for DriveUp Admin. It describes the implemented Angular application, not product requirements. For expected behavior, use the generated Zephyr Gherkin files in `features/`. When the two disagree, identify the discrepancy rather than assuming either one is correct.

## Architecture

- Angular 22 standalone-component SPA. Root routes live in `src/app/app.routes.ts`.
- Role areas are lazy-loaded from `src/app/profile/`; cross-role flows live in `src/app/user/`.
- `src/app/core/` owns configuration, guards, HTTP, models, services, utilities, and global NgRx state.
- `src/app/shared/` owns reusable business-domain components and common UI primitives.
- API base URL comes from `NG_APP_API_URL` through `ConfigService`. `CoreService` normalizes relative endpoint paths before calling `HttpClient` (`src/app/core/services/common/core.service.ts:15-84`).
- Most responses use `IResponse<T>` and pageable lists use `IPaginationResponse<T>` from `@intelact/common`; application entities primarily come from `@intelact/driveup`.

### Root routes and access

| URL prefix           | Feature area                                          | Guards                         |
| -------------------- | ----------------------------------------------------- | ------------------------------ |
| `/auth`              | Phone/OTP authentication, signup, invitations, logout | Public except invitations      |
| `/company`           | Company-owner/manager administration                  | `authGuard`, `companyGuard`    |
| `/agent`             | Marketing-agent dashboard, clients, payouts, assets   | `authGuard`, `agentGuard`      |
| `/student`           | Student web blocker/dashboard                         | `authGuard`, `studentGuard`    |
| `/instructor`        | Instructor web blocker/dashboard                      | `authGuard`, `instructorGuard` |
| `/account`           | Cross-profile account and profile management          | `authGuard`                    |
| `/account/overdated` | Inactive-account recovery                             | `authGuard`                    |
| `/onboarding`        | User and company onboarding                           | `authGuard`                    |
| `/blocked`           | Blocked-account page                                  | `authGuard`                    |

Source: `src/app/app.routes.ts:4-57`.

### State, HTTP, and routing lifecycle

- Global state combines `app`, `auth`, `notifications`, `uiPreferences`, `user`, and `subscription` slices in `src/app/core/store/global/global.reducer.ts:9-34`.
- `authPersistenceMetaReducer` reloads and writes selected auth fields to `localStorage["du-auth"]`, including token, in-progress signup data, country, device, language, and selected onboarding state (`src/app/core/store/global/global.config.ts:7-150,195-217`). The AES `LocalStorageService` is currently unused for this auth persistence.
- `AppBootstrapService` loads `/user/init` after a persisted token resolves, then routes by `User.status` and `selectedProfile`. It directs pending users to onboarding, invited users to invitations, blocked users to `/blocked`, and active users to the selected role dashboard (`src/app/core/services/common/app-bootstrap.service.ts:50-247`).
- `authInterceptor` attaches `Authorization`, refreshes a 401 token once through `/auth/token/refresh`, then retries the request (`src/app/core/interceptors/auth.interceptor.ts:48-82`). Public and verification requests use `IS_PUBLIC` and `IS_VERIFICATION_ENDPOINT` contexts.
- `errorInterceptor` logs out unauthorized users, shows API errors, and routes network/502/503/504 failures to `/error` (`src/app/core/interceptors/error.interceptor.ts:9-82`).
- Profile-specific guards use `User.selectedProfile`; `companyGuard` additionally requires `Role.Owner` or `Role.Manager` (`src/app/core/guards/company.guard.ts:26-37`).

### Reactive data patterns

The application intentionally mixes patterns:

- Newer domains use Angular signals, `toSignal`, and `rxResource`: company calendar, driving topics, agent clients/dashboard, finance dashboard/debts, and cash handover.
- Older domains commonly use `Observable.subscribe()` to set local signals: settings, team, driving/course training pages, and fixed courses.
- `EventBusService` broadcasts refresh events such as training, finance, invoice, expense, bank-information, and flexible-course changes. Event names are in `src/app/core/models/common/events.enum.ts`.
- Do not add a new caching/state pattern to a feature without first following its local pattern.

## Authentication and account lifecycle

### Phone sign-in and OTP

Routes are under `/auth`: `signin`, `otp`, `language`, `signup`, `invitation`, and `logout` (`src/app/user/auth/routes.ts:6-44`).

1. `AuthSigninComponent` loads `GET /auth/countries`, selects a country, normalizes the phone number, records the device, and starts second-factor verification (`src/app/user/auth/signin/signin.component.ts:42-117`).
2. The auth effect calls `POST /auth/status`, then `POST /auth/verify/phone`; the returned `AuthStatus` contains `leftAttempts`, `leftOTPs`, and `oldestOTP` (`src/app/core/store/auth/auth.effects.ts:39-90`; `src/app/core/models/account/auth-status.model.ts`).
3. `AuthVerifyComponent` submits `POST /auth/signin` with `{ phone, otp, device }`; a 401 decrements remaining attempts and a 404 begins signup (`src/app/user/auth/verify/verify.component.ts:42-67`; `src/app/core/store/auth/auth.effects.ts:107-146`).
4. OTP resend calls the same `/auth/verify/phone` endpoint. The UI treats `leftAttempts === 0` as blocked and `leftOTPs > 0` as resendable (`verify.component.ts:27-28`).

`AuthApiService` endpoints are defined in `src/app/core/services/auth/auth-api.service.ts:15-48`; verification endpoints are in `verify.service.ts:20-45`.

### Signup, language, and invitations

- In multi-language countries, `/auth/language` loads `GET /auth/languages/{countryId}` and stores the selection before signup (`src/app/user/auth/language/language.component.ts:50-145`).
- `AuthSignupComponent` posts `/auth/signup`, creates `/onboarding/{profileType}/profile`, reloads `/user/init`, and routes to user or company onboarding (`src/app/user/auth/signup/signup.component.ts:74-190`).
- Company invitations are handled at `/auth/invitation`; accept/reject call `POST`/`DELETE /onboarding/invitation/{companyId}` via `OnboardingProcessService` (`src/app/user/auth/invitation/invitation.component.ts:65-137`; `src/app/core/services/account/onboarding.service.ts:42-50`).
- Account recovery uses `/account/overdated/{options|recovery-email|contact-support}`. `AppBootstrapService` forces active users flagged `overdatedActivity` into this flow (`app-bootstrap.service.ts:163-184`).

### Account management and profile switching

- `/account` contains personal data, companies, student, agent, and welcome views (`src/app/user/account/routes.ts:3-41`).
- `UserService` owns `/user/init`, `/user/switch`, name/language/phone/email/image updates, alerts, and account closure (`src/app/core/services/account/user.service.ts:13-39`).
- `SwitchProfileOverlayComponent` posts `/user/switch`, replaces the token, reloads the profile, then uses `getDashboardRouteByProfileType` (`src/app/shared/account/switch-profile/switch-profile.overlay.ts`).
- Company, agent, and student account services own profile create/complete/activate/close actions under `/onboarding/*` and their respective profile endpoints.

## Onboarding

### User profile

`/onboarding/user/profile` captures the account name and optional image, then completes student or agent profiles. It uses `PUT /user/name`, `POST`/`DELETE /user/image`, then `PUT /onboarding/{type}/complete` or activation (`src/app/user/onboarding/user/profile/profile.component.ts:89-237`; `src/app/core/services/account/onboarding.service.ts:25-40,92-110`).

### Company profile

Company onboarding routes are `/onboarding/company/:profileId/{profile|products|services|promotion}` (`src/app/user/onboarding/routes.ts:50-104`).

| Step      | Component                                  | Main implementation                                                                                                        |
| --------- | ------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------- |
| Profile   | `company/profile/profile.component.ts`     | Company name; `PUT /onboarding/company/{id}/name`; logo `POST`/`DELETE /onboarding/company/{id}/logo`                      |
| Products  | `company/products/products.component.ts`   | Select Driving Trainings and/or Theory Courses; temporarily stored in auth state                                           |
| Services  | `company/services/services.component.ts`   | If driving is selected, configure driving categories; load `GET /onboarding/company/{id}/courses`, update category state   |
| Promotion | `company/promotion/promotion.component.ts` | Optional `PUT /onboarding/promotion/{id}` then `PUT /onboarding/company/{id}/complete`; replaces token and reloads profile |

`OnboardingProcessService` resumes pending users, starts a company from an active account, and resolves invitation decisions (`src/app/core/services/account/onboarding-process.service.ts:31-229`).

## Company profile

### Shell and dashboard

- Company routes are in `src/app/profile/company/routes.ts`; the shell owns sidebar navigation, notifications, quick actions, subscription gates, and training search.
- `CompanyShellComponent` provides `CompanyDashboardService`, reads the UI sidebar preference, and gates add-training actions on subscription limits (`src/app/profile/company/shell/shell.component.ts`).
- Dashboard aggregates debts, trainings, appointments, instructor activity, and financial history through `CompanyDashboardService`.
- Main dashboard endpoints are `/company/business/debts`, `/company/business/trainings`, `/company/business/appointments`, and `/company/team/activity` (`src/app/core/services/company/company-dashboard.service.ts`).

### Settings

Settings routes: `brand`, `contact`, `schedule`, `off-days`, `pickup-locations`, `language`, `ownership`, `finance`, and `calendar-settings` (`src/app/profile/company/settings/routes.ts`).

`CompanySettingsService` is the main integration point (`src/app/core/services/company/company-settings.service.ts`):

- Company profile: `PUT /company/profile/{name|description|homepage|email|phone|address|zipcode|location|language|obligation}`.
- Brand: `POST`/`DELETE /company/profile/logo`.
- Schedule: `PUT /company/profile/working` and `/company/profile/holidays`.
- Pickup locations: `GET`/`PUT /company/profile/pickup`.
- Finance details: `PUT /company/profile/iban` and `/company/profile/taxid`.
- Ownership and closure: verification-backed `PUT /company/team/owner/{id}` and `/company/profile/close`.

### Team and billing

- `/company/team` lists active, invited, and closed members. `CompanyTeamService` uses `GET`/`POST /company/team`, `DELETE company/team/{id}`, and member role/revoke/reinstate endpoints (`src/app/core/services/company/team.service.ts`). Invitations are also seat- and subscription-gated in `src/app/profile/company/team/team.component.ts`.
- `/company/billing` loads the subscription state, billing history, receipts, and plan options. `BillingService` owns `/company/subscription/*`, `/company/payment-method`, `/company/payments/paynow`, `/company/giftcode`, and `/ticket` (`src/app/core/services/company/billing.service.ts`).
- The subscription NgRx effect only loads a subscription for an active company profile (`src/app/core/store/subscription/subscription.effect.ts`).

## Company trainings

### Driving trainings

- Routes: `/company/trainings/driving` and `/company/trainings/driving/details/:id` (`src/app/profile/company/trainings/routes.ts`).
- `DrivingTrainingsService` owns listing, categories, instructors, training lifecycle, sessions, pickup locations, finance, and exports (`src/app/core/services/company/driving-trainings.service.ts`).
- Important endpoints: `GET /company/driving/trainings`; `POST /company/driving/training/{categoryId}/{instructorId}`; `GET /company/driving/training/{id}/sessions`; lifecycle `PUT .../{complete|terminate|reinstate|calendar|transmission|administrationFee|license}`.
- Per-training money flows use payment, discount, and refund add/cancel/approve endpoints below `/company/driving/training`.
- Details load student-facing training data from `StudentsService.getStudentDrivingTraining`, `GET /company/student/trainings/{id}/driving`.

### Course trainings

- Routes: `/company/trainings/course` and `/company/trainings/course/details/:id`.
- `CourseTrainingsService` owns `GET /company/course/trainings`, creation, parts, attendance, appointments, lifecycle, and mirrored payment/discount/refund endpoints under `/company/course/training` (`src/app/core/services/company/course-trainings.service.ts`).
- Course training creation is `POST /company/course/training/{studentId}/{courseId}/create`; appointment selection calls `POST`/`DELETE` course-training appointment endpoints.

### Training shared components

`src/app/shared/trainings/` contains add-driving/add-course dialogs, training overview cards, student selectors, appointments, completion, profile, badges, and finance dialogs. Finance components switch between `DrivingTrainingsService` and `CourseTrainingsService` based on `training.type`; there is no third, generic training-finance API service.

## Company calendar

- `/company/calendar` is coordinated by `CompanyCalendarComponent` and rendered by `SchedulerCalendarComponent`.
- `CompanyCalendarService` is a modern signal-based service. `rxResource` loads `GET /company/calendar/{instructorId}` from filters `{types,startDate,endDate}` and resources also load active instructors, driving students, and pickup locations (`src/app/core/services/company/company-calendar.service.ts:50-100,182-188`).
- It handles task and driving-session mutations. Course and off-day mutations are routed through specialized course and settings/instructor services.
- Company off-days update `PUT /company/profile/holidays`; instructor off-days update `PUT /instructor/holidays/{companyId}`. Working-hours and holidays are mapped into local calendar events.
- Course appointment changes use `FixedCourseService`, `FlexibleCourseService`, and `CourseTrainingsService.attendance` from the calendar page.

## Company finance

Finance routes: dashboard, `flow`, `debts`, `handover`, `expenses`, `invoices`, and `online` (`src/app/profile/company/finance/routes.ts`).

| Area            | Service and principal endpoints                                                                                                                      |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| Dashboard       | `FinanceDashboardService`: `/company/business/history`, `/history/total`, `/company/handover/pending`, `/company/student/debts`, `/company/invoices` |
| Financial flow  | `FinancialFlowService`: `GET /company/business/flow`, instructors from `/company/team`                                                               |
| Debts           | `DebtsService`: `GET /company/student/debts`                                                                                                         |
| Expenses        | `ExpenseService`: `/company/expenses`, `/company/expense`, `/company/expense/categories`, approve/reject endpoints                                   |
| Cash handover   | `CashHandoverService`: `/company/handover/*` plus Firestore live handover documents; Firebase payment/expense status endpoints                       |
| Invoices        | `InvoicesService`: `/company/invoices`, `/company/invoice/{id}`, generate/paid/cancel/PDF endpoints                                                  |
| Online payments | `OnlineTransactionsService`: `/company/online/transactions` and driving/course approve/cancel endpoints                                              |

Shared finance UI lives in `src/app/shared/finance/`; per-training transactions are in `src/app/shared/trainings/finance/`.

## Company courses

### Fixed and flexible courses

Routes are under `/company/courses` (`src/app/profile/company/courses/routes.ts`):

- Fixed: `/fixed`, then `details/:id/{info|lessons|students}`.
- Flexible: `/flex`, then `details/:id/{info|lessons|students}`.
- Course calendar: default route.

`FixedCourseService` and `FlexibleCourseService` both create at `POST /company/courses`, then manage details, publishing, and deletion. Fixed courses manage explicitly scheduled parts through `/company/courses/fix/parts/*`; flexible courses manage parts and recurring appointments through `/company/courses/flex/parts/*` and `/company/courses/flex/appointments/*`.

`CourseManagementService` provides cross-course calendar data (`GET /company/courses/appointments`) and active courses/instructors. Reusable cards, appointment editors, series tools, end dialogs, student lists, and instructor selection are in `src/app/shared/course/`.

## Company driving content and reports

### Driving categories and topics

- `/company/driving/categories` uses `CategorySettingsService` to load `GET /company/driving/categories` and update `PUT /company/driving/categories/{id}/update`.
- The shared `DrivingCategoryFormComponent` validates mandatory price, duration bounds, administration fee, active state, and whether existing trainings are affected (`src/app/shared/driving/category-form/category-form.component.ts`).
- `/company/driving/topics` uses `CategoryTopicService` and `rxResource` to load categories/lessons. It supports topic create/update/sort/move/delete under `/company/driving/topics/*`, and category topic seeding at `PUT /company/driving/categories/{id}/seed`.

### Reports

`/company/reports/{monthly|yearly|instructors}` downloads rather than renders report data. `CompanyReportsService` exposes:

- `GET /company/reports/monthly-finances?month&year`
- `GET /company/reports/yearly-finances?year`
- `GET /company/reports/instructor-monthly/{instructorId}?month&year`
- `GET /company/reports/payment/{id}/public`

Instructor activity list data comes from `GET /company/team/monthly-report`.

## Agent, instructor, and student profiles

### Agent

- Routes: `/agent/{dashboard|clients|payouts|assets}` (`src/app/profile/agent/routes.ts`).
- `AgentClientsService`: `GET /agent/clients/paginated`.
- `AgentFinanceService`: agent payouts, earnings, payout totals, and `PUT`/`DELETE /agent/finances/bank`.
- `AgentAssetsService`: `GET /agent/assets`; documents are downloaded via `FileDownloadService`.
- `AgentPromotionService` uses resources for `/agent/codes` and `/agent/earnings`.

### Instructor

- `/instructor/dashboard` is intentionally a lightweight app-download/QR landing page.
- Instructor work is mainly surfaced in `/account/companies/:id`: profile info, schedule, off-days, calendar links, and closure.
- `InstructorService` provides `GET /instructor/profile/{companyId}`, filtered `GET /company/driving/trainings`, `PUT /instructor/holidays/{companyId}`, and `PUT /instructor/schedule/{companyId}`.

### Student

- `/student/dashboard` is also a lightweight app-download/QR page.
- Actual student account management is `/account/student/{home|notifications}`; profile close uses `StudentAccountService`.

## Shared UI, models, and utilities

- Common domain shared folders: `account`, `billing`, `calendar`, `course`, `driving`, `finance`, `instructor`, `student`, `team`, and `trainings`.
- Generic shared UI components are under `src/app/shared/ui/`: alerts, branding, buttons, cards, charts, data grid, dialogs, indicators, inputs, layout, media, navigation, notifications, and selections.
- Domain model groupings are `core/models/{account,common,course,finances,onboarding,training,ui}`. Local models mainly define UI state, filter types, dialog data, enums, and route-independent helper types.
- Important utilities: `dashboard-routing.helper.ts` maps profile/role to dashboards; `phone-number.ts` normalizes and validates numbers; `paginate.helper.ts` builds API pagination parameters; `router.helpers.ts` defines HTTP context tokens; `alert.util.ts` maps policy alerts to routes.

## Source lookup guide

When answering an implementation question:

1. Start with the route in `src/app/app.routes.ts` or the relevant feature `routes.ts`.
2. Read the route component and trace injected services to their endpoint methods.
3. Check `core/store/` only for cross-screen auth, profile, subscription, notification, app-info, or UI-preference state. Most feature lists are not NgRx state.
4. Check `AppBootstrapService`, guards, and `AccountStateService` for login/profile/redirection behavior.
5. Check `shared/` for dialogs and component-owned validation before claiming a field or action is supported.
6. Cite both the behavioral Gherkin file and source `file:line` when answering a behavior question. Mark mismatches explicitly.
