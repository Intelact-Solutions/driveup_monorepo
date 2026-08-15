Feature: User can see student license data

Scenario: User can see student license data

Given user is instructor 
* instructor has a training
When user clicks on a training in the list of trainings
Then user sees License
* user sees expiry date of the license
* user sees license number
* user can see license reference number
