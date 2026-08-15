# DriveUp API

## Overview

**DriveUp API** is the backend service for the DriveUp ecosystem. It is a NestJS (Node.js/TypeScript) application that provides authentication, user/company/instructor/agent/student management, onboarding, training, finance, expenses, courses, notifications, localization, and integration endpoints for the admin, mobile, and portal frontends.

## Repository location

- Submodule: `driveup-api/`
- Remote: `https://github.com/Intelact-Solutions/driveup-api.git`
- Default branch: `develop`

## Knowledge base

Deep implementation references live in the `docs/kb/api/` folder of this KB:

- [`../api/architecture.md`](../api/architecture.md) — application structure, module layout, database layer, schedules, events, notification, and conventions for new modules.
- [`../api/code-map.md`](../api/code-map.md) — endpoint and source-level map across all modules.

## Stack

- NestJS on Node.js, TypeScript, pnpm
- TypeORM with database migrations under `src/database/migrations`
- Scheduled jobs under `src/schedules/`
- External services: Firebase, Geo, Storage, Notification, Localization

## Module layout

Root wiring is in `src/app.module.ts`.

### Core modules (`src/modules/`)

| Module        | Responsibility                                        |
| ------------- | ----------------------------------------------------- |
| `auth`        | Phone/OTP authentication, token refresh               |
| `user`        | User account management, `/user/init`, switch profile |
| `onboarding`  | User and company onboarding, invitations              |
| `company`     | Driving-school company administration                 |
| `instructor`  | Instructor management                                 |
| `agent`       | Sales-agent management                                |
| `student`     | Student management                                    |
| `token`       | Token issuance/refresh                                |
| `ticket`      | Support tickets                                       |
| `ical`        | iCalendar feed for appointments                       |
| `public`      | Public endpoints                                      |

### Shared modules (`src/shared/`)

`alert`, `asset`, `company`, `country`, `course`, `driving`, `events`, `expense`, `external`, `firebase`, `geo`, `health`, `instructor`, `localization`, `notification`, `storage`, `stripe`, `sync`, `training`, `user`, `verification`.

## Architecture notes

- Auth flows: `/auth/countries`, `/auth/status`, `/auth/verify/phone`, `/auth/signin` (OTP-based second factor), `/auth/token/refresh`.
- Companies are multi-profile: a user can hold owner/manager/instructor/agent/student profiles and switch between them via `/user/switch`.
- PDF generation and image processing (sharp) have been moved to the separate **driveup-jobs** API (see CHANGELOG).
- Stripe payment functionality is consumed through the **console-api** service rather than directly (CHANGELOG, "Remove stripe module from driveup-api").

## Versioning

Releases are tagged `1.1.0`, `1.0.0` (beta1 as of 2026-06-01). Changes since the latest release are tracked in `CHANGELOG.md`.
