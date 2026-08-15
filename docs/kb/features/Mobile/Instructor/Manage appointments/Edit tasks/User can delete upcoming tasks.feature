Feature: User can delete upcoming tasks

Scenario: User can delete upcoming tasks

Given user is on the Calendar page
        * user has an upcoming task
        When user clicks on the task
        * user clicks on the "Delete" button
        * user confirms deletion
        Then task is removed from the calendar
