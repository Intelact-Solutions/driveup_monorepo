Feature: User can add phone number

Scenario: User can add phone number

Given user is on the start page
  When user enters a valid phone number
  * user clicks "Start"
  Then user receives an SMS confirmation code
  * user can proceed to the next step
