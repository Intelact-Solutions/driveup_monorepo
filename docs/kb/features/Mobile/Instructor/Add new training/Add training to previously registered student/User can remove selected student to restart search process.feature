Feature: User can remove selected student to restart search process

Scenario: User can remove selected student to restart search process

Given user is on Training tab
* user has opened the "Add new training" popup
* user has selected an existing student from the search results list
When student clicks on x
Then selected student is removed
* form is reset
* user can enter a new phone number and restart the process
