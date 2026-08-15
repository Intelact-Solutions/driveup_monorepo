Feature: User can't add phone number with wrong format

Scenario: User can't add phone number with wrong format

Given user is on the start page
  When user enters a phone number which contains fewer characters than the minimum
  Then system displays an error message saying "Please enter a valid phone number"
  * user cannot proceed to the next step
