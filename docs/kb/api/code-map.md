# DriveUp API Code Map

## Purpose

Source-code reference for the DriveUp backend (`driveup-api/`). It describes the implemented NestJS API, not product requirements. Endpoint and behavior details come straight from the controllers/services; when this document disagrees with product specs, treat it as an implementation reference and flag the discrepancy.

## Architecture

- NestJS app rooted at `src/main.ts`; feature modules under `src/modules/`, shared logic under `src/shared/`, cross-cutting code under `src/common/`.
- Database: TypeORM + MySQL. Entities come from `@driveup/schema`; request/response DTOs from `@intelact/driveup`; shared primitives from `@intelact/common`.
- Controllers delegate to services and map results through static `*Mapper` classes. Almost every "load/list" endpoint returns a paginated `IPaginationResponse<T>` built with `Paginator.of(...)`.
- Domain events are emitted with `EventEmitter2`; global config in `src/shared/events/events.module.ts`.
- Auth details: see `docs/kb/api/architecture.md` (guards, decorators, interceptors, pipes).

## Authentication and account lifecycle

### Public OTP sign-in/sign-up (`src/modules/auth/controllers/sign.controller.ts`)

| Route                 | Guard     | Behavior                                                                                                       |
| --------------------- | --------- | -------------------------------------------------------------------------------------------------------------- |
| `POST auth/signin`    | Public    | Verifies OTP (`PhoneVerificationService.confirmByPhoneAndCountAttempt`), loads user by phone, restores device/profile selection, emits `AuthEvents.SigninPhone`, returns `IToken`. |
| `POST auth/signup`    | Public    | Requires an existing verification token for the phone, rejects existing users, resolves country + language, creates the user (event fired by `UserService`), registers device, returns token. |
| `GET auth/countries`  | Public    | Loads countries, marks the IP-inferred country (fallback `CH`) as `selected`.                                  |
| `GET auth/languages/:id` | Public | Lists country languages with translated titles and flag URLs (`Config.assetsUrl/flags/{lang}.png`).           |
| `POST auth/status`    | Public    | Returns `leftOTPs`, `leftAttempts`, `oldestOTP`, `blockedOn` for a phone (drives OTP resend/block UX).        |

### Verification (`src/modules/auth/controllers/verify.controller.ts`)

- `POST auth/verify/phone` — sends OTP via `PhoneVerificationService.generateForPhone`, enforces `Config.auth.otpMaxAttempts`, emits `VerifyEvents.VerifyPhone`. In non-production it returns `true` without sending SMS.
- `PUT auth/verify/phone` — returns whether a user account exists for the phone (`phoneExists`).
- `POST auth/verify/email` — sends an email OTP (`generateForEmail`), emits `VerifyEvents.VerifyEmail`.

### Biometric sign-in (`src/modules/auth/controllers/biometric.controller.ts`)

- `POST auth/biometric` — looks up the device by the biometric token, restores the user's selected profile (or selects next active), emits `AuthEvents.SigninBiometric`, returns `IToken`.

### Account recovery (`src/modules/auth/controllers/recovery.controller.ts`)

- `POST auth/recovery` — verifies the email matches the authenticated user's email and that the account activity is overdated, sends an email verification, emits `UserAccountEvents.RecoveryVerify`.
- `PUT auth/recovery` — confirms the email OTP, updates the user's activity (`authUser.updateActivity()`), emits `UserAccountEvents.Recovered`.
- `DELETE auth/recovery` — suspends an overdated account (`auth$.suspendAccount`), emits `UserAccountEvents.Suspended`.

### App info (`src/modules/auth/controllers/info.controller.ts`, deprecated)

- `GET auth/info` — app metadata from `Config`; `GET auth/info/:version/supported` — compares against `Config.lastSupportedVersion`. Marked deprecated in favor of `GET /info` in `src/app.controller.ts`.

### Auth internals

