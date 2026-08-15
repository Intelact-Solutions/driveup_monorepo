Feature: User can add score for the skills inside a topic

Scenario: User can add score for the skills inside a topic

Given user is authenticated
        * user is inside the driving session
        When user clicks on the assessment line for any skills
        Then score of the assessment is shown as a number for the corresponding skills
        * score of the assessment is shown visually
        * average score of the topic is updated
