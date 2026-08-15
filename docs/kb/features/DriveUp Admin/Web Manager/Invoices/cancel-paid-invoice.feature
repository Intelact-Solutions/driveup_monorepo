Feature: Cancel paid invoice

  Scenario: User can cancel a paid invoice
  
  Given user is driveUp admin
  * user is on the list of invoices
  * user has a paid invoice in the list
  When user opens a paid invoice on the sidebar
  * user clicks on "Cancel invoice" button
  * user fills in the reason for cancellation in a pop-up
  * user confirms the cancellation
  Then user sees a cancelled invoice in the list of invoices
  * invoice status is changed to "Cancelled"
  * new cancellation item for the invoice payment is added to the financial flow
  * the corresponding payment of the invoice on the financial flow is marked as cancelle

  Scenario: View PDF button is not available for cancelled invoices
  
  Given user is driveUp admin
  * user is on the list of invoices
  * user has a cancelled invoice in the list
  When user opens a cancelled invoice on the sidebar
  Then user does not see "View PDF" button on the sidebar
  * user does not see "Edit invoice" button on the sidebar
  * user does not see "Mark as paid" button on the sidebar
  * user sees "Cancelled" status on the sidebar
