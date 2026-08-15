Feature: User with Manager role can edit sessions in all calendars

Scenario: User with Manager role can edit sessions in all calendars

Given user is on the calendar page
        * user is a manager
        When user selects an instructor to view their calendar
        * user clicks on a session
        * user edits session details
        * user submits form
        Then session is updated in the instructor's calendar
