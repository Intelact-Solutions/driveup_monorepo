Feature: User sees percentage of topic completion

Scenario: User sees percentage of topic completion

Given user is logged in
* user has an active driving training
When user opens detailed view of a training
Then user sees the percentage of completed topics
* user sees a visual indicator of the completion
* value is always show as a whole number and not as a decimal
