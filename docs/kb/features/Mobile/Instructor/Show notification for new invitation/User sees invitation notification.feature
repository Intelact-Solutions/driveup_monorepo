Feature: User sees invitation notification

Scenario: User sees invitation notification

Given user has an already active profile
* user has received a new invitation to join driveUp
When user opens the  Home screen
Then user see the invitation notification
* clicking the invitation takes user to profile settings page
