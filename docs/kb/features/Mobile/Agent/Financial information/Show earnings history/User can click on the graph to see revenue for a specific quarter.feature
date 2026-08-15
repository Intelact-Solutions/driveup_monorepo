Feature: User can click on the graph to see revenue for a specific quarter

Scenario: User can click on the graph to see revenue for a specific quarter

Given user is logged in as sales agent
        * user has multiple clients with revenue history
        When user opens the Earnings module
        * user clicks on a specific quarter in the graph
        Then user sees detailed revenue information for that quarter as a pop-up
            | period | revenue amount |
