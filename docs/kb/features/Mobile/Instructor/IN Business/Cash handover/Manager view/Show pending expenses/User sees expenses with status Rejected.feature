Feature: User sees expenses with status Rejected

Scenario: User sees expenses with status Rejected

Given user is manager
        * user has rejected expenses for an instructor in the company
        * user is on the "Business Overview" page
        When user clicks "Start Cash Handover" button
        * user activates toggler "Switch to manager view"
        * user selects an instructor with rejected expenses
        Then user lands on the "Cash handover" page
        * user sees list of rejected expenses
        * each rejected expense features "Accept" button
        * each rejected expense features "Skip" button
