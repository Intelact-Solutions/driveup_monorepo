Feature: User sees balance and total Paid amount

Scenario: User sees balance and total Paid amount

Given user is on the detailed view of a driving training
When user opens the "Payment tab"
Then user sees current balance on the left side
* user sees total sum of the Paid amount on the right side
