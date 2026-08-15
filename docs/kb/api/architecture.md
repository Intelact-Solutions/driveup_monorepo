# DriveUp API Architecture

## Purpose

DriveUp API is the NestJS backend that serves the DriveUp ecosystem (admin, mobile, and portal clients). It is a monorepo submodule at `driveup-api/` and is consumed by `docs/kb/projects/api.md` (project metadata) and `docs/kb/api/code-map.md` (endpoint/source reference). This document describes how the API is structured and how to extend it consistently.

## Tech stack

- NestJS on Node.js, TypeScript, pnpm monorepo.
- TypeORM (MySQL) with entity subscribers and SQL migrations under `src/database/`.
- `@nestjs/event-emitter` for domain events, `@nestjs/schedule` for cron jobs.
- `nestjs-i18n` for translations; `handlebars` for email templates.
- External services: Firebase (auth/messaging), AWS S3 (storage), Stripe (payments), driveup-jobs API (PDF/image generation), IP geolocation.
- Shared SDK packages `@intelact/common`, `@intelact/driveup`, `@driveup/schema`, `@driveup/shared` are consumed as workspace packages.

## Entry points

| File                       | Responsibility                                                                                                                        |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `src/main.ts`              | Bootstraps the app: i18n (`Accept-Language`), global `AuthGlobalInterceptor` + `HttpResponseInterceptor`, `TransformTypeErrorFilter` + `HttpExceptionFilter`, Stripe raw-body handling for `stripe/webhook`, `helmet`, 10 MB JSON body limit. |
| `src/app.module.ts`        | Root wiring: imports all feature modules plus global `DatabaseModule`, `EventsModule`, `HealthModule`, config-driven modules.          |
| `src/app.controller.ts`    | `GET /` (rendered index), `GET /info` (`AppInfo`), `POST /file` (S3 download URL).                                                    |

Source: `src/main.ts`, `src/app.module.ts`, `src/app.controller.ts`.

## Module layout

### Feature modules (`src/modules/`)

| Module        | Responsibility                                                                                          |
| ------------- | ------------------------------------------------------------------------------------------------------- |
| `auth`        | Public OTP sign-in/sign-up, phone/email verification, biometric sign-in, account recovery, app info.    |
| `user`        | User account, profiles, devices, alerts, notifications, preferences, `/user/init` and profile switching.|
| `onboarding`  | User/company/agent/student onboarding flows and company invitations.                                    |
| `company`     | Company profile, team, business/finance, invoice, expense, payments, calendar, courses, trainings, reports. |
| `instructor`  | Instructor profile, schedule, holidays, tasks, calendar, business/expense/payment/handover, courses, driving. |
| `agent`       | Agent profile, clients, promotion codes, assets, finances, earnings, payouts.                           |
| `student`     | Student home, profile, course/driving trainings, sessions, calendar, finance.                           |
| `token`       | JWT issuance (`IToken`), refresh, `POST token/validate` / `token/refresh`.                              |
| `ticket`      | Support ticket creation and listing with file upload.                                                   |
| `public`      | Public routes: geoinfo, features, testimonials, contact-us, contact-sales, price plans, articles.       |
| `ical`        | Public iCalendar feed (`GET ical/:token`) of driving/course/task appointments.                          |

### Shared modules (`src/shared/`)

`alert`, `asset`, `company`, `country`, `course`, `driving`, `events`, `expense`, `external`, `firebase`, `geo`, `health`, `instructor`, `localization`, `notification`, `storage`, `stripe`, `sync`, `training`, `user`, `verification`.

Shared modules expose mappers (entity → `@intelact/driveup` DTO) and reusable services. Controllers never build response DTOs inline; they map through `*Mapper.toModel`/`toSimple`/`toModelWithDetails` classes (e.g. `TrainingMapper`, `DrivingSessionMapper`, `ExpenseMapper`, `CompanyStudentMapper`).

## Dependency injection and config

