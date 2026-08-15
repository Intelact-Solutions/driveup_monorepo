Feature: User can recover account by email verification code

Scenario: User can recover account by email verification code

Given user is on the "Enter recovery email" screen
When user enters correct email address
* user clicks "Verify"
Then user receives a verification code per email
And user can proceed with the account recovery process
