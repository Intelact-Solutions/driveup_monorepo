Feature: User can see empty screen placeholder if no appointments exist for today

Scenario: User can see empty screen placeholder if no appointments exist for today

Given user is authenticated
        * user has no appointments for today
        * user has appointments for the following days
        When user opens the Workday home page
        Then user sees empty state placeholder for today
        * user sees the upcoming section appointments
