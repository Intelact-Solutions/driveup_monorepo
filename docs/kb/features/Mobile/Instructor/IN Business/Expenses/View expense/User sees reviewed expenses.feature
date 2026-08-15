Feature: User sees reviewed expenses

Scenario: User sees reviewed expenses

Given user is an instructor
    * user is on the "Business Overview" page
    When user clicks the header of the expenses section
    Then user sees approved expenses in the list
    * each approved expenses shows the same UI elements
    |expense category| date & time|amount & currency| status "Accepted" or "Rejected" | View icon |
    * expenses are sorted chronologically, with newest on top
