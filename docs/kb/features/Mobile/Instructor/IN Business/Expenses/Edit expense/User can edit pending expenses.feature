Feature: User can edit pending expenses

Scenario: User can edit pending expenses

Given user is an instructor
                * user has pending expenses
                * user is on the list of expenses
                When user clicks the "Edit" button of a pending expense
                Then user sees the "Edit Expense" popup
                * user can edit amount
                * user can edit description
                * user can replace receipt by uploading a new one
                * user can remove receipt
                * user can change expense category
                * after submitting, user returns to the list of expenses
                * the edited expense is updated in the list of expenses
