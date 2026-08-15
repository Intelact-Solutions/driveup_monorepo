Feature: Edit form can be submitted without description

Scenario: Edit form can be submitted without description

Given user is an instructor
        * user has pending payments
        * user is on the list of payments
        When user clicks the "Edit" button of a pending payment
        * user clears the description field in the "Edit Payment" popup
        Then user can submit the form without a description
        * after submitting, user returns to the list of payments
        * the edited payment is updated in the list of payments
