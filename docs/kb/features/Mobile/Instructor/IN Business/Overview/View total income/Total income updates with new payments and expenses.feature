Feature: Total income updates with new payments and expenses

Scenario: Total income updates with new payments and expenses

Given user is an instructor
    * user has multiple payments and expenses
    * user sees the total income on the "Business Overview" page
    When a new payment or expense is added
    Then the total income updates to reflect the new payment or expense
