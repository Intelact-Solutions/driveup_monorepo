Feature: User can see action log

Scenario: User can see action log

Given user is instructor 
* instructor has a training
When user clicks on a training in the list of trainings
Then user sees log data about registration
|registered by| registration date|
* user sees log last status change
|responsible person| date of status change|
