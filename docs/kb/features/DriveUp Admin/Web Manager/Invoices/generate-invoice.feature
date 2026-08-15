Feature: Generate invoice

  Scenario: User can generate an invoice from a draft invoice
  
  Given user is driveUp admin
  * user is on the list of invoices
  When user clicks on the draft invoice in the list
  * user clicks on the "Edit invoice" button on the sidebar
  * user fills in all mandatory fields in the edit form
  * user clicks "Generate invoice"
  Then edit form is closed
  * user sees a generated invoice in the list of invoices
  * invoice has an invoice number
  * invoice status is changed to "Generated"

  Scenario: User can view PDF of a generated invoice
  
  Given user is driveUp admin
  * user is on the list of invoices
  * user has a generated invoice in the list
  When user opens a generated invoice on the sidebar
  * user clicks on "View PDF" button
  Then user sees the PDF of the invoice in a new tab
  * user can download the PDF

  Scenario: User cannot edit a generated invoice
  
  Given user is driveUp admin
  * user is on the list of invoices
  * user has a generated invoice in the list
  When user opens a generated invoice on the sidebar
  Then user does not see an "Edit invoice" button on the sidebar
  * user sees "Mark as paid" button
  * user sees "View PDF" button
