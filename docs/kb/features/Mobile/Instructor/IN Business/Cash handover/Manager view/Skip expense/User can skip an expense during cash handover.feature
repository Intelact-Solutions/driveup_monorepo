Feature: User can skip an expense during cash handover

Scenario: User can skip an expense during cash handover

Given user is manager
        * user is on the "Cash handover" page for a selected instructor
        When user clicks on the "Skip" button of an expense
        Then the expense status changes to "Skipped"
        * skipped expense is excluded from the cash handover calculation summary
        * after the cash handover is submitted, the skipped expense does not remain in the "Skipped" state for future handovers
