# Automatically select category if driving school has single category

- **Jira:** [DU-1452](https://intelact.atlassian.net/browse/DU-1452)
- **Platform:** 📱 Mobile
- **Component:** instructor_dU, mobile-dU
- **Status:** Done
- **Parent epic:** DU-776
- **Coverage:** N/A – prose/technical story without scenarios

> Automatically select category if driving school has single category

## Scenarios

*(This story has no BDD scenario headings; the intent is captured in the Description below.)*

## Description

Current state: When driving school offers only one driving category, we still show a dropdown from which this single category has to be selected. This is inefficient from a UX perspective.
Solution:
- Hide dropdown if there is only one category and automatically select the existing category
- If driving school has multiple categories, show the dropdown and DO NOT select any category automatically.

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
