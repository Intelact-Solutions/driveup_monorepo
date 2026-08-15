Feature: Manager can delete past sessions

Scenario: Manager can delete past sessions

Given user is on the calendar page
        * user is a manager
        When user selects an instructor to view their calendar
        * user clicks on a past session
        * user clicks "Delete"
        * user confirms deletion
        Then session is removed from the instructor's calendar
        * cost of the session is removed from the student finances
