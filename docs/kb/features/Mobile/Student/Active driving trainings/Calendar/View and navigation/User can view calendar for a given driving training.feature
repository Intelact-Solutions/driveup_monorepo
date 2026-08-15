Feature: User can view calendar for a given driving training

Scenario: User can view calendar for a given driving training

Given user has an ongoing training 
* user has an upcoming appointment for the training
When user opens the driving training detailed view 
* user clicks "Calendar" in the navigation menu 
Then user lands on "Calendar" view page 
* user can see the upcoming driving training appointment 
* the appointment has the following elements
|Topic name|Instructor name|Instructor profile picture|
