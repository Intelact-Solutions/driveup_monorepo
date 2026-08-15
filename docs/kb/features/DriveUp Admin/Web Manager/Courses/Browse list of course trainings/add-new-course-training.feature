Feature: Add new course training

  Scenario: Existing student is automatically selected when numbers fully match
  
  Given user is on driveUp admin
  * user is on "Course Trainings" page
  When user clicks "Add course training"
  * user enters existing student phone number fully
  Then student is automatically selected

  Scenario: User can create new course training with unregistered phone number
  
  Given user is on driveUp admin
  * user is on "Course Trainings" page
  When user clicks "Add course training"
  * user enters unregistered student phone number
  * user optionally uploads student profile picture
  * user enters student name
  * user selects course from the list
  * user clicks "Add training"
  Then popup is closed
  * new course training is created for the student
  * user sees success message

  Scenario: User can remove selected student to restart search process
  
  Given user is on driveUp admin
  * user is on "Course Trainings" page
  * user has opened the "Add course training" form
  * user has selected an existing student from the search results list
  When user clicks on x
  Then selected student is removed
  * form is reset
  * user can enter a new phone number and restart the process

  Scenario: User can select existing student to add a new training
  
  Given user is on driveUp admin
  * user is on "Course Trainings" page
  When user clicks "Add course training"
  * user enters existing student phone number
  * user selects student in the search results list
  Then student data is automatically filled-out
  * student data is not editable
  * user can search for course in the list
  * user can select course from the list
  * user can create a new training by clicking "Add training"
  * user sees success message after completing the process

  Scenario: User sees empty state if there are no active course trainings
  
  Given user is on driveUp admin
  * user is on "Course Trainings" page
  * company does not have any active course trainings
  When user clicks "Course training"
  * user sees empty state screen
  * user can go to Fixed Courses
  * user can go to Flexible courses
