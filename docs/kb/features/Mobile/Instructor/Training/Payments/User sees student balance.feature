Feature: User sees student balance

Scenario: User sees student balance

Given user has a training
* training has generated costs
* student has already made payments
When user opens the "Payment" tab of the training
Then user sees student balance
