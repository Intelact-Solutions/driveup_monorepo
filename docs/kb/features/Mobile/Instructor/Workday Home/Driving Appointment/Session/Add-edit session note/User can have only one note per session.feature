Feature: User can have only one note per session

Scenario: User can have only one note per session

Given user is authenticated
        * user is in the driving session
        When user opens the notes section
        Then user can see only one note for each session
