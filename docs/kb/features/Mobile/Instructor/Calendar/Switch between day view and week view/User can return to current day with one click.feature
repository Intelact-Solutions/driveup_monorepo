Feature: User can return to current day with one click

Scenario: User can return to current day with one click

Given user is on the calendar
* user has navigated to a different day or week than the current one
When user clicks the today icon
Then user is redirected to the current day
