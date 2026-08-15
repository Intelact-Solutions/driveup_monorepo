Feature: User can see pending expenses

Scenario: User can see pending expenses

Given user is instructor
        * user is on the "Business Overview" page
        When user clicks "Start Cash Handover" button
        Then user lands on the "Cash handover" page
        * user sees list of pending expenses
        * each expense displays the category, amount, date & time, and status
