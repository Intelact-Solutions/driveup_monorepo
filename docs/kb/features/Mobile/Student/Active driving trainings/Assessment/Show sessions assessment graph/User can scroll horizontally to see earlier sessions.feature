Feature: User can scroll horizontally to see earlier sessions

Scenario: User can scroll horizontally to see earlier sessions

Given user has opened the "Assessment" tab
* user has 10 completed sessions
* user sees graph for the last sessions
When user scrolls to the right
Then user can scroll back in history to see earlier appointments in the graph
