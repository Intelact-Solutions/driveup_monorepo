Feature: Date and time of next driving session is hidden if no upcoming appointment

Scenario: Date and time of next driving session is hidden if no upcoming appointment

Given user has a training
* user has no upcoming appointment for the training
When user opens the History tab of the training
Then "Next session" section is not visible
