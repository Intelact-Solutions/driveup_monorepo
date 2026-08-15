Feature: User does not see the upcoming section if no appointments exist

Scenario: User does not see the upcoming section if no appointments exist

Given user is authenticated
        * user has appointments for today
        * user has no appointments for the following days
        When user opens the Workday home page
        Then user sees the today section
        * user does not see the upcoming section including the section title
