Feature: User sees past exam sessions

Scenario: User sees past exam sessions

Given user has a training
* user has had an exam sessions
When user opens the "History" tab of the training
Then user sees past exam session in the list of sessions
* for each exam session, user sees following details
|Session number|Date|Start time|Instructor name & pic|
* user sees exam status as a label
