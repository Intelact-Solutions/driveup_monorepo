# AGENTS.md

## Learnings

### Role semantics: "Manager" is an `InstructorRole`, not the `company` module

When asked whether a driving-school **manager** can do something in the mobile app
(`driveup-mobile`), do NOT assume "manager" maps to the `lib/company/` module. That
module only contains onboarding + driving-category screens and has no calendar or
team features.

The driving-school owner/manager is modeled as an **instructor with an elevated
role** — `InstructorRole` (`lib/shared/features/profile/data/data_provider/profile_model.dart:249-266`),
where `isManager` is true for `owner` and `manager`. All manager behavior therefore
lives inside `lib/instructor/`, gated by `role!.isManager`.

Rule of thumb: search for `isManager` across `lib/instructor/` before concluding a
manager capability exists or not.

### Don't anchor on a single code path

Appointment creation in `lib/instructor/features/calendar/` has multiple entry
points. The auto-open path uses `instructor: myInstructorProfile`
(`calendar_page.dart:200`), but the FAB and cell-tap paths resolve
`instructor: state.instructor ?? myInstructorProfile` (`calendar_page.dart:1437-1439`,
`1809-1811`) — so a manager viewing a **colleague's** calendar (selected via the
"Select colleague calendar" drawer, `calendar/presentation/drawer.dart:111`) can add
appointments/sessions/tasks to that team member. Non-managers are blocked
(`calendar_page.dart:1421-1426`).

When a feature has a nullable "viewed entity" (e.g. `state.instructor != null`),
check whether the write path falls back to the viewed entity instead of the logged-in
user — that's often where cross-entity capabilities hide.

### Maestro E2E reports: always a single combined report

Maestro only runs flows at the top level of the directory you point it at — it does
NOT recurse. To run the whole suite, run each group folder separately, e.g. from
`driveup-mobile/maestro`:

```
maestro test flows/1.authentication --format junit --output reports/auth-junit.xml
maestro test flows/2.legal        --format junit --output reports/legal-junit.xml
maestro test flows/3.company      --format junit --output reports/company-junit.xml
maestro test flows/4.driving      --format junit --output reports/driving-junit.xml
```

Then consolidate into a single report with `driveup-mobile/maestro/merge_reports.ps1`
(PowerShell, no dependencies):

```
powershell -NoProfile -ExecutionPolicy Bypass -File merge_reports.ps1
```

The script scans `reports/*-junit.xml` (any number of groups, not just the four
above), maps the file name to a group label (`auth`→`1. Authentication`, etc., with
fallback to the file name), writes the combined Bootstrap HTML to
`reports/maestro_report.html`, and deletes every other `*.xml`/`*.html` in
`reports/`. So `reports/` always ends up containing exactly one report —
`maestro_report.html` — regardless of how many flows/folders were executed.

Note: because it deletes source junit files, always run the merge AFTER the last
group run; re-running it later without fresh junit files errors out with
"No *-junit.xml reports found".