- Providers are constructor-injected (`private readonly x$: Service`), often suffixed `$` to signal injected service dependencies.
- `src/common/helpers/config.ts` exposes a `Config` singleton loaded from `src/config/app.config.ts` (`APP_NAME=DriveUp`, `APP_URL=https://app.driveup.pro`). Feature modules read credentials/limits from `Config` (e.g. `Config.auth.otpMaxAttempts`, `Config.storage`, `Config.stripe`).
- `src/config/` holds environment-driven config objects consumed via `Config` rather than `process.env` directly.

## HTTP conventions

- Global response shape is produced by `HttpResponseInterceptor`; exceptions are normalized by `HttpExceptionFilter` (custom exceptions live in `src/common/exceptions/`: `BadRequestException`, `ForbiddenException`, `UnauthorizedException`, `NotFoundException`, `InternalErrorException`, `MaintenanceException`). User-facing messages come from `ErrorMessage` keys (i18n).
- Auth is JWT via `AuthGuard` (`src/modules/auth/guards/auth.guard.ts`): reads bearer token, verifies via `TokenService`, loads the `UserEntity`, validates the selected profile (`CompanyInstructor`/`Instructor`/`Student`/`Agent`) is not closed and that the company is not closed, and rejects closed users.
- `RolesGuard` (`src/modules/auth/guards/roles.guard.ts`) enforces profile roles: `Role.Student`, `Role.Agent`, and company roles (`Role.Owner`, `Role.Manager`, `Role.Instructor`) against the authenticated `CompanyInstructorEntity`.
- `RequestContext` (`src/common/http/request.context.ts`) plus `AuthGlobalInterceptor` populate `RequestStorage` (AsyncLocalStorage) with the request user/profile/role and `isPublic` flag, so subscribers and services can branch on the acting session.
- Decorators: `@AuthUser()`, `@AuthCompany()`, `@AuthInstructor()`, `@AuthAgent()`, `@AuthToken()`, `@PaginationParams()`, `@ResponseMessage()`, `@IsPublic()`, `@HeaderIP()`.
- Pagination: `@PaginationParams(new ParamValidationPipe(XFilterDto))` yields `IPaginationRequest<T>`; responses use `Paginator.of(pagination, total, dtos)` from `@intelact/common`.

## Database layer

- `DatabaseModule` configures TypeORM `forRootAsync` from `Config.db` (MySQL, `utf8mb4_general_ci`, `autoLoadEntities`, `timezone Z`, `maxQueryExecutionTime 5000`, `innodb_lock_wait_timeout 120`).
- Entities live in the `@driveup/schema` package; business queries live in services or entity helpers.
- Migrations: `src/database/migrations/` (6 files, e.g. training views, notification schedules, alert scheduling, policy can-dismiss).
- Subscribers: `src/database/subscribers/` (12 subscribers registered in `subscriber.module.ts`):
  - `global.subscriber.ts` — sets `createdBy`/`updatedBy`/`deletedBy` from `RequestContext`; drains deferred events after commit via `queryRunner.data`.
  - `bill-item.subscriber.ts` — blocks edits to paid bill items; atomically updates subtotal/free-benefit totals.
  - `training/transaction.subscriber.ts` — dispatches on `TransactionType` (Discount/Payment/Refund) to update training balances and invoices.
  - `company.subscriber.ts` — handles promotion-code submission (agent lookup, credit/gift).
  - `company-instructor.subscriber.ts` — validates invited instructors against active companies, sets default metadata.
  - `instructor.subscriber.ts` — guards `userId` FK changes; updates bill-item titles on instructor name change.
  - `user.subscriber.ts` — propagates language/name changes to Student/Instructor/Agent profiles.
  - `course/*`, `training/*` subscribers — course catalog/schedule defaults, course & driving training billing, appointment endDate/location/status handling (reload pattern to avoid race conditions).

## Schedules

`src/schedules/` (cron jobs):

