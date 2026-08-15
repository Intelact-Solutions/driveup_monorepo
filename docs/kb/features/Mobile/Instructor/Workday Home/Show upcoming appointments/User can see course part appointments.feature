Feature: User can see course part appointments

Scenario: User can see course part appointments

Given user is authenticated
        * user has course part appointments for today and the following days
        When user opens the Workday home page
        Then user sees course part appointments for today in the list
        * user sees course part appointments for the following days in the list
        * user sees start and end time of each appointment
        * user sees course name
        * user sees course part name
        * user sees number of registered students
