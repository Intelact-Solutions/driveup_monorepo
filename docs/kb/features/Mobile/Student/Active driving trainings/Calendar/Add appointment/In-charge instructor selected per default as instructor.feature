Feature: In-charge instructor selected per default as instructor

Scenario: In-charge instructor selected per default as instructor

Given user has an active driving training 
* user is on "Calendar" page
When user clicks on an empty slot in the calendar
Then "Add new appointment" form is shown
* the in-charge instructor is selected per defauls as instructor 
* in-charge instructor is view-only
