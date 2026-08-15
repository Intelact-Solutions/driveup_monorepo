Feature: User can't edit reviewed expenses

Scenario: User can't edit reviewed expenses

Given user is an instructor
                * user has expenses which have been decided in a handover process
                * user is on the list of expenses
                When user opens the list of expenses
                Then user sees no "Edit" button for reviewed expenses
