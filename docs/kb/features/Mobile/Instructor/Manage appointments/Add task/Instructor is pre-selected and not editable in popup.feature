Feature: Instructor is pre-selected and not editable in popup

Scenario: Instructor is pre-selected and not editable in popup

Given user is on the calendar page
        * user has triggered form for adding new session
        When user changes type to "Task"
        Then instructor is pre-selected and not editable
