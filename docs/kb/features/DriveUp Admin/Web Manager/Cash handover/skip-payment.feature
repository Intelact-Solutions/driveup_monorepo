Feature: Skip payment

  Scenario: User can include a previously skipped payment
  
  Given user is manager
  * user is on the "Cash Handovers" page
  * user has previously skipped a payment for an instructor
  When user clicks on the instructor in the list
  * user clicks on the "Include" button of the skipped payment
  Then the payment status changes back to "Included"
  * payment is included in the cash handover calculation summary
  * after the cash handover is submitted, payment is removed from the list for future handovers

  Scenario: User can skip a payment during cash handover
  
  Given user is manager
  * user is on the "Cash Handovers" page
  When user clicks on an instructor with pending cash handover
  * user clicks on the "Skip" button of a payment
  Then the payment status changes to "Skipped"
  * skipped payment is excluded from the cash handover calculation summary
  * after the cash handover is submitted, the skipped payment does not remain in the "Skipped" state for future handovers
