Feature: Manage bank account

  Scenario: User can add a bank account
  
  Given user is logged in as sales agent
  * user has no bank account added
  When user opens the Financial Information module
  And user clicks on "Add Bank Account" button
  And user enters valid bank account details            
  And user submits the form
  Then user sees a confirmation message "Bank account added successfully"
  And user sees the added bank account details in the Financial Information module

  Scenario: User can edit bank account details
  
  Given user is logged in as sales agent
  * user has one bank account added
  When user opens the Financial Information module
  And user clicks on "Edit" button next to the bank account
  And user updates the bank account details
  And user submits the form
  Then user sees a confirmation message "Bank account details updated successfully"
  And user sees the updated bank account details in the Financial Information module

  Scenario: User can remove bank account
  
  Given user is logged in as sales agent
  * user has one bank account added
  When user opens the Financial Information module
  And user clicks on "Remove" button next to the bank account
  And user confirms the removal
  Then user sees a confirmation message "Bank account removed successfully"
  And user sees no bank account details in the Financial Information module
