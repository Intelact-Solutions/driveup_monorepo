Feature: User can edit task title

Scenario: User can edit task title

Given user is on the Calendar page
        * user has a task
        When user clicks on the task
        * user edits task title
        * user clicks on the "Save" button
        Then user sees the updated task with new title
