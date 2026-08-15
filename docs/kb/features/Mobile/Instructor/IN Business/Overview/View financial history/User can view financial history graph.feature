Feature: User can view financial history graph

Scenario: User can view financial history graph

Given user is an instructor
    * user has multiple payments over a longer period of time
    * user has expenses over a longer period of time
    When user opens the "Business" module
    Then user lands on the "Business Overview" page
    When user scrolls down to the "Financial History" section
    Then user sees a graph showing payments, expenses and profit over time
    * user sees financial flow graph
    * graph shows curve for payments flow
    * graph shows curve for expenses flow
    * graph shows curve for profit flow
    * default period is last 7 days
