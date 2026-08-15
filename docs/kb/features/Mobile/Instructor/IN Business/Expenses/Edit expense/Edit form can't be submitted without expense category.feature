Feature: Edit form can't be submitted without expense category

Scenario: Edit form can't be submitted without expense category

Given user is an instructor
                * user has pending expenses
                * user is on the list of expenses
                When user clicks the "Edit" button of a pending expense
                * user unselects the expense category field in the "Edit Expense" popup
                Then user can't submit the form without an expense category
                * user sees an error message that expense category is required
