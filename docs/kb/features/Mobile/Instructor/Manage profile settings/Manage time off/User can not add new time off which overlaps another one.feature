Feature: User can not add new time off which overlaps another one

Scenario: User can not add new time off which overlaps another one

Given user is on the "Time off" page
* user has at least one Time off
When user enters title for the time off
* user adds start and end date which overlaps with the existing time off
* user clicks "Save"
Then an error message with the text "The selected time interval overlaps with an existig time off period!" is displayed 
* user can not add time off
