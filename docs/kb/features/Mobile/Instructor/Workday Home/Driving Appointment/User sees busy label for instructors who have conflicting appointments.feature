Feature: User sees busy label for instructors who have conflicting appointments

Scenario: User sees busy label for instructors who have conflicting appointments

Given user is authenticated
        * user has upcoming driving sessions
        * user is inside a driving appointment
        When user opens the session menu
        * user selects "Assign to"
        Then user sees a list of instructors
        * user sees "busy" label for instructors who have conflicting appointments
        * all instructors are selectable
