Feature: User can add new payment from the list of payments

Scenario: User can add new payment from the list of payments

Given user is an instructor
        * user is on the list of payments
        When user clicks the "Add Payment" at the bottom of the page
        * user selects a student in the list of students
        Then user sees the "Add Payment" popup
        * user can add a new payment from the popup
        * after submitting, user returns to the list of payments
