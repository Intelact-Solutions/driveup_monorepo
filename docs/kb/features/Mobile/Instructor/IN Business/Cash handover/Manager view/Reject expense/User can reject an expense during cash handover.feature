Feature: User can reject an expense during cash handover

Scenario: User can reject an expense during cash handover

Given user is manager
        * user is on the "Cash handover" page for a selected instructor
        When user clicks on the "Reject" button of an expense
        Then the expense status changes to "Rejected"
        * rejected expense is excluded from the cash handover calculation summary
        * after the cash handover is submitted, the rejected expense is removed from the list
