Feature: User can expand section to show summary of costs and payments

Scenario: User can expand section to show summary of costs and payments

Given user has a training
* training has generated costs
* student has already made payments
When user opens a driving session
* user navigates to the "Payment" tab of the driving session
* user clicks on "Show details"
Then summary of costs and payment is expanded
