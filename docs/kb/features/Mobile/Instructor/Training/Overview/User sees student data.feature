Feature: User sees student data

Scenario: User sees student data

Given user is instructor 
* instructor has a training
When user clicks on a training in the list of trainings
* user clicks on three-dot-menu
* user selects "Student" data
Then user sees following student data
|profile picture| Phone number |student name| birthday | Address, Postal Code, Location|
