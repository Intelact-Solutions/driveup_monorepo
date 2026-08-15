Feature: User sees total amount of payments

Scenario: User sees total amount of payments

Given user has a training
* training has generated costs
* student has already made payments
When user opens a driving session
* user navigates to the "Payment" tab of the driving session
Then user sees total amount of payments
