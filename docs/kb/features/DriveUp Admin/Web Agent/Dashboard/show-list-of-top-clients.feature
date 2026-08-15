Feature: Show list of top clients

  Scenario: User can see list of top 5 clients
  
  Given user is logged in as sales agent
  * user has multiple clients
  When user opens the Home screen
  Then user sees a list with the 5 clients with the most revenue
  * user sees details of each clients
  | Company name and logo | Company address | Monthly revenue | End date of subscription |
