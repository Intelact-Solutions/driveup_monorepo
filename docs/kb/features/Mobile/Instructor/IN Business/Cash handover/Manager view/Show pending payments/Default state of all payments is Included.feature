Feature: Default state of all payments is Included

Scenario: Default state of all payments is Included

Given user is manager
        * user is on the "Business Overview" page
        When user clicks "Start Cash Handover" button
        * user activates toggler "Switch to manager view"
        * user selects an instructor
        Then user lands on the "Cash handover" page
        * user sees list of pending payments
        * default state of all payments is "Included"
        * user sees "Skip" button for all payments with status "Included"
