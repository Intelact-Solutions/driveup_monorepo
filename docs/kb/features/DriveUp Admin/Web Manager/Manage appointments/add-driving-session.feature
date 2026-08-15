Feature: Add driving session

  Scenario: User can add custom pickup location
  
  Given user is on the calendar
  When user triggers adding a new appointment
  * user clicks on the pickup location field
  * user chooses to add a custom pickup location
  Then user can enter and save a new pickup location
  * pickup location is shown in the form
  * pickup location is not automatically saved in the company's default list

  Scenario: User can add session in exam mode
  
  Given user is on the calendar
  When user triggers adding a new appointment
  * user fills the student name field
  * user fills the date field
  * user fills the start time field
  * user selects exam mode
  Then form is submitted successfully
  * new session is added to the calendar
  * new session is marked as exam session

  Scenario: User can add session to every instructor in the company
  
  Given user is on the calendar
  * user is manager
  When user opens the calendar for another instructor
  Then calendar is editable
  * user can add calendar items
  * user can edit calendar items

  Scenario: User can add session without a pickup location
  
  Given user is on the calendar
  When user triggers adding a new appointment
  * user fills the student name field
  * user fills the date field
  * user fills the start time field
  * user submits the form without selecting a pickup location
  Then form is submitted successfully
  * new session is added to the calendar
  * pickup location is not shown in session details

  Scenario: User can select date
  
  Given user is on the calendar
  When user triggers adding a new appointment
  * user clicks on the date field
  * user selects a date from the calendar
  Then date is shown in the form

  Scenario: User can select existing pickup location
  
  Given user is on the calendar
  * company has existing pickup locations
  When user triggers adding a new appointment
  * user clicks on the pickup location field
  Then user can select existing pickup location

  Scenario: User can select start time
  
  Given user is on the calendar
  When user triggers adding a new appointment
  * user clicks on the start time field
  * user selects a start time from the time picker
  Then start time is shown in the form

  Scenario: User can select student
  
  Given user is on the calendar
  When user triggers adding a new appointment
  * user clicks on the student field
  Then user can select student
  * user can't select multiple students

  Scenario: User can select training for student with multiple trainings
  
  Given user is on the calendar
  * user has a student with multiple driving trainings
  When user triggers adding a new appointment
  * user clicks on the student field
  * user selects student with multiple trainings
  Then user lands on training selection screen
  * user can select training

  Scenario: User can submit form if all mandatory fields are filled-out
  
  Given user is on the calendar
  When user triggers adding a new appointment
  * user fills the student name field
  * user fills the date field
  * user fills the start time field
  * user submits the form
  Then form is submitted successfully
  * new session is added to the calendar
  * the length of the session is the length defined by the driving school for the selected category

  Scenario: User can't submit form if a mandatory field is missing
  
  Given user is on the calendar
  When user triggers adding a new appointment
  * user fills all mandatory fields except <missing_field>
  * user tries to submit the form
  Then form submission is blocked
  * user sees a validation message for the missing field
  
  Examples:
  | missing_field |
  | student name  |
  | date          |
  | start time    |

  Scenario: User sees placeholder for missing pickup locations
  
  Given user is on the calendar
  * company has not added any pickup locations
  When user triggers adding a new appointment
  * user clicks on the pickup location field
  Then user sees a message indicating no pickup locations are available
