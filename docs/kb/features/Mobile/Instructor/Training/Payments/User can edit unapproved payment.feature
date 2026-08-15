Feature: User can edit unapproved payment

Scenario: User can edit unapproved payment

Given user is on the financial flow page
    When user scrolls to a transaction with status "unapproved"
    * user clicks on the edit button 
    Then user sees the edit transaction form 
    * user can change the payment details 
    |amount|type|description |
