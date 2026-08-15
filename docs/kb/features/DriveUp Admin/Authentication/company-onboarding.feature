Feature: Company onboarding

  Scenario: User can proceed without promotion code
  
  Given user is on the "Promotion Code" screen 
  * user has not entered a promotion code 
  When user proceeds without a confirmation code
  Then user sees congrats and info pages 
  * user lands on newly created profile
