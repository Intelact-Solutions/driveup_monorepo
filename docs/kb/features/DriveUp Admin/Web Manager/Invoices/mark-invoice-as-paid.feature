Feature: Mark invoice as paid

  Scenario: User can mark a generated invoice as paid
  
  Given user is driveUp admin
  * user is on the list of invoices
  * user has a generated invoice in the list
  When user opens a generated invoice on the sidebar
  * user clicks on "Mark as paid" button
  Then invoice status is changed to "Paid"
  * invoice amount is added as a payment of type invoice into the financial flow
  * user sees "Paid" status for the invoice
  * "Mark as paid" button is no longer visible on the sidebar
  * user sees "View PDF" button on the sidebar

  Scenario: User cannot mark a draft invoice as paid
  
  Given user is driveUp admin
  * user is on the list of invoices
  * user has a draft invoice in the list
  When user opens a draft invoice on the sidebar
  Then user does not see "Mark as paid" button on the sidebar
  * user sees "Edit invoice" button on the sidebar
