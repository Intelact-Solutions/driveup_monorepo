Feature: User sees course progress statistics

Scenario: User sees course progress statistics

Given user is a student
When user opens the detailed view of a course
* user navigates to the "Parts" tab
Then user sees course progress section
* user sees number of parts completed out of total
* user sees visual representation of the course progress as a diagram
