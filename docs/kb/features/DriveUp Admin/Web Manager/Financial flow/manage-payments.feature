Feature: Manage payments

  Scenario: User can add own payment
  
  Given user is manager
  * user is on the "Financial flow" page
  When user clicks on the "Add payment" button
  * user fills in all required fields in the "Add payment" form
  * user clicks on the "Submit" button
  Then the new payment appears in the list of financial transactions
  * payment is automatically approved

  Scenario: User can approve payment
  
  Given user is manager
  * user is on the "Financial flow" page
  * user has a pending payment in the list of financial transactions
  When user clicks on the payment item in the list
  * user clicks on the "Approve" button in the payment details sidebar
  * user confirms approval
  Then the payment status changes to "Approved"
  * approved payment is removed from the list of pending handovers

  Scenario: User can cancel approved payment
  
  Given user is manager
  * user is on the "Financial flow" page
  * user has an approved payment in the list of financial transactions
  When user clicks on the payment item in the list
  * user clicks on the "Cancel payment" button in the payment details sidebar
  * user confirms cancellation
  Then the payment status changes to "Cancelled"
  * cancelled payment remains in the list of financial transactions with status "Cancelled"
  * cancellation item for the payment appears in the list of financial transactions

  Scenario: User can navigate to training from payment details sidebar
  
  Given user is manager
  * user is on the "Financial flow" page
  * user has a payment in the list of financial transactions
  When user clicks on the payment item in the list
  * user clicks on the "View training" button in the payment details sidebar
  Then user is navigated to the training details page for the associated training

  Scenario: User can see details of payment cancellation item in sidebar
  
  Given user is manager
  * user is on the "Financial flow" page
  * user has a cancellation item in the list of financial transactions
  When user clicks on the cancellation item in the list
  Then user sees cancellation details in the sidebar
  |student name and picture|training|"View training" button|cancellation details|description|
  * user can see an expandable section with the details of the cancelled payment

  Scenario: User can view payment details in sidebar
  
  Given user is manager
  * user is on the "Financial flow" page
  When user clicks on a payment item in the list
  Then user sees payment details in the sidebar
  |student name and picture|training|"View training" button|payment details|status|description| invoice number (if type = invoice)|
  * user sees payment status
  |Pending|Approved|Cancelled|

  Scenario: User can't delete payment
  
  Given user is manager
  * user is on the "Financial flow" page
  * user has a payment in the list of financial transactions
  When user clicks on the payment item in the list
  Then user does not see a "Delete" button in the payment details sidebar

  Scenario: User can't edit payment
  
  Given user is manager
  * user is on the "Financial flow" page
  * user has a payment in the list of financial transactions
  When user clicks on the payment item in the list
  Then user does not see an "Edit" button in the payment details sidebar
