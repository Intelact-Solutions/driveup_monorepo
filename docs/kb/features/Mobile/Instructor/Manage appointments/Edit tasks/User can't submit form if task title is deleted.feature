Feature: User can't submit form if task title is deleted

Scenario: User can't submit form if task title is deleted

Given user is on the Calendar page
        * user has a task
        When user clicks on the task
        * user deletes task title
        * user clicks on the "Save" button
        Then user sees the error message "Task title is required"
        * user can't submit the form
