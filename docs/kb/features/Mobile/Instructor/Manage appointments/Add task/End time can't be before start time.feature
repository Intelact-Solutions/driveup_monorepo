Feature: End time can't be before start time

Scenario: End time can't be before start time

Given user is on the calendar page
        * user is on the "Add task" form
        When user selects an end time before the start time
        Then error message is shown
        * user can't submit the form
