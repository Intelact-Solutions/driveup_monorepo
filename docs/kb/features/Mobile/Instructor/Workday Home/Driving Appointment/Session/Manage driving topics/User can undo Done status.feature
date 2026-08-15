Feature: User can undo Done status

Scenario: User can undo Done status

Given user is authenticated
        * user is in a driving session for today
        * user has clicked on "Done"
        When user clicks on "Done" again
        Then "Done" status is removed
        * "Done" badge is removed from the topic in the Topics list
