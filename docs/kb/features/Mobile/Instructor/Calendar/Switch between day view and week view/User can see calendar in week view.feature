Feature: User can see calendar in week view

Scenario: User can see calendar in week view

Given user is logged in
When user goes to the calendar module
* user clicks on the top left menu icon
* user selects "week view"
Then user sees calendar in week view
* user can switch between weeks with chevrons
* current day is highlighted
* user sees only student picture and name for driving appointments
* user sees only course name for courses
