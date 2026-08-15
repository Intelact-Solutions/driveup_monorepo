Feature: Done status is automatically removed when user edits skill assessment

Scenario: Done status is automatically removed when user edits skill assessment

Given user is authenticated
        * user is in the driving session
        * user has a topic in the session
        * user has set topic to "Done"
        When user edits the skill assessment for the topic
        Then the "Done" status is unchecked
        * topic is removed from the "Done" tab in the list of topics
        * "Done" badge is removed from the topic in the Topics list
