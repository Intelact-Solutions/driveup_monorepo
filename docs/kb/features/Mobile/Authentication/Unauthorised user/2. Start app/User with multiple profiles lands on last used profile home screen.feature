Feature: User with multiple profiles lands on last used profile home screen

Scenario: User with multiple profiles lands on last used profile home screen

Given user with multiple roles has submitted a phone number
  * user has received a verification code per SMS
  * user is on the "Enter verification code" page
  When user enters code correctly
  * user clicks "Next"
  Then user lands on the home screen of the last opened profile
