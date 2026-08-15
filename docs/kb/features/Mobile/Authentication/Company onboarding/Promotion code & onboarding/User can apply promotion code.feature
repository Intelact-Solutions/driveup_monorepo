Feature: User can apply promotion code

Scenario: User can apply promotion code

Given user is on the "Promotion Code" screen
  When user enters a valid 6 characters promotion code
  Then promotion code is accepted
  * user sees a green success message
  * user can proceed with the profile creation 
  * user can return to the previous screen by clicking the back button
