Feature: User can select start time

Scenario: User can select start time

Given user is on the calendar
        When user triggers adding a new appointment
        * user clicks on the start time field
        * user selects a start time from the time picker
        Then start time is shown in the form
