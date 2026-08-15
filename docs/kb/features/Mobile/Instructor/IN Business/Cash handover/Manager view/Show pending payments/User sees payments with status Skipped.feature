Feature: User sees payments with status Skipped

Scenario: User sees payments with status Skipped

Given user is manager
        * user has skipped payments for an instructor in the company
        * user is on the "Business Overview" page
        When user clicks "Start Cash Handover" button
        * user activates toggler "Switch to manager view"
        * user selects an instructor with skipped payments
        Then user lands on the "Cash handover" page
        * user sees list of skipped payments
        * each skipped payments features "Include" button
        * user can click "Include" button to add payment to the current handover
