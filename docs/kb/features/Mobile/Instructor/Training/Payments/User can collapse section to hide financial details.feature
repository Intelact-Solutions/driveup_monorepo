Feature: User can collapse section to hide financial details

Scenario: User can collapse section to hide financial details

Given user has a training
* training has generated costs
* student has already made payments
When user opens the "Payment" tab of the training
* user clicks on "Hide details"
Then list of payment details is collapsed
