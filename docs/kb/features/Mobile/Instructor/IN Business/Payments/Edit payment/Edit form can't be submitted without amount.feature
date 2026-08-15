Feature: Edit form can't be submitted without amount

Scenario: Edit form can't be submitted without amount

Given user is an instructor
        * user has pending payments
        * user is on the list of payments
        When user clicks the "Edit" button of a pending payment
        * user clears the amount field in the "Edit Payment" popup
        Then user can't submit the form without an amount
        * user sees an error message that amount is required
