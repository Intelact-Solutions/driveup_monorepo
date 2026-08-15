# DriveUp Admin

## Overview

**DriveUp Admin** is the web management application for driving-school operations. It is an Angular 22 standalone-component SPA built with Angular Material, SCSS, NgRx, Firebase integration, and `@ngx-translate`.

It serves four profile areas (company, agent, student, instructor) and supports user onboarding, invitations, authentication, account management, and role-guarded feature areas.

## Repository location

- Submodule: `driveup-admin/`
- Remote: `https://github.com/Intelact-Solutions/driveup-admin.git`
- Default branch: `develop`

## Knowledge base

The `docs/kb/` knowledge base in this monorepo was originally authored for DriveUp Admin. The following sections cover it in detail:

- [`architecture.md`](../architecture.md) — application structure and engineering conventions.
- [`code-map.md`](../code-map.md) — maps implemented routes, components, services, state, and API endpoints with `src/...:line` references.
- [`features/`](../features/DriveUp%20Admin/) — generated Gherkin feature files grouped by the Zephyr Scale folder hierarchy (product behavior).
- [`specs/`](../specs/) — supporting product requirements and Jira user-story mirror.
- [`ui/`](../ui/) — page and flow screenshots.

## Stack

- Angular 22, standalone components, `OnPush` change detection, `du` component prefix
- NgRx (global state under `src/app/core/store/`), Angular signals / `rxResource` for newer domains
- Firebase via `@angular/fire`; backend integration through `@intelact/driveup` and `@intelact/common`
- Localization in `public/i18n/` (de, en, fr, it)

## Key entry points

- Root routes: `src/app/app.routes.ts`
- Feature areas: `src/app/profile/` (agent, company, instructor, student), cross-role flows in `src/app/user/`
- Guards: `authGuard` plus role guards (`companyGuard`, `agentGuard`, `studentGuard`, `instructorGuard`)
- Bootstrap: `AppBootstrapService` routes by `User.status` and `selectedProfile` after `/user/init`
