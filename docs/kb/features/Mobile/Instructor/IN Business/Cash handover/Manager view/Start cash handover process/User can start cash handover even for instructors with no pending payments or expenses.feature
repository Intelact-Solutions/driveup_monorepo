Feature: User can start cash handover even for instructors with no pending payments or expenses

Scenario: User can start cash handover even for instructors with no pending payments or expenses

Given user is manager
        * user is on the "Business Overview" page
        * user has instructors with no pending payments or expenses
        When user clicks "Start Cash Handover" button
        * user selects instructor with no pending payments or expenses
        Then user lands on an empty "Cash handover" page for the selected instructor
        * user sees message indicating no pending payments or expenses for the selected instructor are available
