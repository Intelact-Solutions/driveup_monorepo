Feature: User can view detailed list of topics

Scenario: User can view detailed list of topics

Given user is logged in
* user has a driving training
* user is on the detailed view of a driving training
When user clicks on "Show details"
Then user sees the full list of topics for the driving training
