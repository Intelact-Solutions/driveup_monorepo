Feature: User sees expenses with status Skipped

Scenario: User sees expenses with status Skipped

Given user is manager
        * user has skipped expenses for an instructor in the company
        * user is on the "Business Overview" page
        When user clicks "Start Cash Handover" button
        * user activates toggler "Switch to manager view"
        * user selects an instructor with skipped expenses
        Then user lands on the "Cash handover" page
        * user sees list of skipped expenses
        * each skipped expense features "Accept" button
        * each skipped expense features "Reject" button
