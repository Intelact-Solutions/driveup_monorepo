# Remove "Done" label for topic inside session main view

- **Jira:** [DU-1443](https://intelact.atlassian.net/browse/DU-1443)
- **Platform:** 📱 Mobile
- **Component:** instructor_dU, mobile-dU
- **Status:** Done
- **Parent epic:** DU-948
- **Coverage:** N/A – prose/technical story without scenarios

> Remove "Done" label for topic inside session main view

## Scenarios

*(This story has no BDD scenario headings; the intent is captured in the Description below.)*

## Description

Issue: In the current implementation, in order to set the topic to “Done”, user clicks on the “Done” button, which adds a “Done” label to the topic, while the button itself remains unchanged. Clicking a second time on “Done” removes the label. This behaviour is not user-friendly and can be solved in a better way.
Solution:
- When user clicks “Done”, the “Done” button changes color to green and a tick icon appears in it.
- When clicking a second time, the “Done” button simply returns to its default state.
- The additional “Done” label is removed.
IMPORTANT NOTE: The “Done” label is removed only from this specific context. It continues to be shown in all other contexts, e.g. the topics list, training history etc.

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
