# Make past session uneditable

- **Jira:** [DU-971](https://intelact.atlassian.net/browse/DU-971)
- **Platform:** 📱 Mobile
- **Component:** instructor_dU, mobile-dU
- **Status:** Done
- **Parent epic:** DU-109
- **Coverage:** 0/1 scenario(s) present in `features/`

> Make past session uneditable

## Scenarios

- NOT in features/: User can add signature to a past session, to which no signature was added

## Description

Current state: User can edit past session
Given user has a training
When user goes to training history
- user goes to any given past session
- user clicks “Edit session”
Then user goes to the session edit view
- user can edit skills and topic assessment
New requirement:
- User can’t edit past appointment → no “Edit session” button is shown
- For past sessions, to which no signature is added, conditionally show “Add signature” button (please implement following scenario)

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
