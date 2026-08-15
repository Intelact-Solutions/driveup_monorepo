Feature: User can't add new expense with missing mandatory fields

Scenario: User can't add new expense with missing mandatory fields

Given user is on any page in the application
When user clicks on the global "+ Add" button
* user adds all data except <mandatory_field>
* user submits the form
Then user sees error message
* no expense is added

Examples:
|mandatory_field|
|Amount|
|Category|
