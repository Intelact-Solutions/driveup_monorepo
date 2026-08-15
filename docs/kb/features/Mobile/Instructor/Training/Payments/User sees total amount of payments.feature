Feature: User sees total amount of payments

Scenario: User sees total amount of payments

Given user has a training
* training has generated costs
* student has already made payments
When user opens the "Payment" tab of the training
Then user sees total amount of payments
