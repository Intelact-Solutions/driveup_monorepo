Feature: User can navigate between all four tabs

Scenario: User can navigate between all four tabs

Given user is instructor 
* instructor has a training
When user clicks on a training in the list of trainings
Then user sees the detailed view of a training
* user can navigate between the tabs Overview, History, Payment and Assessment
