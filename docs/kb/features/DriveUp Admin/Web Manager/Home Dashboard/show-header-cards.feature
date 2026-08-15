Feature: Show header cards

  Scenario: Home dashboard is the default landing page after login
  
  Given user is driveUp admin
  When user logs in
  Then user lands per default on the home dashboard

  Scenario: User see header card for number of new trainings in the current month
  
  Given user is driveUp admin
  * user has new trainings in the current month
  When user logs in
  * user lands on the home dashboard
  * user sees a header card with number of new trainings in the current month
  * user sees trend indicator (upward or downward arrow) compared to previous month
  * user can switch between months
  * clicking the card navigates the user to the trainings page

  Scenario: User sees header card for number of appointment in the current month
  
  Given user is driveUp admin
  * user has appointments in the current month
  When user logs in
  * user lands on the home dashboard
  * user sees a header card with number of appointments in the current month
  * user sees trend indicator (upward or downward arrow) compared to previous month
  * user can switch between months
  * clicking the card navigates the user to the calendar

  Scenario: User sees header card for total amount of open debts
  
  Given user is driveUp admin
  * user has open debts
  When user logs in
  * user lands on the home dashboard
  * user sees a header card witht total amount of open debts
  * clicking the card navigates to the debts page
