Feature: User can accept a previously rejected expense

Scenario: User can accept a previously rejected expense

Given user is manager
        * user is on the "Cash handover" page for a selected instructor
        * user has previously rejected an expense
        When user clicks on the "Accept" button of the rejected expense
        Then the expense status changes back to "Accepted"
        * expense is included in the cash handover calculation summary
        * after the cash handover is submitted, expense is removed from the list for future handovers
