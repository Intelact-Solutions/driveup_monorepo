# User does not see "Add Training" button if the company does not offer driving trainings

- **Jira:** [DU-894](https://intelact.atlassian.net/browse/DU-894)
- **Platform:** 📱 Mobile
- **Component:** instructor_dU, mobile-dU
- **Status:** Done
- **Parent epic:** DU-107
- **Coverage:** N/A – prose/technical story without scenarios

> User does not see "Add Training" button if the company does not offer driving trainings

## Scenarios

*(This story has no BDD scenario headings; the intent is captured in the Description below.)*

## Description

If the company does not offer a driving training, the user should not be able to add driving trainings. Therefore we have to hide the related button from:
- The global Add menu
- Trainings list empty state
- Home page empty state
- Empty state of the student selection in the calendar
Please remember that the title and the description of the empty states mentioned above must be different when the company does not offer driving trainings and it should be clear in the translation file.

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
