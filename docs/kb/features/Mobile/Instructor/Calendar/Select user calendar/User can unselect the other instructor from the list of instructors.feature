Feature: User can unselect the other instructor from the list of instructors

Scenario: User can unselect the other instructor from the list of instructors

Given user is on the calendar screen
* user has selected another instructor to view their calendar
When user clicks on the top left menu
* user clicks on the instructor to unselect
Then the instructor is unselected
* the calendar of the current user is shown
