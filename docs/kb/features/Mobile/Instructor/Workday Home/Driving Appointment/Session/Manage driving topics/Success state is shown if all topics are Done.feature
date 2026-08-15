Feature: Success state is shown if all topics are Done

Scenario: Success state is shown if all topics are Done

Given user is authenticated
        * user has an upcoming driving session
        When user opens the driving session
        * user marks all lesson plan topics to "Done"
        Then user sees a success state
        * user is informed that all lesson plan topics to "Done"
