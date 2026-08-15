Feature: Exam appointment not editable

Scenario: Exam appointment not editable

Given user has an exam appointment
When user opens the appointment in the calendar
Then date and time are not editable
* user can't cancel the appointment
