Feature: User can include a previously skipped payment

Scenario: User can include a previously skipped payment

Given user is manager
        * user is on the "Cash handover" page for a selected instructor
        * user has previously skipped a payment
        When user clicks on the "Include" button of the skipped payment
        Then the payment status changes back to "Included"
        * payment is included in the cash handover calculation summary
        * after the cash handover is submitted, payment is removed from the list for future handovers
