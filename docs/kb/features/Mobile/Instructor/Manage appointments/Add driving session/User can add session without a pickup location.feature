Feature: User can add session without a pickup location

Scenario: User can add session without a pickup location

Given user is on the calendar
        When user triggers adding a new appointment
        * user fills the student name field
        * user fills the date field
        * user fills the start time field
        * user submits the form without selecting a pickup location
        Then form is submitted successfully
        * new session is added to the calendar
        * pickup location is not shown in session details
