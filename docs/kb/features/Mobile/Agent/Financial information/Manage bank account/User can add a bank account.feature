Feature: User can add a bank account

Scenario: User can add a bank account

Given user is logged in as sales agent
        * user has no bank account added
        When user opens the Financial Information module
        And user clicks on "Add Bank Account" button
        And user enters valid bank account details            
        And user submits the form
        Then user sees a confirmation message "Bank account added successfully"
        And user sees the added bank account details in the Financial Information module
