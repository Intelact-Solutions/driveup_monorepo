Feature: User sees list of session topics and skills

Scenario: User sees list of session topics and skills

Given user has a training
* user has had at least one session with assessments
When user goes to the History tab of the training
* user clicks on the session card
Then user sees session details view
* user sees list of topics assessed in the training
* user can expand topic to view skills assessment
