Feature: User with Manager role can add session to all calendars

Scenario: User with Manager role can add session to all calendars

Given user is on the calendar page
        * user is a manager
        When user selects an instructor to view their calendar
        * user clicks trigger to add a session
        * user fills in all details
        * user submits from
        Then new session is added to the instructor's calendarScenario: User with "Manager" role can add task to all calendars
