Feature: User can add new payment for student with multiple trainings

Scenario: User can add new payment for student with multiple trainings

Given user is on any page in the application
* user wants to add payment to a student with multiple trainings
When user clicks on the global "+ Add" button
* user selects "Add Payment"
* user selects student
* user selects training
Then user lands on the "Add payment" mask
* user can enter payment details
* user can save new payment
