Feature: Student is not editable

Scenario: Student is not editable

Given user is on the Calendar page
        * user has previously added a driving session for a student
        When user clicks on the session item
        Then user can see the student name
        But user can not select another student
