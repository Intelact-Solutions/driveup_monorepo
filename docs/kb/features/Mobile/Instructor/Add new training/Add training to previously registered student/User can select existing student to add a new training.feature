Feature: User can select existing student to add a new training

Scenario: User can select existing student to add a new training

Given user is on Training tab
When user clicks "Add new training"
* user enters existing student phone number
* user selects student in the search results list
Then student data is automatically filled-out
* student data is not editable
* user can add category
* user can select transmission type
* user can create a new training by clicking "Add training"
* user sees success message after completing the process
