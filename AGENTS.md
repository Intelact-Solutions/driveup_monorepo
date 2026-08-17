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