Feature: Filter list

  Scenario: User can filter list for driving trainings with negative balance
  
  Given user is on driveUp admin
  * user is on the "Driving Trainings" page
  When user clicks on "Filter" button
  * user selects "Negative balance"
  * user saves the form
  Then user sees only trainings with negative balance in the list

  Scenario: User can filter list of driving trainings by driving category
  
  Given user is on driveUp admin
  * user is on the "Driving Trainings" page
  When user clicks on "Filter" button
  * user selects driving category <category>
  * user saves the form
  Then user sees only trainings with driving category <category> in the list
  
  Examples:
  | category   |
  | A         |
  | B         |
  |C         |
  | AB       |
  |AC        |
  |BC         |

  Scenario: User can filter list of driving trainings by in-charge instructor
  
  Given user is on driveUp admin
  * user is on the "Driving Trainings" page
  When user clicks on "Filter" button
  * user selects in-charge instructor
  * user saves the form
  Then user sees only trainings belonging to the selected in-charge instructor in the list

  Scenario: User can filter list of driving trainings by status
  
  Given user is on driveUp admin
  * user is on the "Driving Trainings" page
  When user clicks on "Filter" button
  * user selects status <status>
  * user saves the form
  Then user sees only trainings with status <status> in the list
  
  Examples:
  | status      |
  | In Progress |
  | Completed   |
  | Terminated  |
