Feature: User can search for topic in the detailed list

Scenario: User can search for topic in the detailed list

Given user is logged in
* user has a driving training
* user is on the full list of topics for a driving training
When user enters a string into the search field
Then list is filtered according to the search string
