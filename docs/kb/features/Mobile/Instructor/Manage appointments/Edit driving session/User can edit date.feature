Feature: User can edit date

Scenario: User can edit date

Given user is on the Calendar page
        * user has previously added a driving session for a student
        When user clicks on the session item
        * user clicks on the date field
        * user selects a new date from the calendar
        Then user can see the newly selected date in the form
