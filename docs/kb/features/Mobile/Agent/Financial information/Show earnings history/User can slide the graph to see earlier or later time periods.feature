Feature: User can slide the graph to see earlier or later time periods

Scenario: User can slide the graph to see earlier or later time periods

Given user is logged in as sales agent
        * user has multiple clients with revenue history
        When user opens the Earnings module
        * user slides the graph to the left or right
        Then user sees earlier or later time period, corresponding to the direction of the slide
