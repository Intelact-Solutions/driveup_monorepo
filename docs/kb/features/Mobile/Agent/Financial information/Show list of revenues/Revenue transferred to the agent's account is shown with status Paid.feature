Feature: Revenue transferred to the agent's account is shown with status Paid

Scenario: Revenue transferred to the agent's account is shown with status Paid

Given user is logged in as sales agent
        * user has multiple clients with revenue history including some that have been paid out
        When user opens the Earnings module
        Then user sees a list of revenues
        * revenue entries that have been transferred to the agent's account are shown with status "Paid"
