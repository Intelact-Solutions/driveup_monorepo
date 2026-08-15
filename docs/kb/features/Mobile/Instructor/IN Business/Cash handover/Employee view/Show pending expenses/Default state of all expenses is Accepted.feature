Feature: Default state of all expenses is Accepted

Scenario: Default state of all expenses is Accepted

Given user is instructor
        * user is on the "Business Overview" page
        When user clicks "Start Cash Handover" button
        Then user lands on the "Cash handover" page
        * user sees list of pending expenses
        * default state of all expenses is "Accepted"
        * status can be changed only by the manager
