Feature: User can delete upcoming session

Scenario: User can delete upcoming session

Given user is on the Calendar page
        * user has previously added a driving session for a student
        When user clicks on the session item
        * user clicks on the "Cancel session" button
        * user confirms deletion
        Then session is removed from the calendar
        * student is notified about the cancellation
