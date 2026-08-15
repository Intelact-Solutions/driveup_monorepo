Feature: User can see estimated exam date

Scenario: User can see estimated exam date

Given user has a driving training
* user has had at least 10 appointments
When user opens training detailed view
Then user sees an exam estimation date
