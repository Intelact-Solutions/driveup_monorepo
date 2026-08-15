Feature: View flexible course training details

  Scenario: User can export PDF files for training
  
  Given user is on driveUp admin
  * user is on the detailed view of a course training for a student
  When user clicks on "Export"
  Then user sees dropdown with possible export files

  Scenario: User can see course attendance statistics
  
  Given user is on driveUp admin
  * user is on the detailed view of a course training for a student
  When user navigates to "Attendance"
  Then user sees attendance information for the course training
  * user sees in how many course parts the student has completed out of total number of parts
  * user sees number of missed appointments
  * user sees list of missed appointments, including details
  | part name | date | responsible instructor |

  Scenario: User can view list of course parts
  
  Given user is on the detailed view of a flexible course training for a student
  When user navigates to "Course Parts"
  Then user sees a list of course parts
  * user can see course part details
  | part name | part date | start & end time | responsible instructor |
  * list of course parts can be expanded using "Show All" button
  * completed parts have the label "Done"
  * uncompleted parts feature a calendar button to select appointment
  * uncompleted part without an appointment features the "Time not selected" label
  * uncompleted part with a planned upcoming appointment shows the appointment details
  | date | start time | responsible instructor |

  Scenario: User can view student details
  
  Given user is on driveUp admin
  * user has clicked on a training on the list of course trainings
  When user clicks on "View Training" in the sidebar
  Then user is redirected to the training detailed page
  * user sees student profile picture
  * user sees student name
  * user sees student phone number
