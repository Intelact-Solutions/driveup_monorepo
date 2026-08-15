Feature: User can see pick-up location

Scenario: User can see pick-up location

Given user is instructor 
* instructor has a training
When user clicks on a training in the list of trainings
Then user sees pickup location
