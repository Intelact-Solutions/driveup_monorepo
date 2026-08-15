Feature: View list of online transactions

  Scenario: User can view details of a specific transaction
  
  Given user is logged in as a manager
  * user is on the Online Transactions page
  When user checks on a specific transaction
  Then user sees all payment details
  * user sees "Confirm" button for unconfirmed transactions
  * user sees "Cancel" button for both pending and confirmed transactions

  Scenario: User can view list of online transactions
  
  Given user is logged in as a manager
  When user navigates to the Online Transactions page
  Then user sees all online transactions
  * transactions are sorted by date & time with newest on top
