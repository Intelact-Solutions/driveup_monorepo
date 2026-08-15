Feature: User can resend code

Scenario: User can resend code

Given user has submitted phone number
  * user has received no SMS with a verification code
  When user clicks "Resend"
  Then a new SMS is sent
  * previously valid code is invalidated
  * "Resend" button is disabled for the next 60 seconds
