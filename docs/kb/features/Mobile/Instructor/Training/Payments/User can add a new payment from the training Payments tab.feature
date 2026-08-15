Feature: User can add a new payment from the training Payments tab

Scenario: User can add a new payment from the training Payments tab

Given user has a training
* user is on the "Payments" page
When user clicks on "Add Payment"
* user selects payment type <type>
* user enters payment amount
* user enters description (optional)
* user submits form
Then new payment is added
* new payment is shown in the "Financial Flow" section

Examples:
|type|
|cash|
|transaction|
