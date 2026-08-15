Feature: User sees pending expenses

Scenario: User sees pending expenses

Given user is an instructor
    * user is on the "Business Overview" page
    When user clicks the header of the expenses section
    Then user sees pending expenses in the list
    * each pending expenses shows the same UI elements
    |expense category| date & time|amount & currency| status "Pending" | "Delete" button | "Edit" button | View icon |
    * expenses are sorted chronologically, with newest on top
