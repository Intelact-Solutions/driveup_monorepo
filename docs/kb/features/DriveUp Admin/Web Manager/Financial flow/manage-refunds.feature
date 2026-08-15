Feature: Manage refunds

  Scenario: User can add refund
  
  Given user is manager
  * user is on the "Financial flow" page
  When user clicks on the "Add refund" button
  * user fills in all required fields in the "Add refund" form
  * user clicks on the "Submit" button
  Then the new refund appears in the list of financial transactions
  * refund is automatically approved
  * a negative value transaction (e.g. -120) is added to the list of financial transactions

  Scenario: User can cancel refund
  
  Given user is manager
  * user is on the "Financial flow" page
  * user has a refund in the list of financial transactions
  When user clicks on the refund item in the list
  * user clicks on the "Cancel refund" button in the refund details sidebar
  * user confirms cancellation
  Then the refund status changes to "Cancelled"
  * cancelled refund remains in the list of financial transactions with status "Cancelled"
  * a positive value cancellation item (e.g. + 120 ) is added to the list of transactions

  Scenario: User can navigate to training from refund details sidebar
  
  Given user is manager
  * user is on the "Financial flow" page
  * user has a refund in the list of financial transactions
  When user clicks on the refund item in the list
  * user clicks on the "View training" button in the refund details sidebar
  Then user is navigated to the training details page for the associated training

  Scenario: User can see details of refund cancellation item in sidebar
  
  Given user is manager
  * user is on the "Financial flow" page
  * user has a cancellation item in the list of financial transactions
  When user clicks on the cancellation item in the list
  Then user sees cancellation details in the sidebar
  |student name and picture|training|"View training" button|cancellation details|status|description| invoice number (if type = invoice)|
  * user can see an expandable section with the details of the cancelled refund

  Scenario: User can view refund details in sidebar
  
  Given user is manager
  * user is on the "Financial flow" page
  When user clicks on a refund item in the list
  Then user sees refund details in the sidebar
  |student name and picture|training|"View training" button|refund details|status|description| invoice number (if type = invoice)|

  Scenario: User can't delete refund
  
  Given user is manager
  * user is on the "Financial flow" page
  * user has a refund in the list of financial transactions
  When user clicks on the refund item in the list
  Then user does not see a "Delete" button in the refund details sidebar

  Scenario: User can't edit refund
  
  Given user is manager
  * user is on the "Financial flow" page
  * user has a refund in the list of financial transactions
  When user clicks on the refund item in the list
  Then user does not see an "Edit" button in the refund details sidebar
