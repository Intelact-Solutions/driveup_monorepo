Feature: User can filter the calendar items

Scenario: User can filter the calendar items

Given user is on the calendar
When user clicks on the top left menu
* and user selects one or more filters
Then the calendar is filtered according to the filter selection
