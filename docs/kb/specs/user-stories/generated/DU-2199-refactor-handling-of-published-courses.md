# Refactor handling of published courses

- **Jira:** [DU-2199](https://intelact.atlassian.net/browse/DU-2199)
- **Platform:** 🌐 Web
- **Component:** manager_dU, web-dU
- **Status:** To Do
- **Parent epic:** DU-365
- **Coverage:** 4/12 scenario(s) present in `features/`

> Refactor handling of published courses

## Scenarios

- Likely covered (rephrased): New part can't be added to published course
- Likely covered (rephrased): Part can't be removed from published course
- NOT in features/: Order of parts can't be changed for published course
- Likely covered (rephrased): Course name and part name are editable for published courses
- NOT in features/: User can't change date and time of past fixed course part
- NOT in features/: User can change date and time of upcoming fixed course part
- NOT in features/: User can't change date and time of past flexible course appointment
- NOT in features/: User can't update course category after course is published
- NOT in features/: User can change date and time of upcoming flexible course appointment
- Likely covered (rephrased): User can always change assigned instructor of a course part/appointment
- NOT in features/: General course data can be edited at any time
- NOT in features/: User can't add a course part which has an earlier date and time as the previous part

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
