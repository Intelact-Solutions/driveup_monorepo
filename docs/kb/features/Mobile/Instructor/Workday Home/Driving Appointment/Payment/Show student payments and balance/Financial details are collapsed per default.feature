Feature: Financial details are collapsed per default

Scenario: Financial details are collapsed per default

Given user has a training
* training has generated costs
* student has already made payments
When user opens a driving session
* user navigates to the "Payment" tab of the driving session
Then financial details are collapsed and not visible for the user
* user can expand the financial details section by clicking "Show details"
