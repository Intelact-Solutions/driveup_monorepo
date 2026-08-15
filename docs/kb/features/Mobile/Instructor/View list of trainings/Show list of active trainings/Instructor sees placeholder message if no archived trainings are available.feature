Feature: Instructor sees placeholder message if no archived trainings are available

Scenario: Instructor sees placeholder message if no archived trainings are available

Given user has no training
When user navigates to the "Training" tab on the app menu
Then user lands on the empty active trainngs tab
* user sees placeholder text message
