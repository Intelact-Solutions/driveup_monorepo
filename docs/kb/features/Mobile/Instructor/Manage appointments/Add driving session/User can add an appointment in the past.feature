Feature: User can add an appointment in the past

Scenario: User can add an appointment in the past

Given user is on the calendar
When user triggers form for a new appoinment
* user selects a date in the past
* user submits form
Then appointment is added successfully
