Feature: Balance is equal to the sum of costs and payments

Scenario: Balance is equal to the sum of costs and payments

Given user is logged in
* user has an active driving training
When user opens the detailed view of a driving training
* user scrolls to the training finances
Then user sees current balance
* balance is equal to the sum of generated costs and payments
