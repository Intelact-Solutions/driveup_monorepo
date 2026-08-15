Feature: User can add a new payment from the Overview page

Scenario: User can add a new payment from the Overview page

Given user is instructor 
* instructor has a training
* user is on the detailed view of the training
When user clicks "Add Payment"
* user selects payment method 
|card|cash|
* user enters amount
* user enters description
* user clicks "Submit"
Then a new payment is registered in the system
