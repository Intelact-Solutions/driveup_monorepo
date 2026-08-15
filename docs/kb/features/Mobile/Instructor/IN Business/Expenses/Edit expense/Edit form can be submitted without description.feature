Feature: Edit form can be submitted without description

Scenario: Edit form can be submitted without description

Given user is an instructor
                * user has pending expenses
                * user is on the list of expenses
                When user clicks the "Edit" button of a pending expense
                * user clears the description field in the "Edit Expense" popup
                Then user can submit the form without a description
                * after submitting, user returns to the list of expenses
                * the edited expense is updated in the list of expenses
