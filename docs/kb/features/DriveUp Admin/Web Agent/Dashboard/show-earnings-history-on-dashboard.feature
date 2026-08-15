Feature: Show earnings history on dashboard

  Scenario: User sees earnings history graph
  
  Given user is sales agent
  When user logs in to driveUp
  Then user lands on the dashboard
  * user sees income history graph
  * user can hover on any point to see details

  Scenario: User sees total earnings
  
  Given user is sales agent
  When user logs in to driveUp
  Then user lands on the dashboard
  * user sees sum of total income for the current year

  Scenario: User sees total sum of payments made to his account
  
  Given user is sales agent
  When user logs in to driveUp
  Then user lands on the dashboard
  * user sees sum of total sum of payments made to his account

  Scenario: User sees total sum of pending payments
  
  Given user is sales agent
  When user logs in to driveUp
  Then user lands on the dashboard
  * user sees sum of total payments which are pending
