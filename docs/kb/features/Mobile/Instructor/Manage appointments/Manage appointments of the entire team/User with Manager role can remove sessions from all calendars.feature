Feature: User with Manager role can remove sessions from all calendars

Scenario: User with Manager role can remove sessions from all calendars

Given user is on the calendar page
        * user is a manager
        When user selects an instructor to view their calendar
        * user clicks on a session
        * user clicks "Delete session"
        * user confirms deletion
        Then session is removed from the instructor's calendar
