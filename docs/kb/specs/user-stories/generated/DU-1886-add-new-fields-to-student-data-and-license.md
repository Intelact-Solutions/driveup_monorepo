# Add new fields to student data and license

- **Jira:** [DU-1886](https://intelact.atlassian.net/browse/DU-1886)
- **Platform:** 📱 Mobile
- **Component:** instructor_dU, mobile-dU
- **Status:** Done
- **Parent epic:** DU-285
- **Coverage:** N/A – prose/technical story without scenarios

> Add new fields to student data and license

## Scenarios

*(This story has no BDD scenario headings; the intent is captured in the Description below.)*

## Description

Based on the feedback by the driving schools, there are some missing data for the student.
- New student fields in the student profile:
- Birthday: implemented as a date picker
- Address: contains fields Address, Postal Code, Location
- New field for license edit form:
- Reference number: alphanummerical input field
- The field is shown in the edit form for license
- The reference number is shown on the overview page, below the license number
- If there is no reference number, nothing is shown.

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
