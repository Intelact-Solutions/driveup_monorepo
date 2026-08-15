Feature: User can select another pickup location

Scenario: User can select another pickup location

Given user is on the Calendar page
        * user has previously added a driving session for a student
        * user has added a pickup location to the session
        When user clicks on the session item
        * user clicks on the pickup location field
        * user selects another pickup location from the list
        Then user can see the newly selected pickup location in the form
