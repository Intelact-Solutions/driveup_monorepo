Feature: Filter list of course trainings

  Scenario: User can filter for flexible course trainings with incomplete scheduling
  
  Given user is on driveUp admin
  * user is on the "Course Trainings" page
  When user clicks on "Filter" button
  * user checks toggler "Incomplete scheduling - Flexible"
  * user saves the form
  Then user sees only flexible course trainings in which at least one part is not scheduled

  Scenario: User can filter list for course trainings with negative balance
  
  Given user is on driveUp admin
  * user is on the "Course Trainings" page
  When user clicks on "Filter" button
  * user checks toggler "Negative balance"
  * user saves the form
  Then user sees only trainings with negative balance in the list

  Scenario: User can filter list of course trainings by status
  
  Given user is on driveUp admin
  * user is on the "Course Trainings" page
  When user clicks on "Filter" button
  * user selects status <status>
  * user saves the form
  Then user sees only courses with status <status> in the list
  
  Examples:
  | status      |
  | In Progress |
  | Completed   |
  | Terminated  |

  Scenario: User can filter list of courses based on date range
  
  Given user is on driveUp admin
  * user is on the "Course Trainings" page
  When user clicks on "Filter" button
  * user selects date range
  * user saves the form
  Then user sees only course trainings with registration time inside the date range
