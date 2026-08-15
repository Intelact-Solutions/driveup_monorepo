Feature: User can see active training

Scenario: User can see active training

Given user is registered as student
* user has one or more active training
When student starts app 
Then user sees list of active trainings
* Driving training contains the following elements
|company logo & name|category label|Instructor picture & name| Balance| Progress| Next session |
* Course training contains the following elements
|company logo & name|Course icon|Course name| Balance| Progress| Next session | Next part name|
