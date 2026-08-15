Feature: User sees session notes

Scenario: User sees session notes

Given user has a training
When user goes to the History tab of the training
* user clicks on a session card
Then user sees session details view
* user sees session notes
* session notes are updated if the session is edited afterwards
