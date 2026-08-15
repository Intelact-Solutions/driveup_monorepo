Feature: User can see pending payments

Scenario: User can see pending payments

Given user is instructor
        * user is on the "Business Overview" page
        When user clicks "Start Cash Handover" button
        Then user lands on the "Cash handover" page
        * user sees list of pending payments
        * each payment displays the amount, date & time, and status
        * each payment shows the student profile picture and name
