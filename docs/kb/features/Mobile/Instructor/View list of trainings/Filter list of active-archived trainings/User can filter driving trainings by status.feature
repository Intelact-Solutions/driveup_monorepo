Feature: User can filter driving trainings by status

Scenario: User can filter driving trainings by status

Given user is on the list of archived trainings
When user clicks the filter button
* user selects filter <status_filter>
Then list shows only trainings with status <status_filter>

Examples:
|status_filter|
|Completed|
|Terminated|
