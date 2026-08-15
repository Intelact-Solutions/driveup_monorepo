Feature: View student debts

  Scenario: User can click See all to view full list of students with outstanding debts
  
  Given user is logged in as a driving school manager
  * driving school has students with outstanding debts
  When user navigates to the "Finances" section
  * user clicks on the "See all" button in the "Debts" section
  Then user is navigated to the "Debts" page

  Scenario: User can request payment from student on the debts list
  
  Given user is logged in as a driving school manager
  * driving school has students with outstanding debts
  When user navigates to the "Finances" section
  * user clicks on the "Request payment" button for a student with outstanding debts
  Then user sees a popup to request payment from the selected student
  * popup includes student's name and total debt amount
  * user can confirm the payment request by clicking the "Send" button in the popup

  Scenario: User can sort debts list by total debt amount
  
  Given user is logged in as a driving school manager
  * driving school has students with outstanding debts
  When user navigates to the "Finances" section
  * user clicks the header of the "Total debt" column to change sorting
  Then user sees the debts list sorted by total debt amount from high to low
  * user can click the header of the "Total debt" column again to change sorting from low to high

  Scenario: User can view list of students with outstanding debts
  
  Given user is logged in as a driving school manager
  * driving school has students with outstanding debts
  When user navigates to the "Finances" section
  Then user sees the "Debts" section
  * user sees a list of students with outstanding debts
  * list is sorted alphabetically by student name A to Z
  * user sees details of each student
  | Student name | Phone number | Driving category |  | Total debt amount | Training status |
