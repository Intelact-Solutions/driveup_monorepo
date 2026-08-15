Feature: Current user is selected per default and not shown in the list

Scenario: Current user is selected per default and not shown in the list

Given user is logged in
* user opens the Calendar module
Then current user sees own calendar
* current user is not shown on the list of driving instructors
