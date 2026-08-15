Feature: User sees current balance of the student

Scenario: User sees current balance of the student

Given user is instructor 
* instructor has a training
When user clicks on a training in the list of trainings
Then user can see current balance of the student
