Feature: User with Manager role can add task to all calendars

Scenario: User with Manager role can add task to all calendars

Given user is on the calendar page
        * user is a manager
        When user selects an instructor to view their calendar
        * user clicks trigger to add a session
        * user switches item type to "Task"
        * user fills in all details
        * user submits form
        Then new task is added to the instructor's calendar
