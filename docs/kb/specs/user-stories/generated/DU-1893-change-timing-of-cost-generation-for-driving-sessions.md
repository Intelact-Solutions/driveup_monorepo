# Change timing of cost generation for driving sessions

- **Jira:** [DU-1893](https://intelact.atlassian.net/browse/DU-1893)
- **Platform:** 📱 Mobile
- **Component:** instructor_dU, mobile-dU
- **Status:** Done
- **Parent epic:** DU-285
- **Coverage:** N/A – prose/technical story without scenarios

> Change timing of cost generation for driving sessions

## Scenarios

*(This story has no BDD scenario headings; the intent is captured in the Description below.)*

## Description

Issue: In the current implementation, we generate a new cost for a driving session in the moment the driving session is added to the calendar. This is not intuitive for the normal instructor and it creates misunderstandings in the debt communication with the students, since the debt is for a service not provided yet.
Solution: Generate the cost of the driving session after the session end time has passed. Discuss implementation details with Admir.

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
