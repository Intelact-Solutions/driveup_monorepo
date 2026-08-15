Feature: User can change task to all-day

Scenario: User can change task to all-day

Given user is on the Calendar page
        * user has a task which is not "all-day"
        When user clicks on the task
        * user activates "all-day" switcher
        Then start and end time fields are hidden
        * after submitting, user sees the updated task pinned to the top of the calendar
