Feature: User can navigate to training

Scenario: User can navigate to training

Given user is on the Calendar page
        * user has previously added a driving session for a student
        When user clicks on the session item
        * user clicks on the settings icon next to the student name
        Then user is redirected to the training page of the student