- `src/modules/auth/services/auth.service.ts` — user lookup, device registration/update, account suspension.
- `src/modules/auth/services/jwt.strategy.ts` — Passport JWT strategy.
- `src/modules/auth/auth.config.ts` — `IS_PUBLIC`, `META_ROLES` metadata keys.
- Guards: `auth.guard.ts` (bearer verification + profile/company status checks) and `roles.guard.ts` (profile-role enforcement).

## Token (`src/modules/token`)

- `POST token/validate` / `POST token/refresh` — JWT validation/refresh. Tokens carry `{ id, guid, name, profileType, profileId }`, 30-day expiry.
- `TokenService.generate` is used throughout profile activation/switch/close flows to return a new `IToken` after the selected profile changes.

## User module (`src/modules/user`)

Owns account/profile management: `/user/init`, profile switching, name/language/phone/email/image updates, devices, alerts, notifications, and preferences. `UserService` (`src/shared/user/user.service.ts`) is the shared service used across modules (create, getByPhone, getById, save, delete, `setStatusType`, `canDeleteAccount`). `StudentService` (`src/shared/user/student.service.ts`) handles student creation and training-in-company checks.

## Onboarding (`src/modules/onboarding`)

Seven controllers, eight services. Flow coverage:

- User profile create/complete/activate.
- Company profile steps (name, logo, address, bank info, products/services, promotion, complete), plus `PUT /onboarding/promotion/{id}`.
- Agent profile create/activate/close.
- Student profile create/complete.
- Company invitations: `POST`/`DELETE /onboarding/invitation/{companyId}` accept/reject.
- Uses `@driveup/shared` profile events (`UserAccountEvents`, `CompanyProfileEvents`, `AgentAccountEvents`, `StudentAccountEvents`) for responses and event emission.

## Company module (`src/modules/company`)

### Profile (`profile/profile.controller.ts`)

`@Controller('company/profile')`. All `PUT`s map through `CompanyProfileService` and emit `CompanyProfileEvents.*`:

| Route                      | Roles             | Purpose                                                |
| -------------------------- | ----------------- | ------------------------------------------------------ |
| `GET pickup`               | Owner/Manager/Instructor | Company pickup locations.                        |
| `PUT name`                 | Owner             | Company name change.                                   |
| `PUT description`          | Owner/Manager     | Description.                                           |
| `PUT address`              | Owner/Manager     | Validates address/place/zip required.                  |
| `PUT pickup`               | Owner/Manager/Instructor | Replace pickup locations.                      |
| `PUT bank` / `PUT iban` / `PUT taxid` | Owner/Manager | Bank info; `submitIBAN`, `submitTaxID`.    |
| `PUT homepage` / `phone` / `email` / `socials` | Owner/Manager | Contact/profile fields.      |
| `PUT language`             | Owner             | Validates against `country.isLanguageSupported`.       |
| `POST logo` / `DELETE logo`| Owner/Manager     | S3 logo upload/delete (validates image, replaces old object). |
| `PUT obligation`           | Owner/Manager     | Reschedule-protection period.                          |
| `PUT holidays`             | Owner/Manager     | Company holidays.                                      |
| `PUT working`              | Owner/Manager     | Working hours; dedupes weekdays and merges overlapping periods. |
| `GET dependencies`         | Owner/Manager     | `CompanyCloseProfileDependency` (in-progress driving/course trainings). |
| `PUT close` (and `PUT :companyId/close`) | Owner | OTP-verified company closure: closes all instructor profiles, resets selected profile, returns new token. |

### Team (`team/team.controller.ts`, `team/team.service.ts`)

`@Controller('company/team')`, `@RolesGuard(Role.Owner, Role.Manager)` (list endpoints also allow `Role.Instructor`):

