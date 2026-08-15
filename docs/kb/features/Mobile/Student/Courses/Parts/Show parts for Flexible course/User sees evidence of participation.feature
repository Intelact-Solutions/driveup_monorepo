Feature: User sees evidence of participation

Scenario: User sees evidence of participation

Given user is a student
* user is on the detailed view of a course
* user has been present in a course part appointment
When user navigates to the "Parts" tab of a course
Then user sees the "Present" badge for the course part
