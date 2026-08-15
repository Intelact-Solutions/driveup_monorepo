Feature: User can skip a previously rejected expense

Scenario: User can skip a previously rejected expense

Given user is manager
        * user is on the "Cash handover" page for a selected instructor
        * user has previously rejected an expense
        When user clicks on the "Skip" button of the rejected expense
        Then the expense status changes to "Skipped"
        * skipped expense is excluded from the cash handover calculation summary
        * after the cash handover is submitted, the skipped expense does not remain in the "Skipped" state for future handovers
