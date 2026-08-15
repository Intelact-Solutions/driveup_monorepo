Feature: User can open detailed view of todays session from the Workday Home list

Scenario: User can open detailed view of todays session from the Workday Home list

Given user is authenticated
        * user has multiple driving sessions and course part appointments for today
        When user opens the Workday home page
        * user clicks on an appointments from today
        Then user lands on the detailed view of the (driving or course) session
        * user can start working in the session
