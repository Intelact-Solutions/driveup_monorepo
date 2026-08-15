Feature: User can edit time off

Scenario: User can edit time off

Given user is on the "Time off" page
* user has at least one time off
When user clicks on "Edit"
Then user can edit start and end date
* user can edit the title of the Time off
