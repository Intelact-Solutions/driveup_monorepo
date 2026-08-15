Feature: User sees balance and total sum of payments

Scenario: User sees balance and total sum of payments

Given user is on the detailed view of a driving training
When user opens the "Payment tab"
Then user sees current balance on the left side
* user sees total sum of payments on the right side
