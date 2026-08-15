Feature: User can open detailed view of upcoming driving sessions

Scenario: User can open detailed view of upcoming driving sessions

Given user is authenticated
        * user has upcoming driving sessions
        * user is on the Workday home page
        When user clicks on a driving session in the upcoming section
        Then user can open detailed view of the driving session
        * user sees an alert that this session is in the future
        *  topics/course attendance are read only
        * student signature is disabled
        * user can switch to exam mode
        * user can assign session to another instructor
        * user can edit date and time
        * user can edit pickup location
        * user can cancel session
