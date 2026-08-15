Feature: User sees details of financial transactions

Scenario: User sees details of financial transactions

Given user is on the "Payment tab" of a course
* user views the financial flow
When user focuses on a single financial flow element
Then user sees type of financial flow
| cash | invoice | refund | discount |
* user sees sum of financial transaction
* user sees date and time of financial transaction
* user can expand the card to see further details
|description|registered by|
