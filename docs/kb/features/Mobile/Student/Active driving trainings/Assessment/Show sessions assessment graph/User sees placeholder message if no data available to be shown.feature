Feature: User sees placeholder message if no data available to be shown

Scenario: User sees placeholder message if no data available to be shown

Given student has a training
* student has had no driving appointment
When student opens the "Assessment" tab of the training
Then student sees a placeholder message
