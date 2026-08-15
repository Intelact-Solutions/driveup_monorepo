Feature: User can't delete reviewed payments

Scenario: User can't delete reviewed payments

Given user is an instructor
        * user has payments which have been decided in a handover process
        When user opens the list of payments
        Then user sees no "Delete" button for reviewed payments
