Feature: User can unselect pickup location

Scenario: User can unselect pickup location

Given user has a training with a student
* user has previously added a pickup location
* user is on the training "Overview" tab
When user opens the location edit screeen
* user clicks on the already selected option
Then pickup location is unselected
* user sees empty state on the overview page if changes are saved
