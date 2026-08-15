Feature: User sees total sum of payments in payments summary

Scenario: User sees total sum of payments in payments summary

Given user is an instructor
    * user has multiple payments over a longer period of time
    When user opens the "Business" module
    Then user lands on the "Business Overview" page
    * user sees the total sum of payments received by the driving school
