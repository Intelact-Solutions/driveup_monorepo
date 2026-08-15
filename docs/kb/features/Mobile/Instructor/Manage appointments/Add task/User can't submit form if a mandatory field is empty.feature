Feature: User can't submit form if a mandatory field is empty

Scenario: User can't submit form if a mandatory field is empty

Given user is on the calendar page
        * user is on the "Add task" form
        When user leaves <field> empty
        * user tries to submit the form
        Then error message is shown
        * user can't submit the form

        Examples:
            | field      |
            | task title |
