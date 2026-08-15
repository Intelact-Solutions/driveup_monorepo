Feature: User can have only one signature per session

Scenario: User can have only one signature per session

Given user is authenticated
        * user is in the driving session
        When user opens the signature section
        Then user can see only one signature for the session
