Feature: General Overview

  Scenario: Default sorting of courses list is by registration date in descending order
  
  Given user is on driveUp admin
  Given user is on driveUp admin
  When user clicks on "Course Trainings" in the menu
  Then user sees course trainings list sorted by registration date in descending order
  * user can switch to sort ascending by clicking on "Registration Date" in the header

  Scenario: Show list of course trainings
  
  Given user is on driveUp admin
  Given user is on driveUp admin
  When user clicks on "Course Trainings" in the menu
  Then user sees list of courses
  * user sees course trainings list with the following columns:
  | Student Name      |
  | Status            |
  | Course Title      |
  | Registration date |
  | Balance           |

  Scenario: User can change sorting of course trainings list by clicking on header
  
  Given user is on driveUp admin
  Given user is on driveUp admin
  * user is on the list of course trainings
  * user is on default course trainings list
  When user clicks on <sort_option> in the header
  Then user sees course trainings list sorted by <sort_option> in ascending order
  * user can change direction of sorting by clicking on the same header again
  
  Examples:
  | sort_option       |
  | Status            |
  | Student Name      |
  | Balance           |

  Scenario: User can filter calendar based on course
  
  Given user is on the "Course Management page"
  When user clicks on the course filter
  * user selects a course
  Then calendar is filtered
  * only course appointments of the selected course are shown

  Scenario: User can filter calendar based on instructor
  
  Given user is on the "Course Management page"
  When user clicks on the instructor filter
  * user selects a course
  Then calendar is filtered
  * only course appointments assigned to the selected instructor are shown

  Scenario: User can navigate to course
  
  Given user is on the "Course Management" page
  * user has opened the detailed view of a course appointment in the pop-up
  When user clicks on the "Go to Course" button
  Then user is redirected to the "Course info" tab of the selecteed course

  Scenario: User can view course appointment details
  
  Given user is on the "Course Management page"
  When user clicks on an appointment on the calendar
  Then details of the appointment are shown in a pop-up
  * user sees the following data for each course appointment
  |course name|course part| instructor | students| date & time |

  Scenario: User sees all course appointments on default view
  
  Given user is on driveUp admin
  When user clicks "Course Management" on the app menu
  Then user sees the courses calendar on weekly view
  * user sees all course appointments of the current week
  * past and upcoming appointments are shown with different opacity
  * flexible and fixed courses are shown with distinct colors
  * user see following items for each course appointment
  |course name|part name|instructor|

  Scenario: User sees the last state of the calendar, if it was previously opened
  
  Given user has previously opened the course calendar
  * user has changed the view
  * user has filtered the calendar for a specific instructor and/or course
  When user clicks on "Course Management"
  Then user sees the course calendar
  * calendar is shown in the last state, in which the user saw it
