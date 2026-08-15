Feature: User can submit form if all mandatory fields are filled-out

Scenario: User can submit form if all mandatory fields are filled-out

Given user is on the calendar page
        * user is on the "Add task" form
        When user enters task title
        * user selects a date from the date-picker
        * user selects a start time from the time-picker
        * user selects an end time from the time-picker
        * user submits the form
        Then task is added to the calendar
