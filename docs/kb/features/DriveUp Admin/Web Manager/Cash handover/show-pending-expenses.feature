Feature: Show pending expenses

  Scenario: Default state of all expenses is Accepted
  
  Given user is manager
  * user is on the "Cash Handovers" page
  When user clicks on an instructor with pending cash handover
  * user sees pending expenses in the list
  * default state of all expenses is "Accepted"
  * user sees "Skip" button for all expenses with status "Accepted"
  * user sees "Reject" button for all expenses with status "Accepted"

  Scenario: User can see list of pending expenses
  
  Given user is manager
  * user is on the "Cash Handovers" page
  When user clicks on an instructor with pending cash handover
  Then user sees pending expenses in the list
  * each expense displays the category, amount, date & time, and status
  * each expense shows the instructor profile picture and name
  * user can view expense description and receipt image by clicking on the view icon

  Scenario: User sees expenses with status Rejected
  
  Given user is manager
  * user has rejected expenses for an instructor in the company
  When user clicks on the instructor to view cash handover list
  Then user sees list of rejected expenses
  * each rejected expense features "Accept" button
  * each rejected expense features "Skip" button

  Scenario: User sees expenses with status Skipped
  
  Given user is manager
  * user is on the "Cash Handovers" page
  When user clicks on an instructor with pending cash handover
  Then user sees skipped expenses in the list
  * each skipped expense features "Accept" button
  * each skipped expense features "Reject" button
