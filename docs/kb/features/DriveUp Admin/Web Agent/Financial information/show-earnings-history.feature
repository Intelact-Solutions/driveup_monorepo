Feature: Show earnings history

  Scenario: User can click on the graph to see earnings for a specific period
  
  Given user is logged in as sales agent
  * user has multiple clients with earnings history
  When user opens the Earnings module
  * user clicks on a specific quarter in the graph
  Then user sees detailed earnings information for that period as a pop-up
  | period | revenue amount |

  Scenario: User sees earnings history as a graph
  
  Given user is logged in as sales agent
  * user has multiple clients with revenue history
  When user opens the Earnings module
  Then user sees earnings history as a graph
  * the graph shows quarterly earnings of the last 6 quarters
