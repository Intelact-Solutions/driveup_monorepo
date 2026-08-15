Feature: User can see empty screen placeholder if no appointments exist

Scenario: User can see empty screen placeholder if no appointments exist

Given user is authenticated
        * user has no appointments for today
        * user has no appointments for the following days
        When user opens the Workday home page
        Then user sees empty state placeholder
        * user sees the "+Add training" button
