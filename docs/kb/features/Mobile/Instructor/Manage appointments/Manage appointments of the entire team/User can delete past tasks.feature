Feature: User can delete past tasks

Scenario: User can delete past tasks

Given user is on the calendar page
        * user is a manager
        When user selects an instructor to view their calendar
        * user clicks on a past task
        * user clicks "Delete"
        * user confirms deletion
        Then task is removed from the instructor's calendar
