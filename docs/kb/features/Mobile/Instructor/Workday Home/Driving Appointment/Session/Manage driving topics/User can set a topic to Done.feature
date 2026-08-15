Feature: User can set a topic to Done

Scenario: User can set a topic to Done

Given user is authenticated
        * user is in a driving session for today
        When user clicks "Done" for a topic
        Then topic is marked as "Done"
        * selected topic is not changed
        * user can see the done topic in the list of topics with a "Done" badge
