Feature: User can navigate between topics

Scenario: User can navigate between topics

Given user is authenticated
        * user has an upcoming driving session
        When user opens the driving session
        Then user can navigate between topics by swiping right and left
        * user can navigate between topics using the next and previous buttons
        * all topics show the latest state of the skills
