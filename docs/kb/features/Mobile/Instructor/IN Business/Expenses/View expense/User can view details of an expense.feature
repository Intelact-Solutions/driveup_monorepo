Feature: User can view details of an expense

Scenario: User can view details of an expense

Given user is an instructor
    * user is on list of expenses
    When user clicks the view icon of an expense
    Then user sees detailed view of the expense as a popup
    * popup shows all relevant information about the expense
    |Expense category| Date & time | Amount & currency | Description (if any) | Receipt (if any) |
    * user sees info message in the popup, if expense has already been decided in a handover process
