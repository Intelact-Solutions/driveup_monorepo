Feature: View and manage student profile

  Scenario: User can add new course training from the student profile
  
  Given user is on driveUp admin 
  * user is on the "Students" page
  When user clicks on the student
  * user clicks on "Add course training"
  Then user sees "Add course training" form
  * user can select course
  * user can save the new course training

  Scenario: User can add new driving training from the student profile
  
  Given user is on driveUp admin
  * user is on the "Students" page
  When user clicks on the student
  * user clicks on "Add driving training"
  Then user sees "Add driving training" form
  * student data is pre-filled in the form
  * user can select training category
  * user can optionally check "Automatic transmission" toggler
  * user can save the new training

  Scenario: User can edit all student data if student has not finished onboarding
  
  Given user is on driveUp admin
  * user has a student who has not finished onboarding
  * user is on the "Students" page
  When user clicks on the student
  Then user can edit student data
  | Name | Phone number |
  * user can change profile picture
  * user can save changes

  Scenario: User can navigate to training detail page
  
  Given user is on driveUp admin
  * user is on the "Students" page
  * user has a student with driving training or course training
  When user hovers with the mouse over the training card
  Then user sees "Go to training detail" button
  * user can click on "Go to training detail" button
  * user lands on the training detail page for the selected training

  Scenario: User can view student course training details
  
  Given user is on driveUp admin
  * user is on the "Students" page
  * user has a student with course training
  When user clicks on a course training in the student profile
  Then user sees course training details
  | Course name | Status | Course balance |

  Scenario: User can view student driving training details
  
  Given user is on driveUp admin
  * user is on the "Students" page
  * user has a student with driving training
  When user clicks on a training in the student profile
  Then user sees driving training details
  | Instructor | Category | Status | Balance | Total payments |

  Scenario: User can view student profile
  
  Given user is on driveUp admin
  * user is on the "Students" page
  When user clicks on a student in the list
  Then student profile is opened as a sidebar
  * user sees student data
  | Name | Profile picture | Phone number |
  * user sees summary view of student driving trainings, including details
  | instructor | category | status | balance | total payments |
  * user sees summary view of student course trainings, including details
  | course name | status | course balance |

  Scenario: User can't edit phone number if student has finished onboarding
  
  Given user is on driveUp admin
  * user has a student who has finished onboarding
  * user is on the "Students" page
  When user clicks on the student
  Then user can edit student name
  * user can change profile picture
  But user can't edit student phone number
