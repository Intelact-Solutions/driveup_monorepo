Feature: Calendar always restarts with initial default view

Scenario: Calendar always restarts with initial default view

Given user has opened the calendar of another user
* user has moved to another section in the app
When user clicks on the calendar icon
Then user lands on the calendar page
* user sees the default view