- `GET` — instructors filtered by `InstructorFilterDto` (phrase/statuses).
- `GET busy` — per-instructor `busy` flag for a `Period` (`isInstructorBusy` checks driving/fixed/flexible appointments and tasks).
- `GET course` — instructors assigned to active preparation courses (in-charge + part + schedule + exception instructors).
- `GET pending` — instructors with pending payments/expenses (raw SQL over `student_training_transactions`).
- `GET activity` — instructors with appointments/generated value/expenses in a period.
- `GET monthly-report` — instructors active in a month with activity (feeds monthly activity report).
- `GET :id` — full instructor model with trainings.
- `POST` — invite (phone-country check, role `Manager|Instructor`, reinstate closed profile when possible, create user + `CompanyInstructorEntity` + activity record).
- `PUT :id/revoke` — revoke invitation (hard-delete never-started profile or close started one; deletes orphan user account when eligible).
- `PUT :id/reinstate` — role-restore and set back to `Invited`.
- `PUT :id/role` — role change with guards (no self-change, no owner demotion, active only), records `CompanyInstructorActivityEntity`.
- `PUT owner/:id` — OTP-verified owner transfer (`changeOwner` demotes current owner to Manager).
- `DELETE :id` — full removal flow: blocks if in-charge trainings exist, deletes upcoming tasks, reassigns driving appointments and flexible course definitions/exceptions, closes profile, resets selected profile.
- `GET :instructorId/busy` — busy slots for an instructor (merges driving/fixed/flexible appointments, tasks, non-working hours, off days, holidays via `DateHelper.mergeAppointmentPeriods`).

`team.service.ts` also owns `wasActiveInPeriod` (reconstructs working periods from `CompanyInstructorActivityEntity` Completed/Closed events).

### Business and finance (`business/`)

- `business/business.controller.ts` — `@Controller('company/business')`, Owner/Manager:
  - `GET history` — financial history graph: Payments (driving+course), Expenses, SoldServices (driving admin fee + course price + appointment price) as `[timestamp, amount]` pairs for a `Period`.
  - `GET history/total` — summed totals (`totalPayments`, `totalExpenses`, `totalSoldServices`).
  - `GET flow` — paginated financial flow via `TrainingTransactionMapper.toModelWithDetails` (`CompanyFinancialFlowFilterDto`).
  - `GET appointments` / `GET trainings` — dashboard widgets with month-over-month performance.
  - `GET debts` — total debts widget.
- `business/transaction/online.controller.ts` — `@Controller('company/online')`, Owner/Manager:
  - `GET transactions` — paginated online transactions.
  - `PUT transaction/bulk` — batch approve/cancel driving & course online payments.
  - `PUT transaction/{driving|course}/:paymentId/{approve|cancel}` — single approve/cancel with status/payment-type validation; emits `CompanyTrainingTransactionEvents.OnlineApproved` / `OnlineRejected`.
- `business/debt/debt.controller.ts` — `GET company/student/debts` — paginated students with debts (`TrainingMapper.toModel`).
- `business/invoice/invoice.controller.ts` — `@Controller('company/invoice')`, Owner/Manager:
  - `GET :id/pdf` — PDF invoice via `JobsAPIService.generateReport('invoice', ...)`.
  - `POST` / `PUT :id` — create/update draft invoice (exactly one of driving/course training required).
  - `PUT :id/generate` — validates company requirements + invoice completeness, transitions `Draft → Generated`.
  - `PUT :id/paid` — mark `Generated → Paid`.
  - `DELETE :id` — delete only drafts (keeps a copy for the event payload).
- `business/invoice/invoices.controller.ts` — `GET company/invoices` — paginated invoice list.
- `business/expense/expense.controller.ts` — `@Controller('company/expense')`, Owner/Manager:
  - `POST` — create expense (optional receipt image upload via `FileInterceptor('file')`, `CloudHelper.getCompanyExpensePath`).
  - `PUT :id/approve` / `PUT :id/reject` — only `Pending` expenses; emits `CompanyExpenseEvents.Approved`/`Rejected`.
