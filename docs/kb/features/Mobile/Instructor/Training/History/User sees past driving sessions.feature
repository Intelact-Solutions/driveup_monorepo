Feature: User sees past driving sessions

Scenario: User sees past driving sessions

Given user has a training
* user has completed multiple driving appointments
When user opens the "History" tab of the training
Then user sees list of past sessions
* sessions are sorted with latest on top
* for each session, user sees following details
|Session number|Date|Start time|Instructor name & pic|
