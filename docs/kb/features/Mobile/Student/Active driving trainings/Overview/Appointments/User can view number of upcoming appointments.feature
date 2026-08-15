Feature: User can view number of upcoming appointments

Scenario: User can view number of upcoming appointments

Given user is logged in
When user clicks on an active training in the start page
Then user sees number of remaining upcoming appointments
