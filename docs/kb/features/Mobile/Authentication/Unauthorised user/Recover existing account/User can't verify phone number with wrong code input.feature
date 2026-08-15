Feature: User can't verify phone number with wrong code input

Scenario: User can't verify phone number with wrong code input

Given user has submitted a matching email address
  * user has received a verification code per email
  * user is on the "Enter verification code" page
  When user enters code incorrectly
  Then user sees an error message
  * user can edit the code to correct it
  * user can proceed after correcting a wrong input
