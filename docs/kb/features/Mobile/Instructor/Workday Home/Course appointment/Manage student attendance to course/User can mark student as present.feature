Feature: User can mark student as present

Scenario: User can mark student as present

Given user has a course
* course has students
When user opens course appointment
* user clicks on the checkbox next to a student
Then student is marked as present
* number of present students is increased by one