- `business/expense/expenses.controller.ts` — `GET company/expenses` — paginated expense list.
- `business/expense/category/categories.controller.ts` — `GET company/expense/categories` — expense categories (Owner/Manager/Instructor).
- `business/handover/handover.controller.ts` — `@Controller('company/handover')`, Owner/Manager:
  - `GET pending` — instructors with pending payments/expenses (with totals, sorted by sum desc).
  - `GET :instructorId/items` — all handover finances (payments + expenses mapped to `Finance`).
  - `POST :instructorId` — submit handover (`submitHandover` + `saveHandoverHistory`), removes the Firestore handover record, emits `CompanyHandoverEvents.Submitted`.
- `business/handover/history/history.controller.ts` — `GET company/handover/history/:instructorId` — handover history (`HandoverMapper.toModel`).

### Payments, calendar, reports

- `payment/payment.controller.ts` — `GET company/payments/:companyUid` — company payment history (`CompanyPaymentSearchDto`, `CompanyPaymentMapper.toModel`).
- `calendar/calendar.controller.ts` — `@Controller('company/calendar')`, Owner/Manager: `GET :instructorId` merges Driving, Fixed, Flexible, Canceled, Task, NonWorking, OffDay, and Holiday appointments for a period using `InstructorCalendarFilterDto` type filtering; sorts by start date.
- `report/report.controller.ts` — `@Controller('company/reports')`, Owner/Manager. All PDFs generated by `JobsAPIService.generateReport`:
  - `GET payment/:transactionId` — training payment receipt.
  - `GET monthly-finances` — month payments/refunds/expenses summary PDF.
  - `GET yearly-finances` — 12-month summary PDF.
  - `GET instructor-monthly/:instructorId` — instructor monthly activity report (payments, discounts, refunds, expenses, course/driving sessions).

### Students (`student/`)

- `student/student.controller.ts` — `@Controller('company/students')`, Owner/Manager/Instructor:
  - `GET` — paginated students with trainings (`CompanyStudentMapper.toModelWithTrainings`).
  - `GET driving` — students with in-progress driving trainings.
  - `PUT :id` — update student (transactional): phone change may rebind to a new/existing user account; name/address/birthday propagate to `studentSnapshot` across trainings and bill items; optional image upload with old-object cleanup.
  - `DELETE :id/image` — remove student snapshot image (S3 delete + snapshot update).
- `student/training/training.controller.ts` — per-training student data; `student/reports/reports.controller.ts` — student training reports.

### Courses and driving catalog (`course/`, `driving/`)

- `course/course.controller.ts` — `company/courses` (Owner/Manager) course management.
- `course/fixed/fixed.controller.ts` — `company/courses/fix/:id/students` fixed-course students.
- `course/fixed/part/part.controller.ts` — `company/courses/fix/parts`.
- `course/flexible/flexible.controller.ts` — `company/courses/flex/load`.
- `course/flexible/part/part.controller.ts` — `company/courses/flex/parts`.
- `course/flexible/appointment/appointment.controller.ts` — `company/courses/flex/appointments/:defId/appointments` via `CoursePartDefinitionMapper`.
- `driving/category/category.controller.ts` — `company/driving/categories` (+ `/active` for instructors); uses `SyncService` to keep student-driving course data in sync.
- `driving/topic/topic.controller.ts` — `company/driving/topics` (Owner/Manager): load lessons by category, create/update topics with optional image and skill-title validation, reorder topics, move topic between lessons, delete (deactivate when involved in trainings). Every create/update calls `SyncService.lesson(...)` inside a transaction.

### Trainings (`trainnig/` — note the historical typo)

