# Implement "Complete lesson" button

- **Jira:** [DU-1894](https://intelact.atlassian.net/browse/DU-1894)
- **Platform:** 📱 Mobile
- **Component:** instructor_dU, mobile-dU
- **Status:** Done
- **Parent epic:** DU-948
- **Coverage:** N/A – prose/technical story without scenarios

> Implement "Complete lesson" button

## Scenarios

*(This story has no BDD scenario headings; the intent is captured in the Description below.)*

## Description

Issue: In the current implementation, the user does not have a completion status of the driving session, so that when looking at the appointment in the calendar, the user can’t identify which sessions were actually held.
Solution: Implement a “Complete lesson” button.
Implementation
- Move signature option to the session menu with the label “Student signature”
- Remove payment icon
- Move “Notes” into the position of signature with a proper icon
- Move “Topics” to the position of the payment icon, with a corresponding new icon
- Between the two circles, implement a full stretched button with the label “Complete lesson” (de: “Fahrstunde abschließen”)
- clicking the button changes the color to green (similar to the behaviour in “Done”) and changes label to “Lesson completed” (de: “Fahrstunde abgeschlossen”)
- clicking the button adds a flag to the session, which is displayed on the Home screen and in the calendar as a tick .
- the flagged sessions must have the label “Completed” in the driving sesisons report Mohammad Hosein Soleymani
- button can be unclicked

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
