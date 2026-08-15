Feature: User can view financial transaction details

Scenario: User can view financial transaction details

Given user has a training
* training has generated costs
* student has multiple payments, which have ben approved or rejected
When user opens a driving session
* user navigates to the "Payment" tab of the driving session
Then user can expand the financial transaction, to view details
