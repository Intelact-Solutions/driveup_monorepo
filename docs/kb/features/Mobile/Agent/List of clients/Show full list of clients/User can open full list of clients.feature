Feature: User can open full list of clients

Scenario: User can open full list of clients

Given user is logged in as sales agent
        * user has multiple clients
        When user opens the Home screen
        And user clicks on "See all" button
        Then user sees a full list of clients
        * list is divided into 2 separate tabs
            | Active clients | Expired clients |
        * user lands per default on the list of active clients
        * user sees details of each client
            | Company name and logo | Company address | Monthly revenue | End date of subscription |
