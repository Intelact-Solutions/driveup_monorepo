Feature: User can switch to Exam mode

Scenario: User can switch to Exam mode

Given user is on the Calendar page
        * user has previously added a driving session for a student
        When user clicks on the session item
        * user turns on the "Exam mode" switcher
        * user submits the form
        Then session is marked as an exam session in the calendar
