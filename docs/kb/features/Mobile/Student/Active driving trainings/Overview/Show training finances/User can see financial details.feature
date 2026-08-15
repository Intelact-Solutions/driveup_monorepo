Feature: User can see financial details

Scenario: User can see financial details

Given user is logged in
* user has an active driving training
When user opens the detailed view of a driving training
* user scrolls to the training finances
Then user sees current balance
* user sees sum of generated costs
* user sees sum of payments
