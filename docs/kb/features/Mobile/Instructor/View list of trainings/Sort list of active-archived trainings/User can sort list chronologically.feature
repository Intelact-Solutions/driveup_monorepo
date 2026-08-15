Feature: User can sort list chronologically

Scenario: User can sort list chronologically

Given user is on the list of trainings
When user clicks the sort button
* user selects to sort chronologically with <type> on top
Then list shows trainings with <type> on top

Examples:
|type|
|Newest|
|Oldest|
