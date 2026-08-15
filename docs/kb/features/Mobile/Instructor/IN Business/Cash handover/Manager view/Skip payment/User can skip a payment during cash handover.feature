Feature: User can skip a payment during cash handover

Scenario: User can skip a payment during cash handover

Given user is manager
        * user is on the "Cash handover" page for a selected instructor
        When user clicks on the "Skip" button of a payment
        Then the payment status changes to "Skipped"
        * skipped payment is excluded from the cash handover calculation summary
        * after the cash handover is submitted, the skipped payment does not remain in the "Skipped" state for future handovers
