Feature: User can accept a previously skipped expense

Scenario: User can accept a previously skipped expense

Given user is manager
        * user is on the "Cash handover" page for a selected instructor
        * user has previously skipped an expense
        When user clicks on the "Accept" button of the skipped expense
        Then the expense status changes back to "Accepted"
        * expense is included in the cash handover calculation summary
        * after the cash handover is submitted, expense is removed from the list for future handovers
