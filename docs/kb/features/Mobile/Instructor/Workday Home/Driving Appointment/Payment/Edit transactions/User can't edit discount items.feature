Feature: User can't edit discount items

Scenario: User can't edit discount items

Given user is on the financial flow page
    When user scrolls to a transaction item of type "discount"
    Then user sees transaction details
    But user sees no edit button for the transaction
