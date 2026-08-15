Feature: User sees approved payments

Scenario: User sees approved payments

Given user is an instructor
        * user has approved payments
        When user opens the full list of payments
        Then user sees approved payments
        * each approved payment shows the same UI elements
| payment type | payment status| student picture, name and category | amount & currency | time & date |
