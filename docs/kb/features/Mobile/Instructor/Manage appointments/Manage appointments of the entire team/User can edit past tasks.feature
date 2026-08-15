Feature: User can edit past tasks

Scenario: User can edit past tasks

Given user is on the calendar page
        * user is a manager
        When user selects an instructor to view their calendar
        * user clicks on a past task
        Then task is not displayed in read-only mode
        * user can edit the the task
