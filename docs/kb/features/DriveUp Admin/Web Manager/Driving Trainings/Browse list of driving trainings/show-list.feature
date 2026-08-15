Feature: Show list

  Scenario: Default sorting of trainings list is by Registration Date in descending order
  
  Given user is on driveUp admin
  When user clicks on "Driving trainings" in the menu
  Then user sees students list sorted by Registration Date in descending order
  * user can switch to sort ascending by clicking on "Registration Date" in the header

  Scenario: Show list of driving trainings
  
  Given user is on driveUp admin
  When user clicks on "Driving trainings" in the menu
  Then user sees list of driving trainings
  * user sees trainings list with the following columns:
  | Student Name         |
  | Status               |
  | In-charge instructor |
  | Registration date    |
  | Balance              |

  Scenario: User can change sorting of trainings list by clicking on header
  
  Given user is on driveUp admin
  * user is on the list of driving trainings
  * user is on default students list
  When user clicks on <sort_option> in the header
  Then user sees students list sorted by <sort_option> in ascending order
  * user can change direction of sorting by clicking on the same header again
  
  Examples:
  | sort_option          |
  | Status               |
  | In-charge instructor |
  | Student Name.        |
  | Balance              |
