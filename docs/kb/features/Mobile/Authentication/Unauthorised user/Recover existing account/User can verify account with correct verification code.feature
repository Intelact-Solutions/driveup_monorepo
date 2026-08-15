Feature: User can verify account with correct verification code

Scenario: User can verify account with correct verification code

Given user has submitted a matching email address
  * user has received a verification code per email
   * user is on the "Enter verification code" page
  When user enters correct verification code
  Then user lands on the success page
  * user can proceed to use the app by clicking "Continue"