- `trainnig/trainings.controller.ts` + `trainings.service.ts` — global training search `company/trainings` (pageable).
- `trainnig/finance/transaction.controller.ts` — `GET company/training/finance/:trainingId` (financial flow per training).
- `trainnig/finance/payment.controller.ts` — `POST company/training/finance/payment/:trainingId`, `PUT`/`DELETE` — add/update/delete payments.
- `trainnig/finance/refund.controller.ts` — `POST company/training/finance/refund/:trainingId`, `PUT :id/approve|reject`.
- `trainnig/finance/discount.controller.ts` — `POST company/training/finance/discount/:trainingId`, `PUT :id/approve`.
- `trainnig/driving/training.controller.ts` + `trainings.controller.ts` — `company/driving/training` CRUD + paginated `GET company/driving/trainings` (Owner/Manager).
- `trainnig/driving/session/session.controller.ts` — `company/driving/session` CRUD.
- `trainnig/driving/report/report.controller.ts` — `GET company/driving/training/reports/sheet/:trainingId` (PDF/Excel via `JobsAPIService`).
- `trainnig/course/training.controller.ts` + `trainings.controller.ts` + `appointment/appointment.controller.ts` + `report/report.controller.ts` — course training CRUD, paginated listing, appointments, and reports.

## Instructor module (`src/modules/instructor`)

All controllers are `@RolesGuard(Role.Owner, Role.Manager, Role.Instructor)` unless noted.

### Account

- `account/profile/profile.controller.ts` — `instructor/profile` (profile read, close profile flow with `CompanyInstructorProfileEvents`).
- `account/schedule/schedule.controller.ts` — `GET`/`PUT instructor/schedule/:id` with `WorkingHoursDto`/`Period`.
- `account/holiday/holiday.controller.ts` — `PUT instructor/holidays/:id` (emits `CompanyInstructorProfileEvents.HolidaysScheduleChanged`).

### Business

- `business/business.controller.ts` — `GET instructor/business` — mixed Payments/Expenses/GeneratedValues as `Finance[]`.
- `business/expense/expenses.controller.ts` — `GET instructor/expenses/:instructorId` paginated (`CompanyInstructorPipe`).
- `business/expense/expense.controller.ts` — `POST`/`PUT`/`DELETE instructor/expense` with receipt upload (`FileInterceptor('file')`, `CompanyExpensePipe`).
- `business/handover/handover.controller.ts` — `GET instructor/handover/pending`, `POST` submit.
- `business/handover/history/history.controller.ts` — `GET instructor/handover/history/:instructorId` (`HandoverMapper`).
- `business/handover/firebase/firebase.controller.ts` — `POST instructor/handover/firebase/expense/:expenseId` + payment (Owner/Manager only).
- `business/payment/payment.controller.ts` — `POST instructor/payment/:trainingId`, `PUT :id/:trainingId`, `DELETE`.
- `business/payment/payments.controller.ts` — `GET instructor/payments/:instructorId` paginated (`TrainingTransactionMapper.toModelWithDetails`).

### Calendar / tasks / courses

- `calendar/calendar.controller.ts` — `GET instructor/calendar` — mixes driving, fixed, flexible, and task appointments for the period (`InstructorCalendarFilterDto`).
- `task/task.controller.ts` — `GET instructor/tasks` (Owner/Manager/Instructor), CRUD `instructor/tasks` → `CompanyInstructorTaskMapper`.
- `course/fixed/appointment.controller.ts` — `instructor/courses/fixed/appointment`.
- `course/flexible/appointment.controller.ts` — `instructor/courses/flexible/appointment`.

### Driving

