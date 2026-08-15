# DriveUp Admin Architecture

## Purpose

DriveUp Admin is an Angular 22 standalone-component SPA for driving-school management. It is built with Angular Material, SCSS, NgRx, Firebase integration, and `@ngx-translate`.

## Application entry points and routing

The root route configuration is `src/app/app.routes.ts`. Feature areas are lazy-loaded and role-protected:

| Route                | Access                      | Area                     |
| -------------------- | --------------------------- | ------------------------ |
| `/auth`              | Public                      | Authentication flows     |
| `/company`           | Authenticated company users | Company profile          |
| `/agent`             | Authenticated agent users   | Agent profile            |
| `/student`           | Authenticated students      | Student profile          |
| `/instructor`        | Authenticated instructors   | Instructor profile       |
| `/account`           | Authenticated users         | Account management       |
| `/account/overdated` | Authenticated users         | Expired-account recovery |
| `/onboarding`        | Authenticated users         | Onboarding flow          |
| `/blocked`           | Authenticated users         | Blocked-account page     |
| `/error`             | Public                      | Error page               |

Role routes use `authGuard` plus the appropriate role guard (`companyGuard`, `agentGuard`, `studentGuard`, or `instructorGuard`). Do not add a role-specific feature outside its profile area without updating the lazy route and relevant guard behavior.

## Source layout

| Directory          | Responsibility                                                                                                                                             |
| ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `src/app/core/`    | Cross-cutting infrastructure: guards, interceptors, models, services, store, resolvers, validators, utilities, directives, pipes, configs, and animations. |
| `src/app/shared/`  | Reusable business-domain components for account, billing, calendar, course, driving, finance, instructor, student, team, trainings, and shared UI.         |
| `src/app/profile/` | Role-specific feature areas: `agent`, `company`, `instructor`, and `student`.                                                                              |
| `src/app/user/`    | Cross-role user flows: authentication, account management, blocked accounts, onboarding, and expired accounts.                                             |
| `src/app/error/`   | Error presentation.                                                                                                                                        |
| `public/i18n/`     | Locale JSON files for `de`, `en`, `fr`, and `it`.                                                                                                          |
| `public/styles/`   | Global foundation, Material, UI, and utility styles and design tokens.                                                                                     |

## UI and Angular conventions

- Components are standalone and normally use the `du` selector prefix.
- New components default to SCSS and `OnPush` change detection, per `angular.json`.
- Keep components focused and reuse `src/app/shared/ui/` or domain shared components before creating new UI.
- Keep styles component-scoped where possible. Reuse CSS variables and existing design tokens rather than introducing broad global overrides.
- Use typed inputs and outputs. Follow local signal and reactive-state patterns where they already exist.

## State and data flow

- NgRx state is organized under `src/app/core/store/` by domain, using actions, effects, reducers, selectors, and barrel exports.
- Backend integration is Firebase-based through `@angular/fire` and the project's services/interceptors.
- Lazy routes define the feature boundary. Place route-specific orchestration in the feature area; keep reusable domain behavior in `core` or `shared` as appropriate.

## Internationalization

Translation files under `public/i18n/` must stay consistent across German, English, French, and Italian. When adding a key, update every required locale in that same change. Content in each file must be written in that file's language.

## Knowledge-base maintenance

This document describes the implementation structure, while `features/` holds the product behavior mirrored from Zephyr Scale. When a feature is changed, review both its Gherkin scenario and this document if the route, domain ownership, state flow, or shared-component boundary changed.
