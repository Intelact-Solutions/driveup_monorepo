Feature: User can cancel course appointment

Scenario: User can cancel course appointment

Given user has a course
* the course has students
When user opens a course appointment
* user clicks on the course appointment menu
* user clicks "Cancel"
* user confirms the cancellation
Then course appointment is cancelled
* all students receive an email for the cancellation
