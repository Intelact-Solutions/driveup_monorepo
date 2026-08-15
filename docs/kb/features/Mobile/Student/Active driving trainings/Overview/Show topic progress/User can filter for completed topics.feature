Feature: User can filter for completed topics

Scenario: User can filter for completed topics

Given user is logged in
* user has a driving training
* user is on the full list of topics for a driving training
When user selects the "Include completed topics" filter
Then list displays completed topics as well
