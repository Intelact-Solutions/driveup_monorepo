Feature: User can delete pending expenses

Scenario: User can delete pending expenses

Given user is an instructor
                * user has pending expenses
                * user is on the list of expenses
                When user clicks the "Delete" button of a pending expense                
                * user confirms deletion
                Then user sees a success message
                * deleted expense is removed from the list of expenses
