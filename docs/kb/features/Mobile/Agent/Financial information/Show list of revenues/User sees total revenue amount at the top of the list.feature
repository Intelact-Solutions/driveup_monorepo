Feature: User sees total revenue amount at the top of the list

Scenario: User sees total revenue amount at the top of the list

Given user is logged in as sales agent
        * user has multiple clients with revenue history
        When user opens the Earnings module
        Then user sees total revenue amount at the top of the list
        * total revenue amount is the sum of all individual revenue entries in the list
        * total revenue amount is updated when new revenue entries are added
