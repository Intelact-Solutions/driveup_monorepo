Feature: User can accept invitation

Scenario: User can accept invitation

Given user has received an invitation to join driveUp
* user has no active profile
* user has verified identity through phone number and verification code
When user clicks "Accept"
Then invitation screen is closed
* users language is automatically set to company language
* user lands on personal data screen
* users profile gets created after entering personal data
