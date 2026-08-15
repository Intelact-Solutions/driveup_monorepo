Feature: User can search by balance

Scenario: User can search by balance

Given user is on the list of trainings
* and user has multiple trainings
When user enters matching student balance
Then search results is shown
