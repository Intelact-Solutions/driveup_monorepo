Feature: Manager can delete session with Cancelled status

Scenario: Manager can delete session with Cancelled status

Given user is on the calendar page
        * user is a manager
        * user has session, cancelled by student in the obligation period
        * session is visible in the calendar with "Cancelled" status
        When user selects an instructor to view their calendar
        When user clicks on the sessioin
        * manager clicks "Delete"
        * manager confirms deletion
        Then session is removed from the calendar
        * cost of the session is removed from the student finances
