Feature: User can see detailed financial flow

Scenario: User can see detailed financial flow

Given user is on the "Payment tab" of a driving training
When user scrolls down the page
Then user sees a detailed financial flow
* the flow shows every financial transaction between the driving school and the student
| cash payments | invoice payments | refunds | discounts |
* transactions are sorted based on date with newest on top
