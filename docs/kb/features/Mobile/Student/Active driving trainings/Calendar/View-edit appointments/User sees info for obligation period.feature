Feature: User sees info for obligation period

Scenario: User sees info for obligation period

Given company has set an obligation period 
* user has appointments which have not passed the obligation period
* user has appointments which have passed the obligation period 
* user is on "Calendar" page
When user clicks on an appointment 
Then user sees remaining obligation period as a warning message 
* the warning message displays the exact number of days remaining for free cancellation for upcoming appointments
