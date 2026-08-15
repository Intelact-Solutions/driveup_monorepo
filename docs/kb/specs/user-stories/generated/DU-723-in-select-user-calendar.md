# IN: Select user calendar

- **Jira:** [DU-723](https://intelact.atlassian.net/browse/DU-723)
- **Platform:** 📱 Mobile
- **Component:** instructor_dU, mobile-dU
- **Status:** Done
- **Parent epic:** DU-720
- **Coverage:** 8/10 scenario(s) present in `features/`

> IN: Select user calendar

## Scenarios

- Likely covered (rephrased): Current user is selected per default and not shown in the list
- Covered in features/: User can select a single instructor to view their calendar
- NOT in features/: User can unselect the other instructor from the list of instructors
- NOT in features/: User can unselect the other instructor by removing instructor tag on the calendar
- Covered in features/: User can search for instructor to view calendar
- Covered in features/: User can search by speech-to-text
- Likely covered (rephrased): User can't edit
- Likely covered (rephrased): Calendar is editable for managers
- Covered in features/: Conflicting appointments are shown as overlapping calendar items
- Covered in features/: User can filter the calendar items

## Description

|
No “+“ button is shown if the current user is not a manager
|
|

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
