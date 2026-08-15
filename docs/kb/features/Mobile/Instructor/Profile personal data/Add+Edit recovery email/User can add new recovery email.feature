Feature: User can add new recovery email

Scenario: User can add new recovery email

Given user has no recovery email
When user enters new recovery email
* user enters the confirmation code received per email
Then new recovery email is saved
