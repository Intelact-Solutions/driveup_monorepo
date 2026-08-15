Feature: User sees list of students for upcoming course appointments

Scenario: User sees list of students for upcoming course appointments

Given user is assigned to a course part appointment
* appointment is upcoming
When user opens calendar
* user clicks on the course part appointment
* user clicks on "Registered students"
* Then user sees read-only list of students
* user sees student details 
|profile picture|student name|
* user sees no attendancy status
