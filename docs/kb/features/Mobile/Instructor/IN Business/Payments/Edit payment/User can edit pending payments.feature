Feature: User can edit pending payments

Scenario: User can edit pending payments

Given user is an instructor
        * user has pending payments
        * user is on the list of payments
        When user clicks the "Edit" button of a pending payment
        Then user sees the "Edit Payment" popup
        * user can edit amount
        * user can change payment type
        * user can edit description
        * user can change the student for which the payment is registered
        * after submitting, user returns to the list of payments
        * the edited payment is updated in the list of payments
