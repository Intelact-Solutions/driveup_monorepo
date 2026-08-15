Feature: User can edit student license

Scenario: User can edit student license

Given user has a training with a student
* user has previously added a student license
* user is on the training "Overview" tab
When user opens training menu
* user selects "Edit license"
* user edits sthe license number or expiry date
* user submits form
Then user sees newly saved license on the Overview page
