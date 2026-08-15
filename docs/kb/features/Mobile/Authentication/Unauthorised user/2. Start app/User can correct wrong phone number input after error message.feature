Feature: User can correct wrong phone number input after error message

Scenario: User can correct wrong phone number input after error message

Given the user enters a phone number in an incorrect format
  * the system displays an error message 
  When the user corrects the phone number format
  Then the phone number is accepted
  And the user can proceed to the next step
