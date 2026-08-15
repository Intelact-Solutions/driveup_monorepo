Feature: If cancelled in the obligation period, user sees popup message warning about remaining costs

Scenario: If cancelled in the obligation period, user sees popup message warning about remaining costs

Given company has set an obligation period
* user has an active driving training 
* user has an upcoming appointment
* the appointment is in the obligation period
* user is on "Calendar" page
When user clicks on the appointment 
* user clicks "Cancel Session"
Then a popup message warning about remaining costs is shown
* the appointment is not removed from the calendar
* the appointment is shown with label "Cancelled"
* the "Cancel" button is not shown
