Feature: Manager sees Admin button on app header

Scenario: Manager sees Admin button on app header

Given user is manager
When user logs in
Then user sees button "Admin" on the app header
* the button is less highlighted than the "Add" button
* clicking the button leads the user to the admin platform
