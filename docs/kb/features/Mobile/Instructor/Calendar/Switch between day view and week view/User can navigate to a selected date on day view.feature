Feature: User can navigate to a selected date on day view

Scenario: User can navigate to a selected date on day view

Given user is on the calendar
* user is on <calendar_view>
When user clicks on day or week label
* user selects date in the date picker
Then user lands on <landing_view>

Examples:
|calendar_view|landing_view|
|day view|selected date|
|week view| week of selected date|
