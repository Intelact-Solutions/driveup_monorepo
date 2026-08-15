Feature: User sees total sum of expenses in expenses summary

Scenario: User sees total sum of expenses in expenses summary

Given user is an instructor
    * user has multiple expenses over a longer period of time
    When user opens the "Business" module
    Then user lands on the "Business Overview" page
    * user sees the total sum of expenses incurred by the driving school
