Feature: User sees date and time of next driving session

Scenario: User sees date and time of next driving session

Given user has a training
When user opens training detailed view
* user opens "History" tab
Then user sees section "Next session"
* user sees date and time of the next session
