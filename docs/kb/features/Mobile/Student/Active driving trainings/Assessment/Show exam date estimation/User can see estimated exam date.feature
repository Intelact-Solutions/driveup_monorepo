Feature: User can see estimated exam date

Scenario: User can see estimated exam date

Given user has an active driving training
* user has had at least 10 appointments
When user opens Assessment tab
Then user sees an exam estimation date
* user sees the number of days left to the estimated examination date
