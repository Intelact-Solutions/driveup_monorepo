Feature: User can deselect pickup location

Scenario: User can deselect pickup location

Given user is authenticated
        * user has upcoming driving sessions
        * user is inside a driving appointment
        * appointment has a set pickup location
        When user opens the session menu
        * user selects "Edit pickup location"
        * user clicks on the already selected pickup location
        * user confirms the changes
        Then appointment pickup location is cleared
        * user sees the updated appointment details in the calendar
