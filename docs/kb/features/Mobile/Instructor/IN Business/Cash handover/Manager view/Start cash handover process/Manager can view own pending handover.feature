Feature: Manager can view own pending handover

Scenario: Manager can view own pending handover

Given user is manager
        * user is on the "Business Overview" page
        When user clicks "Start Cash Handover" button
        * user selects own profile in the list of instructors
        Then user lands on the cash handover page for himself
