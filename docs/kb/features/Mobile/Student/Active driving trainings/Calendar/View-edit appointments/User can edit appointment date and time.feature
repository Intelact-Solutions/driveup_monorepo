Feature: User can edit appointment date and time

Scenario: User can edit appointment date and time

Given user has an active driving training 
* user has an upcoming appointment
* user is on "Calendar" page
When user clicks on the appointment 
* user edits the date
* user edits the time 
* saves the changes 
Then the appointment is moved to the new date and time
