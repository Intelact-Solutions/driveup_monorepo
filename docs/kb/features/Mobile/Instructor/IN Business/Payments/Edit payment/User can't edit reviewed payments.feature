Feature: User can't edit reviewed payments

Scenario: User can't edit reviewed payments

Given user is an instructor
        * user has payments which have been decided in a handover process
        * user is on the list of payments
        When user opens the list of payments
        Then user sees no "Edit" button for reviewed payments
