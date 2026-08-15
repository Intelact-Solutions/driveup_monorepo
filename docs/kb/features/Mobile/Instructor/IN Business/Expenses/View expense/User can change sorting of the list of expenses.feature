Feature: User can change sorting of the list of expenses

Scenario: User can change sorting of the list of expenses

Given user is an instructor
    * user is on the "Business Overview" page
    When user clicks the sort button 
    Then user sees sorting options
    * user can change the sorting of the list by selecting different options from the dropdown
    |Newest first| Oldest first| Highest first | Lowest first |
    * expenses are sorted according to the selected option
