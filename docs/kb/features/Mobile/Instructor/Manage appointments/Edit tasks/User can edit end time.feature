Feature: User can edit end time

Scenario: User can edit end time

Given user is on the Calendar page
        * user has a task
        When user clicks on the task
        * user edits task end time
        Then task start time remains unchanged
        * after submitting, user sees the updated task with new end time
