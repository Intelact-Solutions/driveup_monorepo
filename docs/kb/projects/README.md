# Projects

This directory indexes the DriveUp ecosystem projects covered by the knowledge base. Each file describes the project's stack, repository location, conventions, and where to find deeper documentation.

| Project                | File        | Stack                                     | Deep reference                                                                 |
| ---------------------- | ----------- | ----------------------------------------- | ------------------------------------------------------------------------------ |
| DriveUp Admin          | `admin.md`  | Angular 22 SPA, NgRx, Firebase            | [`architecture.md`](../architecture.md), [`code-map.md`](../code-map.md), [`features/`](../features/DriveUp%20Admin/), [`specs/`](../specs/), [`ui/`](../ui/) |
| DriveUp API            | `api.md`    | NestJS, TypeORM, TypeScript               | [`../api/architecture.md`](../api/architecture.md), [`../api/code-map.md`](../api/code-map.md) |
| DriveUp Mobile         | `mobile.md` | Flutter, BLoC, Freezed, Retrofit          | [`../mobile/architecture.md`](../mobile/architecture.md), [`../mobile/code-map.md`](../mobile/code-map.md) |
| DriveUp Portal         | `portal.md` | Angular 21 SSR, @ngx-translate, Vitest    | [`../portal/architecture.md`](../portal/architecture.md), [`../portal/code-map.md`](../portal/code-map.md) |

Each project has an **architecture** document (structure and engineering conventions) and a **code map** (source-level reference with `file:line` citations), mirroring the Admin knowledge base layout.

## Project relationships

- **DriveUp Admin** (web manager/agent/student/instructor app) and **DriveUp Mobile** (Flutter) are the two main client applications.
- **DriveUp API** (NestJS) is the backend serving the clients.
- **DriveUp Portal** is the public marketing website, separate from the application clients.
- External services: **driveup-jobs** (PDF generation, image processing), **console-api** (admin console actions, Stripe).

## Maintenance

- Project knowledge is generated from the submodule repos. When a project's architecture changes, update its `projects/*.md` file and commit in the monorepo.
- The `features/` and `specs/user-stories/generated/` content under the KB root is generated from Zephyr Scale and Jira exports — do not edit generated files directly; see [`../README.md`](../README.md).
