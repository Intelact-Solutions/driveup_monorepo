Feature: User can reject invitation

Scenario: User can reject invitation

Given user has received an invitation to join driveUp
* user has no active profile
* user has verified identity through phone number and verification code
When user clicks "Reject"
Then user lands on other invitation screen if any
* the invitation screen is closed
* user lands on the start page
