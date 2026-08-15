Feature: User can add a new appointment

Scenario: User can add a new appointment

Given user is on the detailed view of an active training
When user clicks "Set appointment"
Then user is redirected to the Calendar tab
* user can add a new appointment
