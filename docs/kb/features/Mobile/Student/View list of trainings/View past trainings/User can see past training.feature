Feature: User can see past training

Scenario: User can see past training

Given user is registered as student
* user has one or more past trainings
When student starts app 
Then user sees list of past trainings
* Driving training contains the following elements
|company logo & name|category label|Instructor picture & name| Balance| Progress| Status label |
* Course training contains the following elements
|company logo & name|Course icon|Course name| Balance| Progress| Status label |
