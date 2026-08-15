Feature: User can submit form if all mandatory fields are filled-out

Scenario: User can submit form if all mandatory fields are filled-out

Given user is on the Calendar page
        * user has a task
        When user clicks on the task
        * user edits task details
        * no mandatory fields are empty
        * user clicks on the "Save" button
        Then user sees the updated task with all changes applied
