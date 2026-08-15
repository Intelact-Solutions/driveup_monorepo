Feature: User can accept invitation

Scenario: User can accept invitation

Given user has an already active profile
* user has received a new invitation to join driveUp
When user clicks "Accept"
Then invitation notification is closed
* new profile is created automatically
* user lands on the home page of the new created profile
