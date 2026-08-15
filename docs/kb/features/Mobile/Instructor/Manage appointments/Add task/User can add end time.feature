Feature: User can add end time

Scenario: User can add end time

Given user is on the calendar page
        * user is on the "Add task" form
        When user clicks on the end time field
        * user selects an end time from the time-picker
        Then end time is selected
        * end time is shown in the form
