Feature: User can go to a topic from topics list

Scenario: User can go to a topic from topics list

Given user is authenticated
        * user is in the driving session
        When user opens list of driving topics
        Then user sees the list of all topics in the category lesson plan
        * user sees average score for each topic
        * user sees in how many session has the topic been edited
        * user sees a "Done" badge for topics that has been set to Done
        * user sees the current topic in the session highlighted
        * user can move to another topic by clicking on it
