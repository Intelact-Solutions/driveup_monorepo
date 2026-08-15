Feature: User sees blocker screen if mandatory update is pending

Scenario: User sees blocker screen if mandatory update is pending

Given user has installed driveUp
* new update with breaking change is available
When user starts the app
Then user sees a blocker screen propmting him to update the app
* user sees a link to Google Play or App Store
* blocker screen is removed after user has updated the app
