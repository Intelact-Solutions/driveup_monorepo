Feature: Show instructors activity

  Scenario: User can switch between months to see instructor activity
  
  Given user is driveUp admin
  * user has multiple instructors
  * user sees list of instructors with activity in the current month
  When user clicks on the month chevron
  Then the list updates to show activity for the selected month
  * for each instructor, user sees picture and name
  * for each instructor, user sees activity in the selected month
  |number of appointments|generated value|expenses|

  Scenario: User sees list of instructors with recent activity
  
  Given user is driveUp admin
  * user has multiple instructors
  When user logs in
  Then user lands per default on the home dashboard
  * user sees list of instructors
  * for each instructor, user sees picture and name
  * for each instructor, user sees activity in the current month
  |number of appointments|generated value|expenses|