| Scheduler                       | Cron             | Purpose                                                            |
| ------------------------------- | ---------------- | ------------------------------------------------------------------ |
| `bill.scheduler.ts`             | `0 2 1 * *`      | Monthly company bill creation.                                     |
| `payment.scheduler.ts`          | `0 4 * * *`      | Daily payment processing.                                          |
| `course-end.scheduler.ts`       | `0 0 * * *`      | Daily course-end handling.                                         |
| `notification.scheduler.ts`     | `0 6 * * *`      | Sends system notifications scheduled overnight (see `NotifyService`). |

## Domain events

- `EventsModule` (`src/shared/events/events.module.ts`) registers `EventEmitterModule.forRoot({ wildcard: false, delimiter: '.' })` globally with six submodules: Agent, Auth, Company, Instructor, Student, User.
- Controllers/services emit named events (`this.event$.emit(...)`) and listeners (`src/shared/events/**/*.listener.ts`) react, e.g. notifying users via `NotifyService`, syncing courses via `SyncService`, or recording activities.

## Notification and localization

- `NotifyService` (`src/shared/notification/notify.service.ts`) is the single entry point for SMS/Push/Email. Events map to `EventEntity` (active flag, channel, color); notifications arriving between 00:00–06:00 are queued as `SystemNotificationScheduleEntity` for the 06:00 scheduler to avoid disturbing users at night. Stale push tokens are cleared on FCM rejection.
- `Translate` helper (`src/common/helpers/translate.ts`) resolves notification/preference keys against i18n.
- `LocalizationModule` `UserResolver` sets `process.env.TZ` based on the authenticated user's country so Date handling follows the user locale.

## Common utilities

`src/common/`:

- `helpers/` — `Config`, `CloudHelper` (S3 path builders: `getCompanyPath`, `getCompanyExpensePath`, `getCompanyCourseTopicPath`, `getTicketPath`, `isDeletionAllowed`), `EncryptHelper` (bcrypt hash, AES-256-GCM calendar-token encrypt/decrypt), `Generate` (uuid, randomString, otp, hash), `NormalizeHelper` (address normalization), `PhoneHelper`, `Translate`, handlebars break-lines.
- `pipes/` — `ParamValidationPipe` and entity loader pipes (`CompanyInstructorPipe`, `StudentPipe`, `StudentTrainingTransactionPipe`, `CompanyExpensePipe`, `CompanyInvoicePipe`, `CompanyCoursePipe`, `CompanyCourseLessonPipe`, `CompanyCourseTopicPipe`, `InstructorTaskPipe`, `CountryPipe`, `AgentPipe`, finance pipes `bill`/`expense`/`invoice`/`payment-method`/`priceplan`, system `country.pipe`, support `file-image.pipe`). These load entities by route param, so controllers receive the loaded entity.
- `decorators/` — `auth.decorator.ts`, `pagination.decorator.ts`, `public.decorator.ts`, `response.decorator.ts`, `header.decorator.ts`.

## Conventions for new modules

1. Create the feature folder under `src/modules/` (or `src/shared/` for reusable logic) and wire its `*Module` into `src/app.module.ts`.
2. Controller route prefix matches the client convention (e.g. `company/...`, `instructor/...`, `student/...`, `agent/...`).
3. Guard with `@RolesGuard(...)` and use `@AuthCompany()`/`@AuthInstructor()`/`@AuthAgent()` to obtain the acting profile.
4. Put queries in an injectable service; map entities to DTOs through a `*Mapper` (never inline). Follow existing mapper signatures (`toSimple`, `toModel`, `toModelWithDetails`).
5. Return `IPaginationResponse<T>` via `Paginator.of(...)` for list endpoints.
6. Wrap multi-step writes in `dataSource.transaction(...)`; emit domain events after commit so subscribers/notifications fire reliably.
7. Use `ErrorMessage.*` keys (i18n) for errors and `@ResponseMessage(EventName)` for success messages.
8. File uploads use `FileInterceptor('file')` + `AwsService` with paths from `CloudHelper`; validate `FileHelper.isImage` for images and clean up replaced S3 objects.
