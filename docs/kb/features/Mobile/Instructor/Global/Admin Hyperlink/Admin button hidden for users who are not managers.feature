Feature: Admin button hidden for users who are not managers

Scenario: Admin button hidden for users who are not managers

Given user is not a manager
When user logs in to the app
Then user does not see the admin button
