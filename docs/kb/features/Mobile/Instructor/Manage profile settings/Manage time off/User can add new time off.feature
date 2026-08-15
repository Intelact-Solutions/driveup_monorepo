Feature: User can add new time off

Scenario: User can add new time off

Given user is on the "Time off" page
When user enters title for the time off
* user adds start and end date
* user clicks "Save"
Then new time off is added
* the added time off is shown on user calendar
* no appointment can be added by other users on the occupied slot
