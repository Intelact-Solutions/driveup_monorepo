Feature: User sees info message for missing exam sessions

Scenario: User sees info message for missing exam sessions

Given user has a training with a student
* student has had no driving appointment
When user opens the "Assessment" tab of the training
Then user sees info message "Exam sessions are not included in the graph"
