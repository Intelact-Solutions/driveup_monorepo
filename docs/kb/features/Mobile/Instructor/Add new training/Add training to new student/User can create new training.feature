Feature: User can create new training

Scenario: User can create new training

Given user is on Training tab
When user clicks "Add new student" on an empty list OR the same button on the global add menu
* user enters phone number
* user uploads student profile picture (optional)
* user selects category
* user selects instructor
* user clicks "Save"
Then popup is closed
* new driving training is created for the student
* user sees success message
