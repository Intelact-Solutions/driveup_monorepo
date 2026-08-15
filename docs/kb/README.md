# DriveUp Knowledge Base

This directory is the repository mirror of the DriveUp product knowledge for the whole monorepo. Zephyr Scale Cloud remains the source of truth for BDD scenarios. The KB lives at the monorepo root so it can cover all four projects (admin, api, mobile, portal).

## Contents

- `projects/` indexes the DriveUp ecosystem projects. Each project file (`admin.md`, `api.md`, `mobile.md`, `portal.md`) describes the stack, repository location, conventions, and where deeper docs live.
- `api/` holds deep implementation references for DriveUp API: `architecture.md` and `code-map.md`.
- `mobile/` holds deep implementation references for DriveUp Mobile: `architecture.md` and `code-map.md`.
- `portal/` holds deep implementation references for DriveUp Portal: `architecture.md` and `code-map.md`.
- `architecture.md` documents the current application structure and engineering conventions for DriveUp Admin.
- `code-map.md` maps implemented routes, components, services, state, and API endpoints across the app.
- `features/` contains generated Gherkin feature files grouped by the Zephyr Scale folder hierarchy:
  - `features/DriveUp Admin/` — generated from `source/zephyr.xml` (web app).
  - `features/Mobile/` — generated from `source/zephyr_mobile.xml` (mobile app).
- `source/zephyr.xml` is the manually exported Zephyr Scale XML file used to generate `features/DriveUp Admin/`.
- `source/zephyr_mobile.xml` is the manually exported Zephyr Scale XML file used to generate `features/Mobile/`.
- `specs/` is for supporting product requirements and other source documents.
  - `specs/user-stories/Jira.xml` is the raw Jira export (Issue type: Story) of the `driveUp DevOps` project.
  - `specs/user-stories/generated/` contains one Markdown page per Jira user story not fully covered by `features/`, with scenario headings and full descriptions.
- `ui/` is for page and flow screenshots. Name files after the relevant page or feature, such as `student-dashboard.png`.

## Projects

| Project        | File                | Stack                                   | Deep reference                         |
| -------------- | ------------------- | --------------------------------------- | -------------------------------------- |
| DriveUp Admin  | `projects/admin.md` | Angular 22 SPA, NgRx, Firebase          | root `architecture.md` + `code-map.md` |
| DriveUp API    | `projects/api.md`   | NestJS, TypeORM, TypeScript             | `api/architecture.md` + `api/code-map.md` |
| DriveUp Mobile | `projects/mobile.md`| Flutter, BLoC, Freezed, Retrofit        | `mobile/architecture.md` + `mobile/code-map.md` |
| DriveUp Portal | `projects/portal.md`| Angular 21 SSR, @ngx-translate, Vitest  | `portal/architecture.md` + `portal/code-map.md` |

See [`projects/README.md`](projects/README.md) for the full index and maintenance notes.

## Jira user stories

The Jira export at `specs/user-stories/Jira.xml` captures 559 stories. Gherkin headings live in each story's `description`; some stories are purely prose/technical (no `Scenario:` headings).

Every story that is **not fully covered** by `features/` is mirrored as a Markdown file under `specs/user-stories/generated/`. Each file lists its scenarios and flags coverage against `features/DriveUp Admin`:

- **Covered in features/** – scenario exists (near-identical title) in a `.feature` file.
- **Likely covered (rephrased)** – fuzzy title match suggests it is captured under slightly different wording; verify against the linked feature.
- **NOT in features/** – no Gherkin scenario covers it; treat as new knowledge.

Each file also carries a **Platform** tag (📱 Mobile / 🌐 Web / API / Infrastructure) derived from the Jira `component` field, so questions about the mobile or web app can be answered precisely. The `README.md` index in `generated/` groups stories both by epic and by platform.

To refresh these pages after a new Jira export, update `Jira.xml` and re-run the generation script. The matching is title-based; `NOT in features/` flags should be reviewed manually before being relied on.

## Refresh Zephyr scenarios

1. In Zephyr Scale Cloud, open the Test Case Library and select the BDD test cases to mirror.
2. Select **More** > **Export to XML**.
3. Replace `source/zephyr.xml` (admin) or `source/zephyr_mobile.xml` (mobile) with the downloaded file. The XML must include each test case's name, folder path, and BDD/Gherkin test script.
4. Run the sync script from the monorepo root. Each run rebuilds only its own output tree, so run both when either export changes:

   ```bash
   # Admin (rebuilds docs/kb/features/DriveUp Admin)
   node driveup-admin/scripts/sync-zephyr.mjs --input docs/kb/source/zephyr.xml --output docs/kb/features

   # Mobile (rebuilds docs/kb/features/Mobile)
   node driveup-admin/scripts/sync-zephyr.mjs --input docs/kb/source/zephyr_mobile.xml --output docs/kb/features_mobile
   ```

   The second command writes to a temporary folder because the script wipes its output before regenerating; after it finishes, move the `Mobile/` folder into `docs/kb/features/` so both platforms stay under one tree.

   > Note: the script needs `fast-xml-parser`. It is a dependency of the `driveup-admin` package, so install it there (`pnpm install`) before running.

5. Review the generated files under `features/` and commit the source XML export and generated feature files together when they can be shared in the repository.

The sync commands rebuild their `features/` output completely. Do not manually edit files there; make scenario changes in Zephyr and export again. Put any repository-only notes in `specs/` instead.

## Using this knowledge base

After restarting OpenCode, ask `@knowledge` questions such as:

```text
@knowledge How does company onboarding work?
```

For feature work, ask the build agent to consult `@zephyr` before it proposes or implements a change.
