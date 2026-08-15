Feature: User can unmark student

Scenario: User can unmark student

Given user has a course
* course has students
* user has marked students as "present"
When user opens course appointment
* user clicks on the checkbox next to a student
Then student is marked as absent
* number of present students is decreased by one
