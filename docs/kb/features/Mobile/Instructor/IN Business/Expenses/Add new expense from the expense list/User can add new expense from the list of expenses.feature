Feature: User can add new expense from the list of expenses

Scenario: User can add new expense from the list of expenses

Given user is an instructor
    * user is on the "Business Overview" page
    When user clicks the "Add Expense" at the bottom of the page
    Then user sees the "Add Expense" popup
    * user can add a new expense from the popup
    * after submitting, user returns to the list of expenses
