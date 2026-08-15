# Bad UX design for filters on the web

- **Jira:** [DU-1492](https://intelact.atlassian.net/browse/DU-1492)
- **Platform:** 🌐 Web
- **Component:** manager_dU, web-dU
- **Status:** Done
- **Parent epic:** DU-365
- **Coverage:** N/A – prose/technical story without scenarios

> Bad UX design for filters on the web

## Scenarios

*(This story has no BDD scenario headings; the intent is captured in the Description below.)*

## Description

Babak Khademi rasekh moafi
Decision:
- Implement the popup window changes for all instances of the filters
- filter button shows a different state when a filter is activated
- user can remove all filters with a “Reset all” button
Discuss details with Admir Serifi
Issues: The current implementation of filters on the web is not user-friendly.
- When filters are selected, the UI has no indication whatsoever that the list is filtered.
- The user does not have the option to clear all filters at once and return to the default list.
Solution:
- Selected filters are shown as labels, which can be removed by clicking x.
- Filter popup should always have an x button to close it without changing anything.
- Change label “Save” to “Apply”.
- For longer filter popups, which are scrollable, make header sticky.
- In the filter popup, user should always be able to unselect the filter
- specifically, user should also be able to easily unselect a date filter.

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
