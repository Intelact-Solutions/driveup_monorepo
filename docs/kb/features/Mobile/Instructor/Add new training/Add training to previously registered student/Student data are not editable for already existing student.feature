Feature: Student data are not editable for already existing student

Scenario: Student data are not editable for already existing student

Given user is on Training tab
* user has opened the "Add new training" popup
When user selects an existing student from the search results list
Then user can't edit student personal data
