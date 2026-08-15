Feature: User can view expense details

Scenario: User can view expense details

Given user is instructor
        * user is on the "Cash handover" page
        * user sees list of pending expenses
        When user clicks on the view icon of an expense
        Then user sees popup with detailed view of the expense, including receipt image and description
