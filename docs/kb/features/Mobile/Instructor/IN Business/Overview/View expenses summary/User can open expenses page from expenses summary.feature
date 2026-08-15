Feature: User can open expenses page from expenses summary

Scenario: User can open expenses page from expenses summary

Given user is an instructor
    * user is on the "Business Overview" page
    When user clicks the header of the expenses section
    Then user is navigated to the "Expenses" page
    * user sees detailed list of expenses
