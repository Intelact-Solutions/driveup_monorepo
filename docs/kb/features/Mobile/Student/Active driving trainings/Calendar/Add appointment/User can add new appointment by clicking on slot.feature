Feature: User can add new appointment by clicking on slot

Scenario: User can add new appointment by clicking on slot

Given user has an active driving training 
* user is on "Calendar" page
When user clicks on an empty spot in the calendar
* user clicks "Save"
Then the new appointment is added to the calendar
* the time date and time of the clicked slot is automatically added as date and time
