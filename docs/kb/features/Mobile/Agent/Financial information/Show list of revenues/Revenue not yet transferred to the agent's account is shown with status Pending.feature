Feature: Revenue not yet transferred to the agent's account is shown with status Pending

Scenario: Revenue not yet transferred to the agent's account is shown with status Pending

Given user is logged in as sales agent
        * user has multiple clients with revenue history including some that have not been paid out
        When user opens the Earnings module
        Then user sees a list of revenues
        * revenue entries that have not been transferred to the agent's account are shown with status "Pending"
