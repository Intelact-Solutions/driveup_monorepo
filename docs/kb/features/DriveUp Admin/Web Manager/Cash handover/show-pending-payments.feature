Feature: Show pending payments

  Scenario: Default state of all payments is Included
  
  Given user is manager
  * user is on the "Cash Handovers" page
  When user clicks on an instructor with pending cash handover
  Then user sees pending payments in the list
  * default state of all payments is "Included"
  * user sees "Skip" button for all payments with status "Included"

  Scenario: User can see pending payments
  
  Given user is manager
  * user is on the "Cash Handovers" page
  When user clicks on an instructor with pending cash handover
  Then user sees list of pending payments
  * each payment displays the amount, date & time, and status
  * each payment shows the student profile picture and name

  Scenario: User sees payments with status Skipped
  
  Given user is manager
  * user is on the "Cash Handovers" page
  When user clicks on an instructor with pending cash handover 
  * user sees skipped payments in the list
  * each skipped payments features "Include" button
  * user can click "Include" button to add payment to the current handover
