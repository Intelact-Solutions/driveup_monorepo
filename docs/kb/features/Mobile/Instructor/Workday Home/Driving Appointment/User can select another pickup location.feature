Feature: User can select another pickup location

Scenario: User can select another pickup location

Given user is authenticated
        * user has upcoming driving sessions
        * user is inside a driving appointment
        When user opens the session menu
        * user selects "Edit pickup location"
        * user selects another pickup location from the list
        * user confirms the changes
        Then appointment pickup location is successfully updated
        * user sees the updated appointment details in the calendar
