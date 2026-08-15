Feature: User can re-assign own course appointment to another instructor

Scenario: User can re-assign own course appointment to another instructor

Given user is assigned to a course part appointment
When user opens calendar
* user clicks on the course part appointment
* user clicks on instructor name
Then user sees list of instructors
* user sees the label "busy" for instructors who have a conflicting appointment
* user can assign appointment to another instructor by selecting name and submitting the form
