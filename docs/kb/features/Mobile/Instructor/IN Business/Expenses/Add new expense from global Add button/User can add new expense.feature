Feature: User can add new expense

Scenario: User can add new expense

Given user is on any page in the application
When user clicks on the global "+ Add" button
* user selects "Add Expense"
* user enters amount
* user selects category
* user selects description
* user uploads file
* user submits form
Then new expense is added to the list of expenses for the instructor
* new expense is visible on the list of expenses on the admin
