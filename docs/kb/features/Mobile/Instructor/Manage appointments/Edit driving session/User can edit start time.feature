Feature: User can edit start time

Scenario: User can edit start time

Given user is on the Calendar page
        * user has previously added a driving session for a student
        When user clicks on the session item
        * user clicks on the start time field
        * user selects a new start time from the dropdown
        Then user can see the newly selected start time in the form
