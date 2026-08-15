# Show full list of driving trainings/students

- **Jira:** [DU-2142](https://intelact.atlassian.net/browse/DU-2142)
- **Platform:** 📱 Mobile
- **Component:** instructor_dU, mobile-dU
- **Status:** Done
- **Parent epic:** DU-105
- **Coverage:** 1/4 scenario(s) present in `features/`

> Show full list of driving trainings/students

## Scenarios

- NOT in features/: Default list of training shows only own students
- Likely covered (rephrased): Instructor can view list of all trainings in the driving school
- NOT in features/: Instructor can view and edit any training
- NOT in features/: Instructor has no permission to edit payments registered by others

## Description

Current state:
- list of driving trainings shows only trainings, where the authenticated user is assigned as in-charge instructor
- instructor can’t see other driving trainings in the company and can’t edit them
New implementation:
- each instructor can see all driving trainings in the company
- by default, list is filtered to show only own trainings
- filter can be deactivated

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
