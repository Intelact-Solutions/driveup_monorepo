Feature: User can trigger search with speech-to-text

Scenario: User can trigger search with speech-to-text

Given user is authenticated
        * user has upcoming driving sessions and course part appointments
        When user opens the Workday home page
        * user activates speech-to-text and says a string
        Then user sees relevant search results
