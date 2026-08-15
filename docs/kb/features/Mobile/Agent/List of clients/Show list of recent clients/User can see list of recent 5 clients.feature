Feature: User can see list of recent 5 clients

Scenario: User can see list of recent 5 clients

Given user is logged in as sales agent
        * user has multiple clients
        When user opens the Home screen
        Then user sees a list with the most recent 5 clients
        * user sees details of each clients
            | Company name and logo | Company address | Monthly revenue | End date of subscription |
        * user sees upward arrow if revenue is higher than previous month
        * user sees downward arrow if revenue is lower than previous month
