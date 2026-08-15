Feature: User can filter for trainings with negative balance

Scenario: User can filter for trainings with negative balance

Given user is on the list of trainings
When user clicks the filter button
* user turns on the "Negative balance" switcher
Then list shows only trainings with a negative balance
