Feature: User can submit form if all mandatory fields are filled-out

Scenario: User can submit form if all mandatory fields are filled-out

Given user is on the calendar
        When user triggers adding a new appointment
        * user fills the student name field
        * user fills the date field
        * user fills the start time field
        * user submits the form
        Then form is submitted successfully
        * new session is added to the calendar
        * the length of the session is the length defined by the driving school for the selected category
