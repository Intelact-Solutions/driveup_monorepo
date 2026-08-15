Feature: User sees course name and description

Scenario: User sees course name and description

Given user is a student
When user opens the detailed view of a course
Then user sees course name
* user sees course description
