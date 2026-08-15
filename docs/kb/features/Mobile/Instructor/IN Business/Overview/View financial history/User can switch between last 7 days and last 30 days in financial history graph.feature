Feature: User can switch between last 7 days and last 30 days in financial history graph

Scenario: User can switch between last 7 days and last 30 days in financial history graph

Given user is an instructor
    * user has multiple payments over a longer period of time
    * user has expenses over a longer period of time
    When user opens the "Business" module
    * user changes period to "Last 30 days"    
    Then the graph updates to show data for the last 30 days
    * graph shows curve for payments flow over last 30 days
    * graph shows curve for expenses flow over last 30 days
    * graph shows curve for profit flow over last 30 days
