Feature: Edit form can't be submitted without amount

Scenario: Edit form can't be submitted without amount

Given user is an instructor
                * user has pending expenses
                * user is on the list of expenses
                When user clicks the "Edit" button of a pending expense
                * user clears the amount field in the "Edit Expense" popup
                Then user can't submit the form without an amount
                * user sees an error message that amount is required
