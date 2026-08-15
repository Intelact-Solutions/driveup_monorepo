Feature: Confirm online transaction

  Scenario: User can confirm a pending online transaction
  
  Given user is logged in as manager
  * user is on the "Online Transactions" page
  When user clicks a pending transaction to open details sidebar
  * user clicks the "Confirm" button for the transaction
  Then the transaction status is updated to "Confirmed"
  * transaction is removed from the list
  * status of the transaction in the overall financial flow is updated to "Confirmed"
