Feature: User sees past cancelled sessions

Scenario: User sees past cancelled sessions

Given user has a training
* user has an appointment, which is cancelled in the obligation period
When user opens the "History" tab of the training
Then user sees past cancelled session in the list of sessions
* for each exam session, user sees following details
|Session number|Date|Start time|Instructor name & pic|
* user sees "Cancelled" label
