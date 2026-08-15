Feature: User can see detailed financial flow

Scenario: User can see detailed financial flow

Given user is on the "Payment tab" of a course
When user scrolls down the page
Then user sees a detailed financial flow
* the flow shows every financial transaction between the driving school and the student
| cash payments | invoice payments | refunds | discounts |
* the cancellation of any transaction is shown as an independent item
* transactions are sorted based on date with newest on top
