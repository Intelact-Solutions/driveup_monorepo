Feature: User can't edit refund items

Scenario: User can't edit refund items

Given user is on the financial flow page
    When user scrolls to a transaction item of type "refund"
    Then user sees transaction details
    But user sees no edit button for the transaction
