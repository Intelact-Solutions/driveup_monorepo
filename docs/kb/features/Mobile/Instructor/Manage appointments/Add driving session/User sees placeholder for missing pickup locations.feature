Feature: User sees placeholder for missing pickup locations

Scenario: User sees placeholder for missing pickup locations

Given user is on the calendar
        * company has not added any pickup locations
        When user triggers adding a new appointment
        * user clicks on the pickup location field
        Then user sees a message indicating no pickup locations are available
