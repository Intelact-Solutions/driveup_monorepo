Feature: Show company financial history

  Scenario: User can switch view to current day
  
  Given user is driveUp admin
  When user logs in
  Then user lands per default on the home dashboard
  * user sees a graphical representation of the company financial history
  * user clicks on the "Today" button
  * the graph updates to show data for the current day
  * user can hover over data points to see exact values

  Scenario: User can switch view to last 7 days
  
  Given user is driveUp admin
  When user logs in
  Then user lands per default on the home dashboard
  * user sees a graphical representation of the company financial history
  * user clicks on the "Last 7 days" button
  * the graph updates to show data for the last 7 days
  * user can hover over data points to see exact values

  Scenario: User sees graphical representation of company financial history
  
  Given user is driveUp admin
  When user logs in
  Then user lands per default on the home dashboard
  * user sees a graphical representation of the company financial history
  * user sees data for payments, expenses and sold services
  * the default view shows data for the last 30 days        
  * user can hover over data points to see exact values

  Scenario: User sees sum of sold services, payments and expenses for the selected period
  
  Given user is driveUp admin
  When user logs in
  Then user lands per default on the home dashboard
  * user sees a graphical representation of the company financial history
  * user sees sum of sold services, payments and expenses for the selected period below the graph        
  * values update when user changes the selected period
  * user can navigate to payments by clicking on the "Total Payments" card
  * user can navigate to expenses by clicking on the "Total Expenses" card
