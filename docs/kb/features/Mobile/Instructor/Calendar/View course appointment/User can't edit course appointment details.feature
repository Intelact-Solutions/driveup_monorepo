Feature: User can't edit course appointment details

Scenario: User can't edit course appointment details

Given user is assigned to a course part appointment
When user opens calendar
* user clicks on the course part appointment
Then user sees the detailed view of the appointment
* appointment details are not editable
