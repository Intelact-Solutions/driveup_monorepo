Feature: User can add new student license

Scenario: User can add new student license

Given user added a new training for a student
When user opens detailed view of a training
* user clicks on + to add new student license
* user enters license number
* user enters expiry date
* user submits form
Then new student license is saved
