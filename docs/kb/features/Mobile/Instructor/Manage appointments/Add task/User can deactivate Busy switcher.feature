Feature: User can deactivate Busy switcher

Scenario: User can deactivate Busy switcher

Given user is on the calendar page
        * user is on the "Add task" form
        * "Busy" switcher is turned on by default
        When user clicks on the "Busy" switcher
        Then "Busy" switcher is turned off
        * adding a task will not block the time slot for sessions added by students
