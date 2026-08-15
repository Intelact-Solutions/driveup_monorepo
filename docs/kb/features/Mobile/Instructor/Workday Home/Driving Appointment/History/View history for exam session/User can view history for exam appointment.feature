Feature: User can view history for exam appointment

Scenario: User can view history for exam appointment

Given user is authenticated
        * user has opened an exam appointment
        When user opens the history tab
        * user navigates to the exam appointment
        Then user sees appointment date and time
        * user sees instructor profile picture and name
        * user sees examiner name
        * user sees exam session notes
        * user sees list of exam topics
        * topics are not editable
        * user sees pass/fail status of the exam
