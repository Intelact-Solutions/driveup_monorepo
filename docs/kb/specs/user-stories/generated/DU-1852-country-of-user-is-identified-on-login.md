# Country of user is identified on login

- **Jira:** [DU-1852](https://intelact.atlassian.net/browse/DU-1852)
- **Platform:** 📱 Mobile
- **Component:** instructor_dU, mobile-dU
- **Status:** Done
- **Parent epic:** DU-285
- **Coverage:** N/A – prose/technical story without scenarios

> Country of user is identified on login

## Scenarios

*(This story has no BDD scenario headings; the intent is captured in the Description below.)*

## Description

- Store user country in the local storage
- if country found in local storage, pre-select the country regardless of the IP location
- if country not found in local storage, fetch country from IP info service (communicate with Admir)
- if country is supported, pre-select country
- else, pre-select first country in the list

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
