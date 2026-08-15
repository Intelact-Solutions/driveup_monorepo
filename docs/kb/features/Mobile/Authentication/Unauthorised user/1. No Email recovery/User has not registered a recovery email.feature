Feature: User has not registered a recovery email

Scenario: User has not registered a recovery email

Given user has not registered a recovery email
When user logs in with a new device after 6 month of inactivity
Then user sees the "No recovery email" screen
* recovery email option is disabled 
* user sees a description that shown why the option is disabled
* user can contact support
* user can create a new account
