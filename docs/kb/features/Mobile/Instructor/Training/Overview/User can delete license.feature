Feature: User can delete license

Scenario: User can delete license

Given user has a training with a student
* user has previously added a student license
* user is on the training "Overview" tab
When user opens training menu
* user selects "Edit license"
* user clicks "Delete license"
* user confirms the deletion
Then student license is removed
* user sees empty slot with placeholder message
