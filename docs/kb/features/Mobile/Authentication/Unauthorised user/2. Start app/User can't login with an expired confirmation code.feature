Feature: User can't login with an expired confirmation code

Scenario: User can't login with an expired confirmation code

Given user enters their phone number to receive a confirmation code
  * confirmation code has expired
  When user enters the expired code
  Then system rejects the code
  * user sees a message saying "The code has expired"
