Feature: User sees pending payments

Scenario: User sees pending payments

Given user is an instructor
        * user has pending payments
        When user opens the full list of payments
        Then user sees pending payments
        * each pending payment shows the same UI elements
| payment type | payment status| student picture, name and category | amount & currency | time & date | "Delete" button | "Edit" button |
