Feature: User can edit instructor

Scenario: User can edit instructor

Given user is on the Calendar page
        * user has previously added a driving session for a student
        When user clicks on the session item
        * user clicks on the instructor name
        * user selects another instructor from the list
        Then user can see the selected instructor in the form
        * session is not visible in the calendar after submitting the form
        * session is visible if the calendar of the selected instructor is opened
