Feature: User can edit appointment date

Scenario: User can edit appointment date

Given user is authenticated
        * user has upcoming driving sessions
        * user is inside a driving appointment
        When user opens the session menu
        * user selects "Edit date"
        * user changes the date
        * user confirms the changes
        Then appointment date is successfully updated
        * user sees the updated appointment details
        * appointment is visible in its new slot in the calendar
