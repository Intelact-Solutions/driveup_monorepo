Feature: User sees invitation screen

Scenario: User sees invitation screen

Given user has received an invitation to join driveUp
* user has no active profile
When user verifies identity through phone number and verification code
Then user see the invitation screen
* user sees "Accept" and "Reject" buttons
* user can't skip the invitation screen
