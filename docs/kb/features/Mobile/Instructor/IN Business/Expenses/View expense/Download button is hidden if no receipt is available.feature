Feature: Download button is hidden if no receipt is available

Scenario: Download button is hidden if no receipt is available

Given user is an instructor
    * user is on list of expenses
    * user has not uploaded a receipt for an expense
    When user clicks the view icon of an expense without a receipt
    Then user does not see a "Download" button in the popup
