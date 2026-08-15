Feature: User can expand topic to view its skills and skill assessments

Scenario: User can expand topic to view its skills and skill assessments

Given user is authenticated
        * user has opened a driving session
        * user is on the history tab
        When user clicks on "Show details" for a topic
        Then topic expands to show its skills and skill assessments
        * user can view skill name and assessment status
        * user can collapse the topic by clicking on it again
