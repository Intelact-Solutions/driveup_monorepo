Feature: User can edit past appointment

Scenario: User can edit past appointment

Given user is on the calendar
* user has an appointment in the past
When user clicks on the appointment
* user makes any change
Then change is saved
