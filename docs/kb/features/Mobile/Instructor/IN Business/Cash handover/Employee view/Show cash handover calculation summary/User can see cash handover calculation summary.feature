Feature: User can see cash handover calculation summary

Scenario: User can see cash handover calculation summary

Given user is instructor
        * user has both expenses and payments pending
        * user is on the "Cash handover" page
        When user scrolls to the summary section
        Then user sees sum of included payments
        * user sees sum of accepted expenses
        * user sees handover balance (included payments - accepted expenses)
