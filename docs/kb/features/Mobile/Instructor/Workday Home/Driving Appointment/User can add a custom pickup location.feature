Feature: User can add a custom pickup location

Scenario: User can add a custom pickup location

Given user is authenticated
        * user has upcoming driving sessions
        * user is inside a driving appointment
        When user opens the session menu
        * user selects "Edit pickup location"
        * user enters custom location details
        * user confirms the changes
        Then appointment pickup location is successfully updated
        * user sees the updated appointment details in the calendar
        * custom pickup location is not saved for further use
