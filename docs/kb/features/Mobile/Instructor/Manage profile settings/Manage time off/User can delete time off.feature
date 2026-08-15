Feature: User can delete time off

Scenario: User can delete time off

Given user is on the "Time off" page
* user has at least one Time off
When user clicks on "Delete"
* user confirms deletion
Then Time off is removed
