Feature: User can select a day in the graph to view details

Scenario: User can select a day in the graph to view details

Given user is on the "Business Overview" page
    * user is viewing the financial history graph
    When user clicks on a specific day on the financial history graph
    Then user sees a popup with detailed breakdown of payments, expenses, and profit for that day
