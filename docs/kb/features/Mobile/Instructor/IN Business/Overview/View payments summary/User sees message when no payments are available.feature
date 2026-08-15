Feature: User sees message when no payments are available

Scenario: User sees message when no payments are available

Given user is an instructor
    * user is on the "Business Overview" page
    * user has no payments
    When user scrolls to the payments section
    Then user sees a message indicating no payments are available
