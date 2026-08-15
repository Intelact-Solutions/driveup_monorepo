Feature: Appointment assigned to another instructor except the in-charge instructor are not editable

Scenario: Appointment assigned to another instructor except the in-charge instructor are not editable

Given user has an appointment
* appointment was assigned to another instructor except the in-charge
When user opens the appointment in the calendar
Then date and time are editable
* user can cancel the appointment
