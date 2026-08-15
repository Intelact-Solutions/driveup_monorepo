Feature: User sees exam session data

Scenario: User sees exam session data

Given user has a training
When user goes to the History tab of the training
* user clicks on an exam session card
Then user sees exam session details view
* user sees exam session date and time
* user sees examiner name and exam status
* instructor name and profile is updated if a driving session is assigned to another instructor
* user sees exam status as label
