Feature: Calendar item type switcher is not visible

Scenario: Calendar item type switcher is not visible

Given user is on the Calendar page
        * user has a task
        When user clicks on the task
        Then user sees the task details
        But user does not see the calendar item type switcher
