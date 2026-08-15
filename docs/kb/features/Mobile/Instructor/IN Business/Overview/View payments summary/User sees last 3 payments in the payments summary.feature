Feature: User sees last 3 payments in the payments summary

Scenario: User sees last 3 payments in the payments summary

Given user is an instructor
    * user has multiple payments over a longer period of time
    When user opens the "Business" module
    Then user lands on the "Business Overview" page
    * user sees a list of the last 3 payments received by the driving school
    * each payment entry shows the date, time and amount of the payment
