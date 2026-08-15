Feature: User can download receipt of an expense

Scenario: User can download receipt of an expense

Given user is an instructor
    * user is on list of expenses
    * user has uploaded a receipt for an expense
    When user clicks the view icon of an expense with a receipt
    * user clicks on the "Download" button of the receipt
    Then receipt is downloaded to the user's device
