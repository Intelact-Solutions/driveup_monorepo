Feature: User can add new payment for student with a single training

Scenario: User can add new payment for student with a single training

Given user is on any page in the application
* user wants to add payment to a student who has a single training
When user clicks on the global "+ Add" button
* user selects "Add Payment"
* user selects student
Then user lands on the "Add payment" mask
* user can enter payment details
* user can save new payment
