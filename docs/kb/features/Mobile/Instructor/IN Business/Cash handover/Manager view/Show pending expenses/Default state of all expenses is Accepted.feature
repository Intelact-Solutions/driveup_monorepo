Feature: Default state of all expenses is Accepted

Scenario: Default state of all expenses is Accepted

Given user is manager
        * user is on the "Business Overview" page
        When user clicks "Start Cash Handover" button
        * user activates toggler "Switch to manager view"
        * user selects an instructor
        Then user lands on the "Cash handover" page
        * user sees list of pending expenses
        * default state of all expenses is "Accepted"
        * user sees "Skipped" button for all expenses with status "Accepted"
        * user sees "Reject" button for all expenses with status "Accepted"
