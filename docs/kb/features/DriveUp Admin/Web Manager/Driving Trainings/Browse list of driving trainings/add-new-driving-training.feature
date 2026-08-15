Feature: Add new driving training

  Scenario: Existing student is automatically selected when numbers fully match
  
  Given user is on driveUp admin
  * user is on "Driving Trainings" page
  When user clicks "Add driving training"
  * user enters existing student phone number fully
  Then student is automatically selected

  Scenario: User can create new training with unregistered phone number
  
  Given user is on driveUp admin
  * user is on "Driving Trainings" page
  When user clicks "Add new training"
  * user enters unregistered student phone number
  * user uploads student profile picture (optional)
  * user selects category
  * user optionally selects "Automatic tranmission"
  * user clicks "Add training"
  Then popup is closed
  * new driving training is created for the student
  * user sees success message

  Scenario: User can remove selected student to restart search process
  
  Given user is on driveUp admin
  * user is on "Driving Trainings" page
  * user has opened the "Add new training" form
  * user has selected an existing student from the search results list
  When student clicks on x
  Then selected student is removed
  * form is reset
  * user can enter a new phone number and restart the process

  Scenario: User can select existing student to add a new training
  
  Given user is on driveUp admin
  * user is on "Driving Trainings" page
  When user clicks "Add new training"
  * user enters existing student phone number
  * user selects student in the search results list
  Then student data is automatically filled-out
  * student data is not editable
  * user can add category
  * user can select transmission type
  * user can create a new training by clicking "Add training"
  * user sees success message after completing the process

  Scenario: User sees empty state if there are no active driving categories
  
  Given user is on driveUp admin
  * user is on "Driving Trainings" page
  * company does not have any active driving categories
  When user clicks "Add driving training"
  * user sees empty state screen
  * user can go to "Categories Management" page
