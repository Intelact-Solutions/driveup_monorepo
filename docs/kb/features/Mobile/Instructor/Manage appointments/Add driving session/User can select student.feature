Feature: User can select student

Scenario: User can select student

Given user is on the calendar
        When user triggers adding a new appointment
        * user clicks on the student field
        Then user can select student
        * user can't select multiple students
