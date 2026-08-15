Feature: Show promotion code and banking details

  Scenario: User can see own promotion code on the Home screen
  
  Given user is logged in as sales agent
  When user opens the Home screen
  Then user sees own promotion code
  * user can copy the promotion code to clipboard

  Scenario: User sees banking details on the dashboard
  
  Given user is sales agent
  When user logs in to driveUp
  Then user lands on the dashboard
  * user sees banking details at the top of the page
  * clicking on the card leads to the "Financial information" page
