Feature: View invoices

  Scenario: Invoices with overdue payment are highlighted
  
  Given user is driveUp admin
  * user has invoices with overdue payment
  When user opens the list of invoices
  Then those invoices are highlighted in red in the list
  * user sees an "Overdue" label next to the status of those invoices

  Scenario: User can view invoice details
  
  Given user is driveUp admin
  When user navigates to "Finances" > "Invoices"
  * user clicks on an invoice from the list
  Then user sees the invoice details as a sidebar
  * user sees student name and profile picture
  * user sees training details
  * user sees invoice details
  | created by | Invoice number | Invoice date | Due date | Amount | Status |
  * user sees action buttons based on the status of the invoice

  Scenario: User can view list of invoices
  
  Given user is driveUp admin
  When user navigates to "Finances" > "Invoices"
  Then user should see the list of invoices
  * for each invoice, user sees the following details:
  | Invoice Number | Student | Amount | Invoice date | Due date | Status |

  Scenario: User can view PDF of a generated invoice
  
  Given user is driveUp admin
  * user is on the list of invoices
  * user has a generated invoice in the list
  When user opens a generated invoice on the sidebar
  * user clicks on "View PDF" button
  Then user sees the PDF of the invoice in a new tab
  * user can download the PDF
