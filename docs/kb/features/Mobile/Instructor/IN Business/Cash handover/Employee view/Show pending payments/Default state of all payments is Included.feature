Feature: Default state of all payments is Included

Scenario: Default state of all payments is Included

Given user is instructor
        * user is on the "Business Overview" page
        When user clicks "Start Cash Handover" button
        Then user lands on the "Cash handover" page
        * user sees list of pending payments
        * default state of all payments is "Included"
        * status can be changed only by the manager
