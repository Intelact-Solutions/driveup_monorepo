Feature: User sees message when no financial data is available

Scenario: User sees message when no financial data is available

Given user is an instructor
    * user has no payments
    * user has no expenses
    When user opens the "Business" module
    Then graph is hidden 
    * user sees a message indicating that no financial data is available
