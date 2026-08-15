Feature: User can view appointment details

Scenario: User can view appointment details

Given company has set an obligation period 
* user has an active driving training 
* user has an upcoming appointment 
* user is on "Calendar" page
When user clicks on the appointment 
Then user sees the appointment details 
* user sees instructor name and profile picture
* user sees date and time
* user sees pickup location
* user sees remaining obligation period as a warning message
