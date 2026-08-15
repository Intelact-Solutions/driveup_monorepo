Feature: View course training summary in the sidebar

  Scenario: User can add financial transaction
  
  Given user is on driveUp admin
  * user is on the detailed view of a course
  When user clicks on "+Add Finance" in the sidebar
  Then "Add Finance" dialog is opened
  * student data is pre-filled in the dialog
  * user can add a financial transaction for the student

  Scenario: User can export PDF files for training
  
  Given user is on driveUp admin
  * user has opened page "Course Trainings"
  When user clicks on a student in the list
  * user clicks on the "Export" button in the sidebar
  Then user sees dropdown with possible export files
  | student sheet | student dossier | payment receipt | appointment confirmation |

  Scenario: User can navigate to training detailed page
  
  Given user is on driveUp admin
  * user has opened page "Course Trainings"
  When user clicks on a student in the list
  * user clicks on "View Training" in the sidebar
  Then user is redirected to the training detailed page

  Scenario: User can request payment from student
  
  Given user is on driveUp admin
  * user has opened page "Course Trainings"
  When user clicks on a student with negative balance in the list
  * user clicks on "Request Payment" in the sidebar
  * user confirms sending request
  Then payment request is sent to student

  Scenario: User can view course training summary in sidebar
  
  Given user is on driveUp admin
  * user is on "Course Trainings" page
  When user clicks on a course training in the list
  Then user sees training summary in the sidebar
  * user sees student's name, profile picture
  * user sees course name
  * user sees course description
  * user sees course financial information