- `driving/training/training.controller.ts` — `instructor/driving/training` CRUD (`CreateDrivingTrainingDto`, file upload).
- `driving/training/trainings.controller.ts` — `GET instructor/driving/trainings` paginated (`InstructorTrainingFilterDto`).
- `driving/session/session.controller.ts` — `instructor/driving/session` large CRUD (file upload, pickup locations, notes).
- `driving/session/sessions.controller.ts` — `GET instructor/driving/sessions/:trainingId` (numbered).
- `driving/history/history.controller.ts` — `GET instructor/driving/history/:trainingId` (reverse numbering).
- `driving/topic/topics.controller.ts` — `GET instructor/driving/topics/:trainingId` (`DrivingTopicMapper.toSimple`).
- `driving/topic/topic.controller.ts` — `PUT instructor/driving/topic/:appointmentId/:topicId/:skillId/score`.
- `driving/exam/exam.controller.ts` — `PUT instructor/driving/exam/:id/status` (emits `CompanyTrainingExamEvents.Passed`).
- `driving/exam/topic/topics.controller.ts` — `GET instructor/driving/exam/topics/:examId`.
- `driving/exam/topic/topic.controller.ts` — `PUT instructor/driving/exam/topic/:examId/:topicId`.
- `driving/assessment/assessment.controller.ts` — `GET instructor/driving/assessment/:trainingId` (+ `/topics`).
- `driving/finance/finance.controller.ts` — `GET instructor/driving/finances/:trainingId`.
- `driving/finance/payment/payment.controller.ts` — `instructor/driving/payment` POST/PUT/DELETE.

## Student module (`src/modules/student`)

All controllers are `@RolesGuard(Role.Student)`.

- `home/home.controller.ts` — `GET student/home` — merges driving + course trainings (`TrainingMapper.toModelWithDetails`).
- `profile/profile.controller.ts` — `PUT student/profile/activate`.
- `course/training/training.controller.ts` — `GET student/course/training/:id`, `PUT :id/rating`.
- `course/part/parts.controller.ts` — `GET student/course/parts/:trainingId` (fixed sorted by startDate, flexible by sort).
- `course/appointment/appointment.controller.ts` — `GET student/course/appointments/:courseId` (flexible courses).
- `course/finance/finance.controller.ts` — `GET student/course/finances/:trainingId`.
- `driving/training/training.controller.ts` — `GET student/driving/training/:id`, `GET :id/topics`, `PUT :id/rating`.
- `driving/session/sessions.controller.ts` — `GET student/driving/sessions/:trainingId`.
- `driving/session/session.controller.ts` — `POST student/driving/session/:trainingId` register with `DateDto` (emits `StudentTrainingAppointmentEvents.Registered`), `PUT`/`DELETE`.
- `driving/history/history.controller.ts` — `GET student/driving/history/:id`.
- `driving/calendar/calendar.controller.ts` — `GET student/driving/calendar/:trainingId`.
- `driving/assessment/assessment.controller.ts` — `GET student/driving/assessment/:trainingId` (+ `/topics`).
- `driving/finance/finance.controller.ts` — `GET student/driving/finances/:trainingId` (filters Payment/Refund by `TransactionType`).

## Agent module (`src/modules/agent`)

All controllers are `@RolesGuard(Role.Agent)`.

- `clients/clients.controller.ts` — `GET agent/clients` and `GET agent/clients/paginated` — companies that used the agent's promotion code (`AgentClientsFilterDto`; SQL includes `location`, `endDate`, `totalEarning`).
- `asset/assets.controller.ts` — `GET agent/assets` — agent's marketing assets.
- `code/codes.controller.ts` — `GET agent/codes` — returns `[agent.code]`.
- `profile/profile.controller.ts` — `PUT agent/profile/activate` (re-activate closed agent profile, new token) and `PUT agent/profile/close` (close profile, select next active profile, new token).
- `finance/controller/finance.controller.ts` — `GET agent/finances` (stub), `PUT agent/finances/bank` (`BankAccount` validation), `DELETE agent/finances/bank`.
- `finance/controller/earnings.controller.ts` — `GET agent/earnings` — per-promotion earnings series.
- `finance/controller/payouts.controller.ts` — `GET agent/payouts` and `GET agent/payouts/total` (pending/paid totals — currently stubbed to 0).

### Agent assets seeding (`shared/asset/agent.service.ts`)

`AgentAssetService.seed` copies country-scoped `SeedAssetEntity` promotions into `AgentAssetEntity`; `customize` re-renders `hasAgentCode` image assets by calling `JobsAPIService.generateAgentAsset` (QR code + code overlay) and re-uploading to S3.

