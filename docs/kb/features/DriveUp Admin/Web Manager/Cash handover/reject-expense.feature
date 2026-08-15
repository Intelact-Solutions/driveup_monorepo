Feature: Reject expense

  Scenario: User can accept a previously rejected expense
  
  Given user is manager
  * user is on the "Cash handover" list for a selected instructor
  * user has previously rejected an expense
  When user clicks on the "Accept" button of the rejected expense
  Then the expense status changes back to "Accepted"
  * expense is included in the cash handover calculation summary
  * after the cash handover is submitted, expense is removed from the list for future handovers

  Scenario: User can reject an expense during cash handover
  
  Given user is manager
  * user is on the "Cash handover" list for a selected instructor
  When user clicks on the "Reject" button of an expense
  Then the expense status changes to "Rejected"
  * rejected expense is excluded from the cash handover calculation summary
  * after the cash handover is submitted, the rejected expense is removed from the list

  Scenario: User can skip a previously rejected expense
  
  Given user is manager
  * user is on the "Cash handover" list for a selected instructor
  * user has previously rejected an expense
  When user clicks on the "Skip" button of the rejected expense
  Then the expense status changes to "Skipped"
  * skipped expense is excluded from the cash handover calculation summary
  * after the cash handover is submitted, the skipped expense does not remain in the "Skipped" state for future handovers
