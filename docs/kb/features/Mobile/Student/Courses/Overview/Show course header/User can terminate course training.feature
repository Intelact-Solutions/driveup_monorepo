Feature: User can terminate course training

Scenario: User can terminate course training

Given user is logged in
* user is on the detailed view of an active training
When user clicks on the three-dot menu icon
* user selects "End training"
Then user sees an info message
* user sees current balance
* user sees number of remaining parts
* user can terminate the training by clicking "Terminate & Archive"
