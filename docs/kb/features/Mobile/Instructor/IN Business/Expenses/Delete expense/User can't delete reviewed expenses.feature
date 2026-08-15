Feature: User can't delete reviewed expenses

Scenario: User can't delete reviewed expenses

Given user is an instructor
                * user has expenses which have been decided in a handover process
                * user is on the list of expenses
                When user opens the list of expenses
                Then user sees no "Delete" button for reviewed expenses
