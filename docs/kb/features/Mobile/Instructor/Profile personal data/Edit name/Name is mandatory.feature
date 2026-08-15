Feature: Name is mandatory

Scenario: Name is mandatory

Given user is on the Profile Settings page
* user has all mandatory data
When user deletes name
* user leaves field
Then user sees an error message
* name input field is highlighted
