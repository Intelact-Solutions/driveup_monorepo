Feature: User can edit custom pickup location

Scenario: User can edit custom pickup location

Given user is on the Calendar page
        * user has previously added a driving session for a student
        * user has added a custom pickup location to the session
        When user clicks on the session item
        * user clicks on the pickup location field
        * user edits the custom pickup location
        Then user can see the edited custom pickup location in the form
