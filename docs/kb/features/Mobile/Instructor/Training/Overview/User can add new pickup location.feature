Feature: User can add new pickup location

Scenario: User can add new pickup location

Given user added a new training for a student
When user opens detailed view of a training
* user clicks on "Select" to add select pickup location
Then user can select a pickup location from the default locations of the company
* user can add customd location
* location is visible on the overview tab after selection
