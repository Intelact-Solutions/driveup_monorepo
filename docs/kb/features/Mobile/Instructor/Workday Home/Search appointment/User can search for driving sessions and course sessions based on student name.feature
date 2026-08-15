Feature: User can search for driving sessions and course sessions based on student name

Scenario: User can search for driving sessions and course sessions based on student name

Given user is authenticated
        * user has upcoming driving and course sessions
        When user opens the Workday home page
        * user enters a student name in the search bar
        Then user sees driving sessions for that student in the list
        * user sees course sessions in which the student is registered
