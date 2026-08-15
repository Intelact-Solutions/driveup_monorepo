Feature: On initial load, default view shows calendar of active user

Scenario: On initial load, default view shows calendar of active user

Given user is logged in
When user goes to the calendar section in the app
Then user sees current day of his own calendar
* default view is always the day view of the current day
