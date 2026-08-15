Feature: View list of expenses

  Scenario: User can download the receipt image of a specific expense
  
  Given user is on driveUp admin
  * user navigates to the "Expenses" section
  When user opens the detailed view for a specific expense
  * user clicks on the download button for the receipt image
  Then image is downloaded to the user's device

  Scenario: User can filter expenses
  
  Given user is on driveUp admin
  * user navigates to the "Expenses" section
  When user opens the filter options
  * user filters by <filterType>
  Then list of expenses is updated to show only expenses matching the selected filter
  
  Examples:
  | filterType |
  | category   |
  | instructor |
  | status     |
  | date range |

  Scenario: User can search for a specific expense by searchCriteria
  
  Given user is on driveUp admin
  * user navigates to the "Expenses" section
  When user enters <searchCriteria> in the search bar
  Then user sees the expenses matching the specified <searchCriteria>
  
  Examples:
  | searchCriteria  |
  | instructor name |
  | amount          |

  Scenario: User can see detailed information of a specific expense
  
  Given user is on driveUp admin
  * user navigates to the "Expenses" section
  When user clicks on the detailed view button for a specific expense
  Then user sees detailed information about the selected expense in a sidebar
  |expense details| receipt image|download button|

  Scenario: User sorts expenses by instructor name, time, category or amount
  
  Given user is on driveUp admin
  * user navigates to the "Expenses" section
  When user clicks on the column header to sort expenses in ascending order
  Then user sees the list of expenses sorted by the selected column from lowest to highest

  Scenario: User views the list of expenses
  
  Given user is on driveUp admin
  When user navigates to the "Expenses" section
  Then user sees a list of expenses for the entire company
  * expenses are sorted chronologically with newest on top
  * user sees expense details for each expense
  | Employee name | Date & Time | Category | Amount | Status | Detailed view button |
