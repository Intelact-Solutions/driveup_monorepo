Feature: User sees busy slots of the instructor

Scenario: User sees busy slots of the instructor

Given user is logged in as student
* user has upcoming appointments with a specific instructor
When user goes to "Calendar" view page 
Then user can see own upcoming appointments 
* user can see busy slots of in charge instructor 
* busy slots are grey highlighted
* user can not add any new appointment in the busy slots
