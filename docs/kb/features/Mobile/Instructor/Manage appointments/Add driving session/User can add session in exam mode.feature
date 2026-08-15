Feature: User can add session in exam mode

Scenario: User can add session in exam mode

Given user is on the calendar
        When user triggers adding a new appointment
        * user fills the student name field
        * user fills the date field
        * user fills the start time field
        * user selects exam mode
        Then form is submitted successfully
        * new session is added to the calendar
        * new session is marked as exam session
