Feature: User can select date

Scenario: User can select date

Given user is on the calendar page
        * user is on the "Add task" form
        When user clicks on the date field
        * user selects a date from the date-picker
        Then date is selected
        * date is shown in the form
