# [WEB] Handling for unpaid invoices

- **Jira:** [DU-1398](https://intelact.atlassian.net/browse/DU-1398)
- **Platform:** 🌐 Web
- **Component:** manager_dU, web-dU
- **Status:** On hold
- **Parent epic:** DU-1380
- **Coverage:** 0/6 scenario(s) present in `features/`

> [WEB] Handling for unpaid invoices

## Scenarios

- NOT in features/: User cannot change plan if there are unpaid invoices
- NOT in features/: If payment method can't be charged, user enters a one month grace period with warning
- NOT in features/: User can settle unpaid invoices during grace period
- NOT in features/: Essential functions are blocked after grace period if invoices remain unpaid
- NOT in features/: User can settle unpaid invoices in blocked period to restore essential functions
- NOT in features/: User is charged for the remaining of the month when user is unblocked

## Description

Grace period (unpaid invoices) |
Block period |
|
|

---
_Generated from Jira export `specs/user-stories/Jira.xml`. "Missing from features/" means no Gherkin feature in `features/DriveUp Admin` captures this scenario._
