Feature: User can assign to an instructor with Busy label

Scenario: User can assign to an instructor with Busy label

Given user is on the Calendar page
        * user has previously added a driving session for a student
        When user clicks on the session item
        * user clicks on the instructor name
        Then user sees the list of instructors and their availability
        * user can select an instructor with "Busy" label
