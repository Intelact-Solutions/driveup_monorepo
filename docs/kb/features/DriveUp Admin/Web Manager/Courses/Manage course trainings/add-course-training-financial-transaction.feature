Feature: Add course training financial transaction

  Scenario: User can add discount for course training
  
  Given user is on driveUp admin
  * user is on the detailed view of a course training
  When user clicks on "+Add Finance" in the sidebar
  * user enters discount amount
  * user optionally adds a description
  * user submits form
  Then new discount transaction is added to the course training financial flow
  * all the details are displayed correctly

  Scenario: User can add payment for course training
  
  Given user is on driveUp admin
  * user is on the detailed view of a course training
  When user clicks on "+Add Finance" in the sidebar
  * user enters payment amount
  * user selects payment type
  * user optionally adds a description
  * user submits form
  Then new payment transaction is added to the course training financial flow
  * all the details are displayed correctly

  Scenario: User can add refund for course training
  
  Given user is on driveUp admin
  * user is on the detailed view of a course training
  When user clicks on "+Add Finance" in the sidebar
  * user enters refund amount
  * user optionally adds a description
  * user submits form
  Then new refund transaction is added to the course training financial flow
  * all the details are displayed correctly
