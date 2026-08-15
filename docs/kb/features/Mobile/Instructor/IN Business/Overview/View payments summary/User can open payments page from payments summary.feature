Feature: User can open payments page from payments summary

Scenario: User can open payments page from payments summary

Given user is an instructor
    * user is on the "Business Overview" page
    When user clicks the header of the payments section
    Then user is navigated to the "Payments" page
    * user sees detailed list of payments
