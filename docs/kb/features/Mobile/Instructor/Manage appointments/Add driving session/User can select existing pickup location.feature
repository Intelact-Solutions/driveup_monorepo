Feature: User can select existing pickup location

Scenario: User can select existing pickup location

Given user is on the calendar
        * company has existing pickup locations
        When user triggers adding a new appointment
        * user clicks on the pickup location field
        Then user can select existing pickup location
