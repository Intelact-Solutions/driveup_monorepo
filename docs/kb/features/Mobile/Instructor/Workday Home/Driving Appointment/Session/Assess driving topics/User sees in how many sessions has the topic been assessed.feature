Feature: User sees in how many sessions has the topic been assessed

Scenario: User sees in how many sessions has the topic been assessed

Given user is authenticated      
        When user opens the driving session
        Then the number of session in which each topic has been assessed is visible
        * number of sessions is updated only upon first skill assessment in the topic
