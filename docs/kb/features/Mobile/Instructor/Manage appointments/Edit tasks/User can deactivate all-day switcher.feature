Feature: User can deactivate all-day switcher

Scenario: User can deactivate all-day switcher

Given user is on the Calendar page
        * user has an "all-day" task
        When user clicks on the task
        * user deactivates "all-day" switcher
        * user clicks on the "Save" button
        Then user sees the updated task with time slots
        * task is not pinned to the top of the calendar
        * in the task details, start and end time fields are visible
