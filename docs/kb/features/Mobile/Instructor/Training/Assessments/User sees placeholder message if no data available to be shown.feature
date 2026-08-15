Feature: User sees placeholder message if no data available to be shown

Scenario: User sees placeholder message if no data available to be shown

Given user has a training with a student
* student has had no driving appointment
When user opens the "Assessment" tab of the training
Then user sees a placeholder message
