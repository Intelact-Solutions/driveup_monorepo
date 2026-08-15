Feature: User can delete pending payments

Scenario: User can delete pending payments

Given user is an instructor
        * user has pending payments
        * user is on the list of payments
        When user clicks the "Delete" button of a pending payment
        * user confirms deletion
        Then user returns to the list of payments
        * new cancellation item is created for the payment
        * cancelled payment is still visible in the list with the label "Cancelled"
