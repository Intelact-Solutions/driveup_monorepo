Feature: View course appointments

  Scenario: User can navigate to course
  
  Given user is on the calendar
  When user opens a course appointment
  * user clicks on "Go to Course Management"
  Then user lands on the detailed view of a course

  Scenario: User can re-assign own course appointment to another instructor
  
  Given user is assigned to a course part appointment
  When user opens calendar
  * user clicks on the course part appointment
  * user clicks on instructor name
  Then user sees list of instructors
  * user sees the label "Busy" for instructors who have a conflicting appointment
  * user can assign appointment to another instructor by selecting name and submitting the form
  * instructors with "Busy" status can also be selected

  Scenario: User can't edit course appointment details
  
  Given user is assigned to a course part appointment
  When user opens calendar
  * user clicks on the course part appointment
  Then user sees the detailed view of the appointment
  * appointment details are not editable

  Scenario: User sees list of students for past course appointments
  
  Given user is assigned to a course part appointment
  * appointment is completed
  When user opens calendar
  * user clicks on the course part appointment
  * user clicks on "Registered students"
  * Then user sees read-only list of students
  * user sees student details 
  |profile picture|student name|
  * user attendancy status
  |not attended (red)|attended (green)|

  Scenario: User sees list of students for upcoming course appointments
  
  Given user is assigned to a course part appointment
  * appointment is upcoming
  When user opens calendar
  * user clicks on the course part appointment
  * user clicks on "Registered students"
  * Then user sees read-only list of students
  * user sees student details 
  |profile picture|student name|
  * user sees no attendancy status
