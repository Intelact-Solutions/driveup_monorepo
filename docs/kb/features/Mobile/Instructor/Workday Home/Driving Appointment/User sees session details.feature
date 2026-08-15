Feature: User sees session details

Scenario: User sees session details

Given user is authenticated
        * user has upcoming driving sessions in the current day
        When user opens the Workday home page
        * user clicks on a driving session in the current day
        Then user sees session date 
        * user sees session start and end time
