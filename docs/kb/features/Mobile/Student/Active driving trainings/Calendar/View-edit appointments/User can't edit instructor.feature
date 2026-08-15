Feature: User can't edit instructor

Scenario: User can't edit instructor

Given user has an active driving training 
* user has an upcoming appointment
* user is on "Calendar" page
When user clicks on the appointment 
Then user sees the instructor in view mode only
* user cannot edit the instructor
