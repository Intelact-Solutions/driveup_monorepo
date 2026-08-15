Feature: User sees account recovery screen if inactive for more than 6 months

Scenario: User sees account recovery screen if inactive for more than 6 months

Given user has not opened the app for more than 6 months
* user has previously added a recovery email
* user is on a new device
When user starts the app
* user authenticates through phone number
Then user sees account recovery screen
