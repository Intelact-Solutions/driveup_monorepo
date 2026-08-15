Feature: Student can have only one license

Scenario: Student can have only one license

Given user has a training with a student
* user has previously added a student license
When user opens the training "Overview" tab
Then user sees no + button to add a new license
