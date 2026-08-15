Feature: User can see calendar in day view

Scenario: User can see calendar in day view

Given user is logged in
When user goes to the calendar module
Then user sees calendar in day view
* user can switch between days with chevrons
* user sees details of driving appointments
|student picture|student name|driving category|icon for automatic tranmission (optional)|
* user sees details of course appointments
|course name|part title|number of participants|
