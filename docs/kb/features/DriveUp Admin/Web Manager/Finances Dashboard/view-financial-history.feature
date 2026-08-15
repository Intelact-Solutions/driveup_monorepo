Feature: View financial history

  Scenario: Change financial history period
  
  Given user is logged in as a driving school manager
  * driving school has sold services, received payments and incurred expenses
  When user navigates to the "Finances" section
  * user changes view to "Monthly"
  Then graph switches to monthly view
  * user sees graphical representations of the financial history for the current month
  * user sees graph for sold services
  * user sees graph for payments
  * user sees graph for expenses

  Scenario: Clicking on a point in the graph shows details of the select day as a popup
  
  Given user is in the "Finances" section
  * user sees graphical representations of the financial history
  When user clicks on a point in the graph
  Then user sees a popup with details of the selected day
  * popup includes details of sold services, payments and expenses for that day
  * popup can be closed by clicking outside of it

  Scenario: User can navigate between months
  
  Given user is logged in as a driving school manager
  * driving school has sold services, received payments and incurred expenses
  When user navigates to the "Finances" section
  * user changes the view to "Monthly"
  * user selects another month through moving back and forth with the chevrons
  Then user sees graphical representations of the financial history for the selected month

  Scenario: User can navigate between weeks
  
  Given user is logged in as a driving school manager
  * driving school has sold services, received payments and incurred expenses
  When user navigates to the "Finances" section
  * user selects another week through moving back and forth with the chevrons
  Then user sees graphical representations of the financial history for the selected week

  Scenario: User can view financial history
  
  Given user is logged in as a driving school manager
  * driving school has sold services, received payments and incurred expenses
  When user navigates to the "Finances" section
  Then user sees the financial history dashboard
  * user sees graphical representations of the financial history
  * default view is the weekly view with current week selected
  * user sees graph for sold services
  * user sees graph for payments
  * user sees graph for expenses

  Scenario: User sees card with sum of sold services
  
  Given user is logged in as a driving school manager
  * driving school has sold services, received payments and incurred expenses
  When user navigates to the "Finances" section
  Then user sees a card with the sum of sold services
  * sum is updated when user adds new driving appointment
  * sum is updated when user adds a new course training to student

  Scenario: User sees card with sum of total expenses
  
  Given user is logged in as a driving school manager
  * driving school has sold services, received payments and incurred expenses
  When user navigates to the "Finances" section
  Then user sees a card with the sum of total expenses
  * sum is updated when user adds a new expense
  * clicking the card leads user to the detailed list of expenses

  Scenario: User sees card with sum of total payments
  
  Given user is logged in as a driving school manager
  * driving school has sold services, received payments and incurred expenses
  When user navigates to the "Finances" section
  Then user sees a card with the sum of total payments
  * sum is updated with every change in the financial flow
  * clicking the card leads user to the financial flow page
