Feature: User can can filter driving trainings by category

Scenario: User can can filter driving trainings by category

Given user is on the list of trainings
When user clicks the filter button
* user selects a driving category
Then list shows only trainings of the selected driving category
