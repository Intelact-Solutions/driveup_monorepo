# Delete profile

- **Jira:** [DU-84](https://intelact.atlassian.net/browse/DU-84)
- **Platform:** 📱 Mobile
- **Component:** instructor_dU, mobile-dU
- **Status:** Done
- **Parent epic:** DU-424
- **Coverage:** 2/4 scenario(s) present in `features/`

> Delete profile

## Scenarios

- NOT in features/: User can delete his/her only profile
- NOT in features/: User can delete one of multiple profiles
- Covered in features/: Company owner can't delete owner profile
- Covered in features/: Company owner can delete a secondary profile

## Description

The scope of the ticket was changed due to unimplemented API endpoints.
The current implementation of the deletion functionality does not differentiate between instructors with in-charge trainings and those without. This will be implemented in the user story https://intelact.atlassian.net/browse/DU-607 once the API has been implemented.
Ehsan Eydi Erta Kokomani The following scenarios have been linked to the new user story:
- Instructor with in-charge training can't delete profile (Test Case)
- Instructor with no in-charge training can delete own profile (Test Case)
Please make sure not to add them to the next test cycle.

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
