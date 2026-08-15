Feature: End course trainings

  Scenario: Course training is automatically completed when all parts are done
  
  Given user is on driveUp admin
  * user has a course training for a student
  When student completes all the training parts
  Then course training is set to "Complete"
  * student is removed from all upcoming appointments

  Scenario: User can manually complete course training
  
  Given user is on driveUp admin
  * user is on the detailed view of a course training for a student
  When user clicks on "End Course Training"
  * user clicks "Complete course" in the popup
  Then course training is set to "Completed"
  * student is removed from all upcoming appointments

  Scenario: User can terminate course training
  
  Given user is on driveUp admin
  * user is on the detailed view of a course training for a student
  When user clicks on "End Course Training"
  * user clicks "Terminate course" in the popup
  Then course training is set to "Terminated"
  * student is removed from all upcoming appointments
