Feature: User can add start time

Scenario: User can add start time

Given user is on the calendar page
        * user is on the "Add task" form
        When user clicks on the start time field
        * user selects a start time from the time-picker
        Then start time is selected
        * start time is shown in the form
