Feature: User can't proceed if email does not match

Scenario: User can't proceed if email does not match

Given user is on the "Enter recovery email" screen
When user enters an email address which does not match
Then user lands on the error page
* user has the option to contact support
* user has the option to create a new account by overwriting the old one
