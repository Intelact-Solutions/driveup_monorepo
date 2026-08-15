Feature: User can editchange pickup location

Scenario: User can editchange pickup location

Given user has a training with a student
* user has previously selected / added a pickup location
* user is on the training "Overview" tab
When user clicks the edit button
* user selects another location or edits the custom location
* user submits form
Then user sees newly saved pickup location on the Overview page
