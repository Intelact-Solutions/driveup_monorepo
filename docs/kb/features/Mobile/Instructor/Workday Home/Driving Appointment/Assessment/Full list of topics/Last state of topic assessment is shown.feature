Feature: Last state of topic assessment is shown

Scenario: Last state of topic assessment is shown

Given user has repeated a topic in multiple sessions
* topic has been assessed differently in each session
When user opens the "Assessment" page
Then user sees the latest score for the topic
