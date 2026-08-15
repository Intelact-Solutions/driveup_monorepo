# Implement inline edit for session note

- **Jira:** [DU-1441](https://intelact.atlassian.net/browse/DU-1441)
- **Platform:** 📱 Mobile
- **Component:** instructor_dU, mobile-dU
- **Status:** Done
- **Parent epic:** DU-948
- **Coverage:** N/A – prose/technical story without scenarios

> Implement inline edit for session note

## Scenarios

*(This story has no BDD scenario headings; the intent is captured in the Description below.)*

## Description

Issue: With the current implementation, the session note of the current session can be edited, but has no explicit buttons to save or cancel saving the changes. As such, the behaviour is confusing for the user.
Solution: Implement explicit inline edit buttons for saving changes or cancelling without saving.
- Upon initial loading, the note is in read mode.
- Go to edit mode by clicking on the field →  and  inline edit buttons appear
- After changes, clicking  saves the changes and closes the edit form, while clicking the  cancels without changing.

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
