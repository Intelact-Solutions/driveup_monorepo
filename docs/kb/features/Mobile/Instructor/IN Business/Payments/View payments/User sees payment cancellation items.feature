Feature: User sees payment cancellation items

Scenario: User sees payment cancellation items

Given user is an instructor
        * user has payment cancellations
        When user opens the full list of payments
        Then user sees payment cancellations
        * each payment cancellation shows the same UI elements
| payment type | student picture, name and category | amount as a negative value | time & date | info icon |
