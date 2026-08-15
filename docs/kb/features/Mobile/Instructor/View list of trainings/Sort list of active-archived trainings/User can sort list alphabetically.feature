Feature: User can sort list alphabetically

Scenario: User can sort list alphabetically

Given user is on the list of trainings
When user clicks the sort button
* user selects to sort alphabetically <type>
Then list shows trainings with alphabetical sort <type>

Examples:
|type|
|A - Z|
|Z - A|
