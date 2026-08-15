Feature: User can open detailed view of upcoming course sessions

Scenario: User can open detailed view of upcoming course sessions

Given user is authenticated
        * user has upcoming course sessions
        * user is on the Workday home page
        When user clicks on a course session in the upcoming section
        Then user can open detailed view of the course session
        * user can only see the session in read only mode
        * user can assign session to another instructor
        * user can cancel session
