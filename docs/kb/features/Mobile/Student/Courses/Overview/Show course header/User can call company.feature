Feature: User can call company

Scenario: User can call company

Given user is logged in
* user is on the detailed view of an active training
When user clicks on the phone icon
Then user directly dials the number of the driving school in his own device
