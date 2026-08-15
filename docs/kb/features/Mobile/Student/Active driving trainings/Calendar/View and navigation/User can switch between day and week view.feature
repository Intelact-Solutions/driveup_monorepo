Feature: User can switch between day and week view

Scenario: User can switch between day and week view

Given user is on "Calendar" view page 
* the default state of calendar is on day view 
When user clicks the icon on the top right of the page 
Then user sees the calendar in week view mode
* current day is highlighted
* user can switch back to day view by clicking the same icon
