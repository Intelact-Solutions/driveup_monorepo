Feature: User can select training for student with multiple trainings

Scenario: User can select training for student with multiple trainings

Given user is on the calendar
        * user has a student with multiple driving trainings
        When user triggers adding a new appointment
        * user clicks on the student field
        * user selects student with multiple trainings
        Then user lands on training selection screen
        * user can select training
