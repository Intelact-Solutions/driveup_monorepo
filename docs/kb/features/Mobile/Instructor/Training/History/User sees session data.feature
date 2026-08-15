Feature: User sees session data

Scenario: User sees session data

Given user has a training
When user goes to the History tab of the training
* user clicks on a session card
Then user sees session details view
* user sees session date and time
* user sees instructor name and profile picture
* instructor name and profile is updated if a driving session is assigned to another instructo
