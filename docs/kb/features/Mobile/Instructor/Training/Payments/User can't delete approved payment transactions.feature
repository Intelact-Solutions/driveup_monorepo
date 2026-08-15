Feature: User can't delete approved payment transactions

Scenario: User can't delete approved payment transactions

Given user is on the financial flow page
    When user scrolls to a payment with status "approved"
    Then user sees transaction details
    But user sees no delete button for the transaction
