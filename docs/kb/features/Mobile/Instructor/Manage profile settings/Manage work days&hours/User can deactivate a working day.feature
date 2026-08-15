Feature: User can deactivate a working day

Scenario: User can deactivate a working day

Given user is an instructor 
* user is on the "Working hours and days" page
* user has one or more work intervals for a day
When user clicks on the toggler
Then the day is deactivated
* previously registered work intervals for the day are deleted
