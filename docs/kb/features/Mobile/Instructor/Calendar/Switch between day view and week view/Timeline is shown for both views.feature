Feature: Timeline is shown for both views

Scenario: Timeline is shown for both views

Given user is logged in
When user opens calendar in day view or week view
Then user sees timeline showing the current time
* timeline is updated if user remains on the screen for a longer time
