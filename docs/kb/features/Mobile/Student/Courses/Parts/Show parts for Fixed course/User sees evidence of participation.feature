Feature: User sees evidence of participation

Scenario: User sees evidence of participation

Given user is a student
* user is on the detailed view of a course
When user navigates to the "Parts" tab of a course
Then user sees evidence of participation in the course parts
|Present|Absent|
