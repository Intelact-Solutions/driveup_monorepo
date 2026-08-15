Feature: User sees error message if promotion code is wrong

Scenario: User sees error message if promotion code is wrong

Given user is on the "Promotion Code" screen
  When user enters an invalid promotion code
  Then user sees an red failure message
  * promotion code is not applied
