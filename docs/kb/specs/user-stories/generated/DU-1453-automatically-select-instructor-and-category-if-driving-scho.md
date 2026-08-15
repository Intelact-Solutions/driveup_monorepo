# Automatically select instructor and category if driving school has single instructor and offers single category

- **Jira:** [DU-1453](https://intelact.atlassian.net/browse/DU-1453)
- **Platform:** 🌐 Web
- **Component:** manager_dU, web-dU
- **Status:** Done
- **Parent epic:** DU-839
- **Coverage:** N/A – prose/technical story without scenarios

> Automatically select instructor and category if driving school has single instructor and offers single category

## Scenarios

*(This story has no BDD scenario headings; the intent is captured in the Description below.)*

## Description

Current implementation: On the “add training” form, we show dropdown for instructor and driving category selection, even if company has single instructor and offers only one driving category. This is inefficient from a UX perspective.
Solution: If company has single instructor and/or single driving category:
- Do not show selection dropdown
- Automatically select the only existing instructor or driving category and show as read-only
If company has multiple instructors or driving categories, show dropdown and DO NOT select any item automatically.

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
