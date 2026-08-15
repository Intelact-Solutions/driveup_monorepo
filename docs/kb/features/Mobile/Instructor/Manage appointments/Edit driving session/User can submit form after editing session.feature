Feature: User can submit form after editing session

Scenario: User can submit form after editing session

Given user is on the Calendar page
        * user has previously added a driving session for a student
        When user clicks on the session item
        * user edits the session details
        * user clicks on the "Save" button
        Then user can see the updated session in the calendar
