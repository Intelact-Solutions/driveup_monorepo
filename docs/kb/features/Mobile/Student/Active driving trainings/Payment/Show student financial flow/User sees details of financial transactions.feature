Feature: User sees details of financial transactions

Scenario: User sees details of financial transactions

Given user is on the "Payment tab" of a driving training
* user views the financial flow
When user focuses on a single financial flow element
Then user sees type of financial flow
| cash | invoice | refund | discount |
* user sees sum of financial transaction
* user sees date and time of financial transaction
* user sees name of person who registered the transaction
