Feature: User can trigger recovery process by email

Scenario: User can trigger recovery process by email

Given user has previously added a recovery email
* user is on the account recovery screen
When user selects "Recovery mail" option
* user clicks "Next"
Then user lands on the next page of the process
