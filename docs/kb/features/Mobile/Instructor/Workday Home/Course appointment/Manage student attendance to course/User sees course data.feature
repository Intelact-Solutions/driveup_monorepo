Feature: User sees course data

Scenario: User sees course data

Given user has a course
* course has students
When user opens course appointment
Then user sees course title
* user sees part title
* user sees number of students
* user sees number of present students out of the total
* user sees course appointment date and time
