Feature: User can edit start time

Scenario: User can edit start time

Given user is on the Calendar page
        * user has a task
        When user clicks on the task
        * user edits task start time
        Then task end time is updated accordingly to maintain the same duration
        * after submitting, user sees the updated task with new start time
