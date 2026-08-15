Feature: User sees earnings history as a graph

Scenario: User sees earnings history as a graph

Given user is logged in as sales agent
        * user has multiple clients with revenue history
        When user opens the Earnings module
        Then user sees earnings history as a graph
        * the graph shows quarterly earnings of the last 6 quarters
