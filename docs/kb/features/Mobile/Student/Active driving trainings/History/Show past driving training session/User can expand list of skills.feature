Feature: User can expand list of skills

Scenario: User can expand list of skills

Given user is on the History tab of a driving training
* list of skills is collapsed
When user clicks on the "Show details" button
Then list of skills for the corresponding topic is shown
* the button label is changed to "Hide details"
