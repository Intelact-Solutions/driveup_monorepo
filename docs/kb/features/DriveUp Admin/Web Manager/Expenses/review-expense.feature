Feature: Review expense

  Scenario: Expense accepting or rejecting can't be reverted
  
  Given user is on driveUp admin
  * user navigates to the "Expenses" section
  * user has accepted or rejected expense
  When user clicks on the detailed view button for an expense
  Then no action button for status change is visible

  Scenario: User can accept an expense
  
  Given user is on driveUp admin
  * user navigates to the "Expenses" section
  When user clicks on the detailed view button for a specific expense
  * user clicks on the "Accept" button for the expense
  * user confirms the action
  Then the status of the expense is updated to "Accepted" in the list
  * user sees a confirmation message indicating the expense has been accepted
  * expense is not included in the list of pending handovers

  Scenario: User can reject expense
  
  Given user is on driveUp admin
  * user navigates to the "Expenses" section
  When user clicks on the detailed view button for a pending expense
  * user clicks on the "Reject" button for the expense
  * user confirms the action
  Then the status of the expense is updated to "Rejected" in the list
  * user sees a confirmation message indicating the expense has been rejected
  * expense is not included in the list of pending handovers
