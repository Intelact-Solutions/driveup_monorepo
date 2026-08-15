Feature: User can select combine filters of different types

Scenario: User can select combine filters of different types

Given user is on the list of archived trainings
When user clicks the filter button
* user selects filter <filter_1>
* user selects filter <filter_2>
* user sets negative balance filter to <state>
Then user sees only trainings which match the selected filters

Examples: 
|filter_1|filter_2|state|
|Terminated|B|on|
|Completed|C|off|
