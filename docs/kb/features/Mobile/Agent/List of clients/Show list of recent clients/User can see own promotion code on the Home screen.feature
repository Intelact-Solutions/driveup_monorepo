Feature: User can see own promotion code on the Home screen

Scenario: User can see own promotion code on the Home screen

Given user is logged in as sales agent
        When user opens the Home screen
        Then user sees own promotion code
        * user can copy the promotion code to clipboard
