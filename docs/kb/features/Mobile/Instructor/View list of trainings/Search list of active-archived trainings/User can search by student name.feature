Feature: User can search by student name

Scenario: User can search by student name

Given user is on the list of trainings
* and user has multiple trainings
When user enters matching student name
Then search results is shown
