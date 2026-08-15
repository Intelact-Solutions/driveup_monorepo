Feature: User can edit bank account details

Scenario: User can edit bank account details

Given user is logged in as sales agent
        * user has one bank account added
        When user opens the Financial Information module
        And user clicks on "Edit" button next to the bank account
        And user updates the bank account details
        And user submits the form
        Then user sees a confirmation message "Bank account details updated successfully"
        And user sees the updated bank account details in the Financial Information module
