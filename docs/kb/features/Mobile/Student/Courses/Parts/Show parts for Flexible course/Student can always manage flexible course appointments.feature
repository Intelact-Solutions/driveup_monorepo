Feature: Student can always manage flexible course appointments

Scenario: Student can always manage flexible course appointments

Given user is a student 
* user is registered to a course 
When student opens the calendar of a course part 
* user selects an appointment
Then the appointment can be selected 
* student can always select an appointment
