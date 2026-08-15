Feature: User sees own balance

Scenario: User sees own balance

Given user is a student
When user opens the detailed view of a course
Then user sees own balance
* user sees course cost
* user sees the Paid amount (payments minus refunds)
