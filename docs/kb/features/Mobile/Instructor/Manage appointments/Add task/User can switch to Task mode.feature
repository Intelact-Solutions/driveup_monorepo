Feature: User can switch to Task mode

Scenario: User can switch to Task mode

Given user is on the calendar page
        * user has triggered form for adding new session
        When user changes type to "Task"
        Then user is in "Task" mode
        * user can add task details
