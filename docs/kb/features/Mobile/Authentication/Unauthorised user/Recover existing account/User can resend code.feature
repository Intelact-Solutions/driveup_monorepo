Feature: User can resend code

Scenario: User can resend code

Given user has submitted a matching email address
  * user has received a verification code per email
  When user clicks "Resend"
  Then a new email is sent
  * previously valid code is invalidated
