Feature: User sees list of students for past course appointments

Scenario: User sees list of students for past course appointments

Given user is assigned to a course part appointment
* appointment is completed
When user opens calendar
* user clicks on the course part appointment
* user clicks on "Registered students"
* Then user sees read-only list of students
* user sees student details 
|profile picture|student name|
* user attendancy status
|not attended (red)|attended (green)|
