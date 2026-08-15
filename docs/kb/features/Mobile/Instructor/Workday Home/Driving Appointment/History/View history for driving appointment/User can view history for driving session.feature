Feature: User can view history for driving session

Scenario: User can view history for driving session

Given user is authenticated
        * user has opened a drivin session
        When user opens the history tab
        Then user sees list of past driving sessions
        * last driving session is shown per default
        * user sees session date and time
        * user sees instructor profile picture and name
        * user sees session note
        * user sees list of driving topics    
        * topics are not editable
