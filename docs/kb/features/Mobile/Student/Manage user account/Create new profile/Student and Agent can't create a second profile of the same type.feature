Feature: Student and Agent can't create a second profile of the same type

Scenario: Student and Agent can't create a second profile of the same type

Given user is on Profile Settings page
* user has a profile of the type <type>
When user clicks "Add new profile"
Then user sees list of profile types
* and profile type <type> is deactivated
* user can select any other available profile type

Examples:
|type|
|Student|
|Agent|
