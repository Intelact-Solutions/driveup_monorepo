Feature: User sees driving training details

Scenario: User sees driving training details

Given user is authenticated
        * user has upcoming driving sessions in the current day
        When user opens the Workday home page
        * user clicks on a driving session in the current day
        Then user sees the details of the driving session
        * user sees student name and profile picture
        * user sees driving category label
