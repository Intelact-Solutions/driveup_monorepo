Feature: User can remove work interval

Scenario: User can remove work interval

Given user is an instructor 
* user is on the "Working hours and days" page
* user has one or more work intervals for a day
When user clicks on the delete icon for a work interval
Then the work interval is removed
