Feature: User can see start date

Scenario: User can see start date

Given user has an active driving training
* user has 10 or more appointments for the training
When user opens training detailed view
Then user sees the start date of the training
