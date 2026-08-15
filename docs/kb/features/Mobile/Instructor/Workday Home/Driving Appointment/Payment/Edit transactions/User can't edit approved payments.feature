Feature: User can't edit approved payments

Scenario: User can't edit approved payments

Given user is on the financial flow page
    When user scrolls to a payment with status "approved"
    Then user sees transaction details
    But user sees no edit button for the transaction
