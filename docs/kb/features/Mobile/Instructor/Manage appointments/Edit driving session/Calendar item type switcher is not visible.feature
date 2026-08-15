Feature: Calendar item type switcher is not visible

Scenario: Calendar item type switcher is not visible

Given user is on the Calendar page
        * user has previously added a driving session for a student
        When user clicks on the session item
        Then user should not see the calendar item type switcher
        * user can't change the type of the session to "Task"
