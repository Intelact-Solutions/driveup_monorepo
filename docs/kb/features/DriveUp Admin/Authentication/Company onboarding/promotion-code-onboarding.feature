Feature: Promotion code & onboarding

  Scenario: User can apply promotion code
  
  Given user is on the "Promotion Code" screen
  When user enters a valid 6 characters promotion code
  Then promotion code is accepted
  * user sees a green success message
  * user can proceed with the profile creation 
  * user can return to the previous screen by clicking the back button

  Scenario: User can complete onboarding by passing through all info pages
  
  Given user has entered mandatory data and is on the info page section of the onboarding process
  When user views each info page about the features of the app
  * user clicks the "Next" button on each info page
  Then user completes the onboarding process
  And user lands on the Home screen

  Scenario: User can correct wrong code and re-submit in the same session
  
  Given user is on the "Promotion Code" screen
  When user enters an invalid promotion code
  Then user sees an error message saying "Invalid promotion code"
  * promotion code is not applied

  Scenario: User can not navigate back and forth in the info pages
  
  Given user is on one of the info pages in the onboarding process
  When user is on the second info page
  Then user sees only "Next" button
  * user can not navigate back to the previous info page

  Scenario: User sees error message if promotion code is wrong
  
  Given user is on the "Promotion Code" screen
  When user enters an invalid promotion code
  Then user sees an red failure message
  * promotion code is not applied
