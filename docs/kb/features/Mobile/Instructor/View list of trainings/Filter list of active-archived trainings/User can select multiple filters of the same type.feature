Feature: User can select multiple filters of the same type

Scenario: User can select multiple filters of the same type

Given user is on the list of archived trainings
When user clicks the filter button
* user selects filter <filter_1>
* user selects filter <filter_2>
Then user sees only trainings which match with the selected filters

Examples:
|filter_1|filter_2|
|completed|terminated|
|C|B|
