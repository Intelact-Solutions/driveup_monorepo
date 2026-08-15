Feature: Manage discounts

  Scenario: User can add discount
  
  Given user is manager
  * user is on the "Financial flow" page
  When user clicks on the "Add discount" button
  * user fills in all required fields in the "Add discount" form
  * user clicks on the "Submit" button
  Then the new discount appears in the list of financial transactions
  * discount is automatically approved
  * a negative value transaction (e.g. -120) is added to the list of financial transactions

  Scenario: User can cancel discount
  
  Given user is manager
  * user is on the "Financial flow" page
  * user has a discount in the list of financial transactions
  When user clicks on the discount item in the list
  * user clicks on the "Cancel discount" button in the discount details sidebar
  * user confirms cancellation
  Then the discount status changes to "Cancelled"
  * cancelled discount remains in the list of financial transactions with status "Cancelled"
  * a positive value cancellation item (e.g. + 120 ) is added to the list of transactions

  Scenario: User can navigate to training from discount details sidebar
  
  Given user is manager
  * user is on the "Financial flow" page
  * user has a discount in the list of financial transactions
  When user clicks on the discount item in the list
  * user clicks on the "View training" button in the discount details sidebar
  Then user is navigated to the training details page for the associated training

  Scenario: User can see details of discount cancellation item in sidebar
  
  Given user is manager
  * user is on the "Financial flow" page
  * user has a cancellation item in the list of financial transactions
  When user clicks on the cancellation item in the list
  Then user sees cancellation details in the sidebar
  |student name and picture|training|"View training" button|cancellation details|status|description| invoice number (if type = invoice)|
  * user can see an expandable section with the details of the cancelled discount

  Scenario: User can view discount details in sidebar
  
  Given user is manager
  * user is on the "Financial flow" page
  When user clicks on a discount item in the list
  Then user sees discount details in the sidebar
  |student name and picture|training|"View training" button|discount details|status|description| invoice number (if type = invoice)|

  Scenario: User can't delete discount
  
  Given user is manager
  * user is on the "Financial flow" page
  * user has a discount in the list of financial transactions
  When user clicks on the discount item in the list
  Then user does not see a "Delete" button in the discount details sidebar

  Scenario: User can't edit discount
  
  Given user is manager
  * user is on the "Financial flow" page
  * user has a discount in the list of financial transactions
  When user clicks on the discount item in the list
  Then user does not see an "Edit" button in the discount details sidebar
