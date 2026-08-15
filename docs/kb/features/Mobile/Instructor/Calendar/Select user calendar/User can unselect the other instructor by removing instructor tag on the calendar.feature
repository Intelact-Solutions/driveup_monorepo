Feature: User can unselect the other instructor by removing instructor tag on the calendar

Scenario: User can unselect the other instructor by removing instructor tag on the calendar

Given user is instructor
* user is not manager
* user has selected another instructor to view their calendar
When user clicks X on the selected instructor's tag on the calendar 
Then the instructor is unselected
* the calendar of the current user is shown
