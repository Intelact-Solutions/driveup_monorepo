Feature: Submit cash handover

  Scenario: Calculation summary updates based on included payments and accepted expenses
  
  Given user is manager
  * user is on the "Cash handover" list for a selected instructor
  When manager changes the status of a payment or expense
  Then the cash handover calculation summary is updated accordingly

  Scenario: User can see cash handover calculation summary
  
  Given user is manager
  * user has both expenses and payments pending
  * user is on the "Cash handover" list for a selected instructor
  When user scrolls to the summary section
  Then user sees sum of included payments
  * user sees sum of accepted expenses
  * user sees handover balance (included payments - accepted expenses)

  Scenario: User can submit cash handover
  
  Given user is manager
  * user is on the "Cash handover" list for a selected instructor
  When user clicks on the "Submit" button
  * user confirms cash handover submit
  Then the cash handover is submitted
  * cash handover form is closed 
  * all included payments and accepted and rejected expenses are removed from the "Cash handover" page
  * instructor is automatically moved to the bottom of the list of instructors with pending cash handovers
  * no instructor is selected

  Scenario: User sees warning message if handover balance is negative
  
  Given user is manager
  * user is on the "Cash handover" list for a selected instructor
  When the sum of accepted expenses exceeds the sum of included payments
  Then user sees warning message indicating negative handover balance
  * warning message suggests that the instructor should receive cash from the driving school
