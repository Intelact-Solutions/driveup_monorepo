# Implement "No admin fee" switcher in mobile

- **Jira:** [DU-2147](https://intelact.atlassian.net/browse/DU-2147)
- **Platform:** 📱 Mobile
- **Component:** instructor_dU, mobile-dU
- **Status:** Done
- **Parent epic:** DU-108
- **Coverage:** 0/1 scenario(s) present in `features/`

> Implement "No admin fee" switcher in mobile

## Scenarios

- NOT in features/: User can skip admin fee for a student

## Description

Current implementation
- A user can add an administration fee to a training
- If user wants to exclude this for a student, the only possibility to do it is on the web
- Most admins and instructors use the mobile
New implementation
- Implement a toggler in the Overview tab of the driving trainings
- Name of the toggler is “No admin fee” (de: “Keine Verwaltungsgebühr”, fr: “Aucuns frais administratifs“ , it: “Nessuna spesa amministrativa“ )

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
