Feature: User can cancel appointment

Scenario: User can cancel appointment

Given company has set an obligation period
* user has an active driving training 
* user has an upcoming appointment
* the appointment is within the obligation period (before the obligation ends)
* user is on "Calendar" page
When user clicks on the appointment 
* user clicks "Cancel Session"
Then the appointment is removed from the calendar
* no fee is applied for cancellation
