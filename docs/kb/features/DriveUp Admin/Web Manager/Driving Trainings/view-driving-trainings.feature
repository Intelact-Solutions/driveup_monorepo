Feature: View driving trainings

  Scenario: Student is per default allowed to manage own appointments
  
  Given user is on driveUp admin
  * user has opened page "Driving trainings"
  * user has not changed the "Don't allow student to manage appointments" for a training before
  When user clicks on the student training in the list
  Then toggler "Don't allow student to manage appointments" is not checked
  * student can add and edit own appointments for the training

  Scenario: User can add financial transaction
  
  Given user is on driveUp admin
  * user has opened page "Driving trainings"
  When user clicks on a student in the list
  * user clicks on "+Add Financial Transacation" in the sidebar
  Then "Add Financial Transaction" dialog is opened
  * student data is pre-filled in the dialog
  * user can add a financial transaction for the student

  Scenario: User can block student from managing own appointments
  
  Given user is on driveUp admin
  * user has opened page "Driving trainings"
  When user clicks on a student in the list
  * user checks toggler "Don't allow student to manage appointments"
  Then student can't add and edit own appointments for the training

  Scenario: User can export PDF files for training
  
  Given user is on driveUp admin
  * user has opened page "Driving trainings"
  When user clicks on a student in the list
  * user clicks on the "Export" button in the sidebar
  Then user sees dropdown with possible export files
  |student sheet|student dossier|payment receipt|appointment confirmation|

  Scenario: User can filter financial transactions by type
  
  Given user is on driveUp admin
  * user is on the detailed view of a driving training
  When user clicks on "Filter" in the "Financial Flow" section
  Then user sees filter options for financial transactions
  * user can filter by transaction type
  * user can apply multiple filters at once
  * user can reset filters to view all transactions

  Scenario: User can navigate to training detailed page
  
  Given user is on driveUp admin
  * user has opened page "Driving trainings"
  When user clicks on a student in the list
  * user clicks on "View Training" in the sidebar
  Then user is redirected to the training detailed page

  Scenario: User can request payment from student
  
  Given user is on driveUp admin
  * user has opened page "Driving trainings"
  When user clicks on a student with negative balance in the list
  * user clicks on "Request Payment" in the sidebar
  * user confirms sending request
  Then payment request is sent to student via SMS

  Scenario: User can see separate cancellation item for cancelled transactions
  
  Given user is on driveUp admin
  * user has any financial transaction of any amount for the training
  | payment | refund | discount |
  * user has cancelled the transaction
  * user is on the detailed view of a driving training
  When user scrolls down to the "Financial Flow" section
  Then user sees a separate cancellation item for the cancelled transaction
  * user sees cancelled transaction, which is clearly marked as cancelled with an icon
  * on the cancellation item, user can click info button to view the details of the cancelled transaction

  Scenario: User can sort financial transactions by clicking on header
  
  Given user is on driveUp admin
  * user is on the detailed view of a driving training
  When user clicks on <sort_option> in the header of the "Financial Flow" table
  Then user sees financial transactions sorted by <sort_option> in ascending order
  * user can change direction of sorting by clicking on the same header again
  
  Examples:
  | sort_option          |
  | date and time        |
  | type                 |
  | amount               |
  | registered by        |

  Scenario: User can view driving training summary in the sidebar
  
  Given user is on driveUp admin
  * user has opened page "Driving trainings"
  When user clicks on a student training in the list
  Then user can see the driving training summary in the sidebar
  * user sees the student's name, profile picture
  * user sees driving category
  * user sees instructor image and name
  * user sees financial overview of the training
  |Balance|Total Paid Amount| Detailed list the sum of financial transactions|

  Scenario: User can view training details
  
  Given user is on driveUp admin
  * user is on page "Driving trainings"
  * user has opened summary view sidebar for a student
  When user clicks on "View Training" in the sidebar
  Then user is redirected to the training detailed page
  * user sees student's name, profile picture
  * user sees driving category
  * user sees in-charge instructor image and name
  * user sees pickup location if available
  * user sees total number of appointments
  * user sees date of next appointment

  Scenario: User can view training financial flow
  
  Given user is on driveUp admin
  * user is on the detailed view of a driving training
  When user scrolls down to "Financial Flow" section
  Then user sees a list of all financial transactions related to the training
  * default sorting of financial transactions is by date and time in descending order
  * user sees transaction details
  | date and time | type | amount | registered by |
  * user can see handover status for payments
  | Pending | Approved |
  * user can see payment type in brackets
  | Cash | Transaction | Invoice |

  Scenario: User can view training financial overview
  
  Given user is on driveUp admin
  * user is on the detailed view of a driving training
  When user scrolls down to "Financial Overview" section
  Then user sees balance information
  * user sees total paid amount
  * user sees detailed list of costs
  * user sees detailed list of payments
