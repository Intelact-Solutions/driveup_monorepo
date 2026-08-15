Feature: View list of pending handovers

  Scenario: No detailed view is shown for instructors without pending cash handover
  
  Given user is manager
  * user is on the "Cash Handovers" page
  When user clicks on an instructor without pending cash handover
  Then no cash handover items are shown
  * user sees placeholder message

  Scenario: User can click View all to view full list of pending handovers
  
  Given user is logged in as a driving school manager
  * driving school has pending handovers
  When user navigates to the "Finances" section
  * user clicks on the "View all" button in the "Cash Handovers" section
  Then user is navigated to the "Cash Handovers" page

  Scenario: User can open cash handover details for an instructor
  
  Given user is manager
  * user is on the "Cash Handovers" page
  When user clicks on an instructor with pending cash handover
  Then details of the pending cash handover are opened in a sidebar
  * user sees payments registered by the instructor
  * user sees expenses registered by the instructor

  Scenario: User can start handover process from pending handovers list
  
  Given user is logged in as a driving school manager
  * driving school has pending handovers
  When user navigates to the "Finances" section
  * user clicks on the "Start" button for a pending handover
  Then user is navigated to the "Start Handover" page
  * selected instructor is preselected in the "Start Handover" page
  * list of payments and expenses for the selected instructor is shown

  Scenario: User can view list of pending cash handovers
  
  Given user is manager
  When user selects "Cash Handovers" on the left sidebar
  Then user sees list of instructors with pending cash handover
  * user sees details of pending cash handovers
  | Instructor name and picture | Total sum of payments | Total sum of expenses |
  * instructors without pending cash handovers are shown at the bottom of the list
  * for instructors without pending cash handovers, only instructor name and picture are shown

  Scenario: User can view pending handovers
  
  Given user is logged in as a driving school manager
  * driving school has pending handovers
  When user navigates to the "Finances" section
  Then user sees the 3 pending handovers with the highest amount
  * user sees details of each pending handover
  |Instructor name|Sum of payments|Sum of expenses|Start button|
