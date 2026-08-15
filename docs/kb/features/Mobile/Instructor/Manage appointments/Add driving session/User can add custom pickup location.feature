Feature: User can add custom pickup location

Scenario: User can add custom pickup location

Given user is on the calendar
        When user triggers adding a new appointment
        * user clicks on the pickup location field
        * user chooses to add a custom pickup location
        Then user can enter and save a new pickup location
        * pickup location is shown in the form
        * pickup location is show for the appointment on the Start page
