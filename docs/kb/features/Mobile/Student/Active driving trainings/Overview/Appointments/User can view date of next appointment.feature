Feature: User can view date of next appointment

Scenario: User can view date of next appointment

Given user is logged in
When user clicks on an active training in the start page
Then user sees date of next appointment
