Feature: Financial details are expanded per default

Scenario: Financial details are expanded per default

Given user has a training
* training has generated costs
* student has already made payments
When user opens the "Payment" tab of the training
Then financial details are expanded and shown to the user
* user can collapse the financial details section by clicking "Hide details"
