Feature: User can't submit form if a mandatory field is missing

Scenario: User can't submit form if a mandatory field is missing

Given user is on the calendar
        When user triggers adding a new appointment
        * user fills all mandatory fields except <missing_field>
        * user tries to submit the form
        Then form submission is blocked
        * user sees a validation message for the missing field

        Examples:
            | missing_field |
            | student name  |
            | date          |
            | start time    |
