Feature: Start date can not be after End date for Time off

Scenario: Start date can not be after End date for Time off

Given user is on the "Time off" page
* user has entered a string in the title filed 
When user selects a start date 5 days from the current date 
* user opens the "End Date" field 
Then all days before the selected start date are disabled 
* user can not select an end date before the start date
