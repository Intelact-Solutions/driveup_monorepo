Feature: User can delete unapproved payment transactions

Scenario: User can delete unapproved payment transactions

Given user is on the financial flow page
    When user scrolls to a payment with status "unapproved"
    * user clicks on the delete button
    * confirms deletion
    Then transaction is removed from the financial flow page
