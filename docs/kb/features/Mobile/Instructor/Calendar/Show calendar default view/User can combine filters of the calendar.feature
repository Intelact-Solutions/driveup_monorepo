Feature: User can combine filters of the calendar

Scenario: User can combine filters of the calendar

Given user has opened the calendar
* user has different types of appointments
When user clicks on the top left menu
* user selects multiple filters
Then appointments are filteed based on the selected filter combination
