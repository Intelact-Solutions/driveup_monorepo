Feature: User can terminate training

Scenario: User can terminate training

Given user is logged in
* user is on the detailed view of an active training
When user clicks on the three-dot menu icon
* user selects "End training"
Then user sees an info message
* user sees remaining debt, if any
* user sees number of remaining appointments
* user can terminate the training by clicking "Terminate training"
