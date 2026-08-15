Feature: User sees average score for a topic

Scenario: User sees average score for a topic

Given user is authenticated
        * user is inside the driving session
        When user views the topic details
        Then user sees the average score for the topic
        * average score is updated based on the scoring changes for the skills inside the topic
