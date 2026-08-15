Feature: Cancel online transaction

  Scenario: User can cancel a pending online transaction
  
  Given user is logged in as manager
  * user is on the "Online Transactions" page
  When user clicks a pending transaction to open details sidebar
  * user clicks the "Cancel" button for the transaction
  * user optionally adds description
  * user confirms cancellation
  Then the transaction status is updated to "Cancelled"
  * online transaction is removed from the list
  * a new cancellation item is added to the financial flow for the cancelled online payment
