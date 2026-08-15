Feature: User can select date

Scenario: User can select date

Given user is on the calendar
        When user triggers adding a new appointment
        * user clicks on the date field
        * user selects a date from the calendar
        Then date is shown in the form
