Feature: User sees total income in business overview

Scenario: User sees total income in business overview

Given user is an instructor
    * user has multiple payments over a longer period of time
    * user has multiple expenses over a longer period of time
    When user opens the "Business" module
    Then user lands on the "Business Overview" page
    * user sees the total income calculated as total payments minus total expenses