## Ticket module (`src/modules/ticket`)

- `POST ticket` — create support ticket (optional file upload via `CloudHelper.getTicketPath`, emits `TicketEvents.Created`).
- `GET ticket` — paginated tickets for the authenticated user (`TicketFilterDto`; loads Pending/Progress tickets).
- `ticket.service.ts` stores tickets with `title: dto.type` (noted as a TODO in source).

## Public module (`src/modules/public`)

- `GET geoinfo`, `GET features`, `GET testimonials`, `POST contact-us` (Recaptcha Enterprise/Site verification), `POST contact-sales`, price plans (`SystemPricePlanMapper`, MVP-only driving car note in `public.service.ts`), articles/common questions (`JSON_SEARCH`).
- `public.service.ts` also loads testimonials and common questions; `GET /` and `GET /info` are in `src/app.controller.ts`.

## iCal module (`src/modules/ical`)

- `GET ical/:token` — `@IsPublic()`; token encrypted with `EncryptHelper` (AES-256-GCM, `CALENDAR_TOKEN_SECRET`). Builds an ICS feed via `ics.createEvents` covering driving/fixed/flexible/task appointments with uid prefixes `driving-`/`fixed-`/`flexible-`/`task-`, 3 months back / 6 months forward, tombstone retention 30 days, busy flag from `ical.public`.
- `ical.service.ts` — create/load/save `ICalEntity` and `loadAppointments`.

## Shared modules (`src/shared/`)

### Course (`shared/course/`)

- `fixed-appointment.mapper.ts` — `toSimple`/`toModel`/`toModelWithDetails` for fixed course schedules (`takenSeats`, `presentStudents`, remaining seats).
- `flexible-appointment.mapper.ts` — flexible schedule appointments with `CoursePartDefinitionMapper` definition, seats, students.
- `part.mapper.ts` — `CoursePartMapper.toModel` (with `hasUpcomingAppointments` for flexible parts).
- Also `course.mapper.ts`, `student-appointment.mapper.ts`, `appointment-student.mapper.ts`.

### Driving (`shared/driving/`)

- `session.mapper.ts` — `DrivingSessionMapper.toSimple/toAppointmentModel/toAppointmentModelWithTopics/toModel/toModelWithTopics`; computes `hoursBeforeObligationPeriod` from the company's obligation period; sorts session topics by lesson/topic sort.
- `topic.mapper.ts` — `DrivingSessionTopicMapper`, `DrivingExamTopicMapper`; `exam.mapper.ts` — `DrivingExamMapper`; `assessment.mapper.ts`.

### Training (`shared/training/`)

- `training.mapper.ts` — `TrainingMapper.toModel` / `toModelWithDetails` (driving vs course branches; balances, costs, activities, license, next appointment, parts/attendance).
- `transaction.service.ts` — `TrainingTransactionService`: `load` (type/date/sort filters), `addPayment/addDiscount/addRefund` (approved on save), `approve`, `cancel` (creates a `Cancelation` reference transaction).
- `transaction.mapper.ts` — `TrainingTransactionMapper.toModel` / `toModelWithDetails` (financial flow DTOs).
- `shared-training.service.ts` — cross-module training queries (e.g. `getDrivingTrainingById`, `getCourseTrainingById` used by invoice flow).
- `appointment.service.ts` — appointment helpers.

### Expense / Company / Instructor / User / Notification / Verification

