Feature: Phone number is mandatory

Scenario: Phone number is mandatory

Given user is on the Profile Settings page
* user has all mandatory data
When user deletes phone number
* user leaves field
Then user sees an error message
* phone number input field is highlighted
