Feature: User can edit appointment time

Scenario: User can edit appointment time

Given user is authenticated
        * user has upcoming driving sessions
        * user is inside a driving appointment
        When user opens the session menu
        * user selects "Edit time"
        * user changes the time
        * user confirms the changes
        Then appointment time is successfully updated
        * user sees the updated appointment details
        * appointment is visible in its new slot in the calendar
