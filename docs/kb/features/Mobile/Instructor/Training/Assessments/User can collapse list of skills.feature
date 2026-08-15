Feature: User can collapse list of skills

Scenario: User can collapse list of skills

Given user is on the Assessment tab of a driving training
* list of topic skills is expanded
When user clicks on the "Hide details" button
Then list of skills for the corresponding topic is shown
* the buton label is changed to "Show details"