- `expense/expense.mapper.ts` — `ExpenseMapper.toModel`, `toFinance`, `toCategory`.
- `company/` — `CompanyMapper`, `CompanyService` (`getById`, `getByStripeCustomerId`, `getHolidays`, `getEmptyWorkingHours`), `CompanyBillingService` (`createTrainingBillItem`, free/pay-as-you-use plans, billing-policy evaluation, Stripe integration, bill close/create), `invoice.mapper.ts`, `handover.mapper.ts`, `student.mapper.ts`.
- `instructor/instructor.mapper.ts` — `CompanyInstructorMapper` (`toSimple`, `toModel`, `toModelWithDetails`, `toModelWithTrainings`); `instructor.service.ts` — appointment/busy-slots/tasks/generated-value/expense queries used by company team/calendar and instructor modules.
- `user/` — `UserService`, `StudentService`, mappers.
- `notification/` — `NotifyService` (SMS/Push/Email orchestration, night-hours queuing), channel services (`sms`, `push`, `email`), `recaptcha-enterprise.service.ts` / `recaptcha-site.service.ts`, `notify.context.ts` / `email.context.ts`.
- `verification/` — `PhoneVerificationService` (OTP generation, attempt counting, `blockedOn`), `EmailVerificationService`.

### Alert policies (`shared/alert/policies/`)

Evaluator-based user-alert management: `base-policy-evaluator.ts`, `policy-evaluator.interface.ts`, `policy-evaluator.factory.ts`, `policy-evaluation.scheduler.ts`, and concrete policies (`missing-training-rating`, `missing-recovery-email`, `low-training-engagement`, `unpaid-invoices`, `push-notification-disabled`). `SharedUserAlertService` (`alert.service.ts`) is the public API for creating/deactivating rating and recovery-email alerts.

### Events (`shared/events/`)

Listeners organized per domain (`agent/`, `auth/`, `company/`, `instructor/`, `student/`, `user/`) — e.g. `user/ticket.listener.ts`, `user/profile.listener.ts`, `user/notification.listener.ts`, `user/device.listener.ts`, `user/alert.listener.ts`, `user/account.listener.ts`, `agent/promotion.listener.ts`, `agent/profile.listener.ts`.

### External / Storage / Sync / Stripe / Geo / Firebase / Health / Localization

- `external/jobs-api.service.ts` — client for driveup-jobs (`generateReport`, `generateAgentAsset`).
- `storage/aws.service.ts` — `AwsService`: `uploadFile`, `uploadBuffer`, `extractKeyFromUrl`, `fileExists`, `delete`.
- `sync/sync.service.ts` — transactional `SyncService.course/lesson` sync with `SeedCourseEntity`.
- `stripe/stripe.service.ts` — `StripeService`: `createOffSessionPayment`, payment intents, event emission; `Config.stripe`.
- `geo/geo.service.ts` — IP geolocation used by `GET auth/countries`.
- `firebase/firebase.service.ts` — FCM/messaging.
- `health/health.controller.ts` — `GET health` (TypeORM ping).
- `localization/user.resolver.ts` — sets `process.env.TZ` per user country.

## Database subscribers (`src/database/subscribers/`)

Registered in `subscriber.module.ts`. See `docs/kb/api/architecture.md` for the full list and responsibilities. Highlights:

- `training/transaction.subscriber.ts` — after insert/update dispatches by `TransactionType` to update balances, invoices, and throw domain errors.
- `training/course.subscriber.ts` — course-training billing on insert (company status check, `CompanyBillingService`).
- `training/driving.subscriber.ts` — driving-training billing, pickup-location sync, `SyncService` course sync, event emission.
- `training/driving.appointment.subscriber.ts` — reload-to-avoid-race-condition on appointment endDate/location/status changes.
- `course/course.schedule.subscriber.ts` — defaults arrays and prunes schedules on EndDate change.
- `company.subscriber.ts` — promotion-code submission handling.

## Cross-cutting notes for contributors

- Route-path typos that are part of the public API surface should be preserved: `trainnig` (company trainings), `customer`-style legacy aliases if present.
- Money is handled as decimal values on transactions and computed in mappers/subscribers; prefer adding a subscriber or service change over adding logic to a controller.
- When introducing a new finance/transaction type, extend `training/transaction.subscriber.ts` dispatch and the relevant mappers (`TrainingTransactionMapper`, `ExpenseMapper`).
