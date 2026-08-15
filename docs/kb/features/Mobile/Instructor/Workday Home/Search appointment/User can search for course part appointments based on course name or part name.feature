Feature: User can search for course part appointments based on course name or part name

Scenario: User can search for course part appointments based on course name or part name

Given user is authenticated
        * user has upcoming course part appointments
        When user opens the Workday home page
        * user enters a course name or part name in the search bar
        Then user sees course part appointments for that course or part in the list
