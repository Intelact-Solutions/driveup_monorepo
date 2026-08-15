Feature: User can change task to all day

Scenario: User can change task to all day

Given user is on the calendar page
        * user is on the "Add task" form    
        When user clicks on the "All day" checkbox
        Then start time and date time are hidden in the form
        * after being added, task is shown pinned at the top of the day
