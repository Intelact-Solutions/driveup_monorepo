Feature: User can see list of revenues

Scenario: User can see list of revenues

Given user is logged in as sales agent
        * user has multiple clients with revenue history
        When user opens the Earnings module
        Then user sees a list of revenues
        * user sees details of each revenue entry
            | Client name, address and logo | Period | Revenue amount | Status |
        And user can scroll through the list
