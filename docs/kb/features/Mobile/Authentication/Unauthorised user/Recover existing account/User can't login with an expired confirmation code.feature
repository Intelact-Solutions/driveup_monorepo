Feature: User can't login with an expired confirmation code

Scenario: User can't login with an expired confirmation code

Given user has submitted a matching email address
  * user has received a verification code per email
  * verification code has expired
  When user enters the expired code
  Then system rejects the code
  * user sees a message saying "The code has expired."
