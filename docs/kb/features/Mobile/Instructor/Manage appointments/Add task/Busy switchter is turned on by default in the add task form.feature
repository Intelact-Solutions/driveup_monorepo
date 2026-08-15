Feature: Busy switchter is turned on by default in the add task form

Scenario: Busy switchter is turned on by default in the add task form

Given user is on the calendar page
        When user opens the the "Add task" form
        Then "Busy" switcher is turned on by default
        * adding a task will block the time slot for sessions added by students
