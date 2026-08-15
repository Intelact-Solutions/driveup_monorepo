Feature: Skip expense

  Scenario: User can accept a previously skipped expense
  
  Given user is manager
  * user is on the "Cash handover" list for a selected instructor
  * user has previously skipped an expense
  When user clicks on the "Accept" button of the skipped expense
  Then the expense status changes back to "Accepted"
  * expense is included in the cash handover calculation summary
  * after the cash handover is submitted, expense is removed from the list for future handovers

  Scenario: User can skip an expense during cash handover
  
  Given user is manager
  * user is on the "Cash handover" list for a selected instructor
  When user clicks on the "Skip" button of an expense
  Then the expense status changes to "Skipped"
  * skipped expense is excluded from the cash handover calculation summary
  * after the cash handover is submitted, the skipped expense does not remain in the "Skipped" state for future handovers
