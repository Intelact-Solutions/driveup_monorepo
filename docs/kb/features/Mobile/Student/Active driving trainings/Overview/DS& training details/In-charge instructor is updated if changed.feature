Feature: In-charge instructor is updated if changed

Scenario: In-charge instructor is updated if changed

Given user has a training
* the in-charge instructor of the training has been changed
When user opens training detail page
Then the new in-charge instructor is visible
