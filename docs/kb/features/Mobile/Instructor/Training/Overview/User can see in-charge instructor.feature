Feature: User can see in-charge instructor

Scenario: User can see in-charge instructor

Given user is instructor 
* instructor has a training
When user clicks on a training in the list of trainings
Then user sees in-charge training
* user sees instructor profile picture
* user sees instructor name
