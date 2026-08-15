Feature: Show list of revenues

  Scenario: Revenue not yet transferred to the agent's account is shown with status Pending
  
  Given user is logged in as sales agent
  * user has multiple clients with revenue history including some that have not been paid out
  When user opens the Earnings module
  Then user sees a list of revenues
  * revenue entries that have not been transferred to the agent's account are shown with status "Pending"

  Scenario: Revenue transferred to the agent's account is shown with status Paid
  
  Given user is logged in as sales agent
  * user has multiple clients with revenue history including some that have been paid out
  When user opens the Earnings module
  Then user sees a list of revenues
  * revenue entries that have been transferred to the agent's account are shown with status "Paid"

  Scenario: User can see list of revenues
  
  Given user is logged in as sales agent
  * user has multiple clients with revenue history
  When user opens the Earnings module
  Then user sees a list of revenues
  * user sees details of each revenue entry
  | Client name, address and logo | Period | Revenue amount | Status |
  And user can scroll through the list

  Scenario: User sees total revenue amount at the top of the list
  
  Given user is logged in as sales agent
  * user has multiple clients with revenue history
  When user opens the Earnings module
  Then user sees total revenue amount at the top of the list
  * total revenue amount is the sum of all individual revenue entries in the list
  * total revenue amount is updated when new revenue entries are added
