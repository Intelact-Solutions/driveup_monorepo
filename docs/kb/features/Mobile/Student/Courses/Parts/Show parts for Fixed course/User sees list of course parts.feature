Feature: User sees list of course parts

Scenario: User sees list of course parts

Given user is a student
* user is on the detailed view of a course
When user navigates to the "Parts" tab of a course
Then user sees list of course parts
* for each course part, user sees following data
|part name| date | time |
* course parts are sorted chronologically
