Feature: User sees last 3 expenses in the expenses summary

Scenario: User sees last 3 expenses in the expenses summary

Given user is an instructor
    * user has multiple expenses over a longer period of time
    When user opens the "Business" module
    Then user lands on the "Business Overview" page
    * user sees a list of the last 3 expenses incurred by the driving school
    * each expense entry shows the date, time and amount of the expense
