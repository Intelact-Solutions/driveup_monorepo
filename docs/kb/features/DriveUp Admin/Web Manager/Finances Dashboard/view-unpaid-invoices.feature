Feature: View unpaid invoices

  Scenario: User can click See all to view full list of unpaid invoices
  
  Given user is logged in as a driving school manager
  * driving school has unpaid invoices
  When user navigates to the "Finances" section
  * user clicks on the "See all" button in the "Invoices" section
  Then user is navigated to the "Invoices" page

  Scenario: User can sort invoices list by due date
  
  Given user is logged in as a driving school manager
  * driving school has unpaid invoices
  When user navigates to the "Finances" section
  * user clicks the header of the "Due date" column to change sorting
  Then user sees the invoices list sorted by due date from the nearest to the farthest
  * user can click the header of the "Due date" column again to change sorting from the farthest to the nearest

  Scenario: User can sort invoices list by invoice amount
  
  Given user is logged in as a driving school manager
  * driving school has unpaid invoices
  When user navigates to the "Finances" section
  * user clicks the header of the "Invoice amount" column to change sorting
  Then user sees the invoices list sorted by invoice amount from high to low
  * user can click the header of the "Invoice amount" column again to change sorting from low to high

  Scenario: User can view list of unpaid invoices
  
  Given user is logged in as a driving school manager
  * driving school has unpaid invoices
  When user navigates to the "Finances" section
  Then user sees the "Invoices" section
  * user sees a list of unpaid invoices
  * list is sorted alphabetically by student name A to Z
  * user sees details of each invoice
  | Student name | Phone number | Driving category |  | Invoice amount | Invoice number | Due date |
