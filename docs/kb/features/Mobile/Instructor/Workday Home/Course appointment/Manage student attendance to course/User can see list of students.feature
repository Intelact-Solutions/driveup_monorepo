Feature: User can see list of students

Scenario: User can see list of students

Given user has a course
* course has students
When user opens course appointment
Then user sees list of students
* list is sorted alphabetically
* for each students, user sees profile picture and name
