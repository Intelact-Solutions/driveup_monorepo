Feature: User can see the category lesson plan topics in the session

Scenario: User can see the category lesson plan topics in the session

Given user is authenticated
        * user has an upcoming driving session
        When user opens the driving session
        Then user lands on the last visited topic in any session of the driving training
        * corners of the previous and next topic card are visible
