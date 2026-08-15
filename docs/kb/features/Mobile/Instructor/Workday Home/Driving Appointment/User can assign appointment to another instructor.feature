Feature: User can assign appointment to another instructor

Scenario: User can assign appointment to another instructor

Given user is authenticated
        * user has upcoming driving sessions
        * user is on the Workday home page
        When user clicks on a driving session
        * user opens the session menu
        * user selects "Assign to"
        * user selects instructor from the list
        * user confirms assignment
        Then appointment is successfully assigned to the selected instructor
        *   appointment is not visible on the current user's calendar
