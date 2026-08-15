Feature: User can select student who has a different in-charge instructor

Scenario: User can select student who has a different in-charge instructor

Given user is on the calendar
        When user triggers adding a new appointment
        * user clicks on the student field
        Then user can select any student in the company regardless of in-charge instructor
