Feature: User with Manager role can remove tasks from all calendars

Scenario: User with Manager role can remove tasks from all calendars

Given user is on the calendar page
        * user is a manager
        When user selects an instructor to view their calendar
        * user clicks on a task
        * user clicks "Delete task"
        * user confirms deletion
        Then task is removed from the instructor's calendar
