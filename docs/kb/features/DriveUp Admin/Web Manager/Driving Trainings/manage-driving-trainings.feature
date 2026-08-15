Feature: Manage driving trainings

  Scenario: Driving category and instructor are selected automatically when ds has only 1 driving category and 1 instructor
  
  Given driving school has only one active instructor 
  * driving school has only one active driving category 
  When user opens "Add new training" popup
  Then the driving category is automatically selected 
  * the instructor is automatically selected
  * user does not see the dropdown for both fields
  * both fields are read only

  Scenario: Exam estimation card is hidden if fewer than 10 driving sessions are completed
  
  Given user is on driveUp admin
  * student has completed fewer than 10 driving sessions
  When user opens detailed view of a driving training
  Then user sees the empty state of the exam estimation card

  Scenario: Payment request button is disabled for students with zero or positive balance
  
  Given user is on driveUp admin
  * student has zero or positive balance
  When user opens the detailed view of a driving training
  Then "Request Payment" button is disabled
  * user cannot click on "Request Payment" button

  Scenario: Re-instate driving training
  
  Given user is on driveUp admin
  * user is on the detailed view of a driving training
  * driving training is archived
  When user clicks on "Re-instate Training" button
  * user confirms re-instating the training
  Then training is re-instated
  * training is visible in the list of active trainings
  * both student and instructor are able to add new appointments to the training

  Scenario: User can add discount
  
  Given user is on driveUp admin
  * user is on the detailed view of a driving training
  When user clicks on "+Add Finance" in the sidebar
  * user enters discount amount
  * user optionally adds a description
  * user submits form
  Then new discount transaction is added to the financial flow
  * all the details are displayed correctly

  Scenario: User can add payment
  
  Given user is on driveUp admin
  * user is on the detailed view of a driving training
  When user clicks on "+Add Finance" in the sidebar
  * user enters payment amount
  * user selects payment type
  * user optionally adds a description
  * user submits form
  Then new payment transaction is added to the financial flow
  * all the details are displayed correctly

  Scenario: User can add refund
  
  Given user is on driveUp admin
  * user is on the detailed view of a driving training
  When user clicks on "+Add Finance" in the sidebar
  * user enters refund amount
  * user optionally adds a description
  * user submits form
  Then new refund transaction is added to the financial flow
  * all the details are displayed correctly

  Scenario: User can complete a driving training
  
  Given user is on driveUp admin
  * user is on the detailed view of a driving training
  When user clicks on "End Training" button
  * user selects "Complete & Archive" in the confirmation dialog
  Then driving training is marked as completed
  * all future appointments are deleted
  * training is archived
  * user sees success message

  Scenario: User can edit in-charge instructor
  
  Given user is on driveUp admin
  * user is on the detailed view of a driving training
  When user clicks on in-charge instructor name
  Then list of instructors is displayed
  * user can search for an instructor by name
  * user can select a new in-charge instructor from the list
  * user can apply changes

  Scenario: User can edit student information
  
  Given user is on driveUp admin
  * user is on the detailed view of a driving training
  When user clicks on "Edit training information" in the header
  Then edit sidebar is opened
  * user can edit <editable_fields>
  * user can save changes
  
  Examples:
  |editable_fields                  |
  |Automatic Transmission           |
  |Appointment Management Permission|
  |Administration Fee               |
  |License Expiry Date              |
  |License Number                   |

  Scenario: User can end driving training
  
  Given user is on driveUp admin
  * user is on the detailed view of a driving training
  When user clicks on "End Training" button
  Then user sees "End Driving Training" confirmation dialog
  * user sees warning that training will be archived
  * user sees warning that all future appointments will be deleted
  * user sees number of remaining appointments
  * user sees Balance
  * user can select "Complete & Archive" or "Terminate & Archive"

  Scenario: User can export PDF files for training
  
  Given user is on driveUp admin
  * user has opened page "Driving trainings"
  When user clicks on a student in the list
  * user clicks on the "Export" button in the sidebar
  Then user sees dropdown with possible export files
  | student sheet | student dossier | payment receipt | appointment confirmation|

  Scenario: User can request payment from student with negative balance
  
  Given user is on driveUp admin
  * student has negative balance
  * user is on the detailed view of a driving training
  When user clicks on "Request Payment" in the sidebar
  Then user sees confirmation dialog with balance information and message
  * user can confirm sending request
  * request is sent to student by SMS

  Scenario: User can select pickup location from list
  
  Given user is on driveUp admin
  * user is on the detailed view of a driving training
  * no pickup location is set
  When user clicks on "Select pickup location" on the placeholder
  Then list of available pickup locations is displayed
  * user can select a new pickup location from the list

  Scenario: User can terminate a driving training
  
  Given user is on driveUp admin
  * user is on the detailed view of a driving training
  When user clicks on "End Training" button
  * user selects "Terminate & Archive" in the confirmation dialog
  Then driving training is marked as terminated
  * all future appointments are deleted
  * training is archived
  * user sees success message

  Scenario: User can unselect pickup location
  
  Given user is on driveUp admin
  * user is on the detailed view of a driving training
  * pickup location is set
  When user clicks on the "Pickup location" header
  Then user sees the list of pickup locations
  * user can select unselect the currently selected location

  Scenario: User can view exam estimation if more than 10 driving sessions are completed
  
  Given user is on driveUp admin
  * user is on detailed view of a driving training
  * student has completed more than 10 driving sessions
  When user looks at the "Exam estimation" section
  Then user sees start date of the training 
  * user sees the estimated date for the driving exam
  * user sees progress bar
  * user sees number of days left until the estimated exam date

  Scenario: User can view list of appointments
  
  Given user is on driveUp admin
  * user is on detailed view of a driving training
  When user clicks on the header of the "Appointments" card
  Then user sees popup with list of all appointments
  * user sees total number of appointments
  * user sees number of upcoming appointments
  * list is chronologically ordered with newest appointments on top
  * for each appointment, user sees number of appointment, date, time and instructor name
  * past appointment are greyed out
  * cancelled appointments display the label "Cancelled" in red

  Scenario: User sees trainings status label in the header if training completed or terminated
  
  Given user is on driveUp admin
  * user has a driving training with status "Completed" or "Terminated"
  When user opens the detailed view of the driving training
  Then user sees "Completed" or "Terminated" status label in the header
