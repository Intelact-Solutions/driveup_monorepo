Feature: User can remove bank account

Scenario: User can remove bank account

Given user is logged in as sales agent
        * user has one bank account added
        When user opens the Financial Information module
        And user clicks on "Remove" button next to the bank account
        And user confirms the removal
        Then user sees a confirmation message "Bank account removed successfully"
        And user sees no bank account details in the Financial Information module
