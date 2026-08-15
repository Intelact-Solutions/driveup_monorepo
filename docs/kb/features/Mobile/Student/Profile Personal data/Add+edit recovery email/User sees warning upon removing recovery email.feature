Feature: User sees warning upon removing recovery email

Scenario: User sees warning upon removing recovery email

Given user is on the Profile Settings page
* user has a recovery email address
When user removes recovery email
* user leaves field
Then user sees warning message "Your recovery email is recommended, to make sure you always have access to your account."
