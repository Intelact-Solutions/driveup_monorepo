Feature: Appointment from previous days are not shown

Scenario: Appointment from previous days are not shown

Given user is authenticated
        * user has appointments in the previous days
        When user opens the Workday home page
        Then user does not see past appointments in the list
