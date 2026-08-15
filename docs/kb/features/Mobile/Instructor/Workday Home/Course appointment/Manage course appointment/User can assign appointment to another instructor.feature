Feature: User can assign appointment to another instructor

Scenario: User can assign appointment to another instructor

Given user has a course
* the course has students
When user opens a course appointment
* user clicks on the course appointment menu
* user clicks "Assign to..."
Then user sees list of instructors
* instructors with a conflicting appointment have the label "Busy"
* user can select any instructor
* after the process, appointment is visible in the workday and calendar of the selected instructor
