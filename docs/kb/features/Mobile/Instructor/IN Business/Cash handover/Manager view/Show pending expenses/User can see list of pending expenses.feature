Feature: User can see list of pending expenses

Scenario: User can see list of pending expenses

Given user is manager
        * user is on the "Business Overview" page
        When user clicks "Start Cash Handover" button
        * user activates toggler "Switch to manager view"
        * user selects an instructor
        Then user lands on the "Cash handover" page
        * user sees list of pending expenses
        * each expense displays the category, amount, date & time, and status
