Feature: User sees message when no expenses are available

Scenario: User sees message when no expenses are available

Given user is an instructor
    * user is on the "Business Overview" page
    * user has no expenses
    When user scrolls to the expenses section
    Then user sees a message indicating no expenses are available
