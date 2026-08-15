Feature: Edit driving session

  Scenario: Calendar item type switcher is not visible
  
  Given user is on the Calendar page
  * user has previously added a driving session for a student
  When user clicks on the session item
  Then user should not see the calendar item type switcher
  * user can't change the type of the session to "Task"

  Scenario: Cancel button is hidden for past sessions
  
  Given user is on the Calendar page
  * user has a past driving session for a student
  When user clicks on the past session item
  Then user should not see the "Delete session" button
  * user can't delete past sessions

  Scenario: Manager can delete past appointment
  
  Given user is on the Calendar page
  * user has previously added a driving session for a student
  * the session is in the past
  When user clicks on the session
  Then user sees the "Delete" button
  * user can delete session

  Scenario: Manager can delete session with Cancelled status
  
  Given student has cancelled an appointment in the obligation period
  * appointment remains in the calendar with a "Cancelled" label
  When manager clicks on the session
  * manager clicks "Delete"
  * manager confirms deletion
  Then appointment is removed from the calendar
  * cost of the appointment is removed from the student finances

  Scenario: Student is not editable
  
  Given user is on the Calendar page
  * user has previously added a driving session for a student
  When user clicks on the session item
  Then user can see the student name
  But user can not select another student

  Scenario: User can assign to an instructor with Busy label
  
  Given user is on the Calendar page
  * user has previously added a driving session for a student
  When user clicks on the session item
  * user clicks on the instructor name
  Then user sees the list of instructors and their availability
  * user can select an instructor with "Busy" label

  Scenario: User can cancel upcoming session
  
  Given user is on the Calendar page
  * user has previously added a driving session for a student
  When user clicks on the session item
  * user clicks on the "Cancel session" button
  * user confirms deletion
  Then session is removed from the calendar
  * student is notified about the cancellation

  Scenario: User can edit custom pickup location
  
  Given user is on the Calendar page
  * user has previously added a driving session for a student
  * user has added a custom pickup location to the session
  When user clicks on the session item
  * user clicks on the pickup location field
  * user edits the custom pickup location
  Then user can see the edited custom pickup location in the form

  Scenario: User can edit date
  
  Given user is on the Calendar page
  * user has previously added a driving session for a student
  When user clicks on the session item
  * user clicks on the date field
  * user selects a new date from the calendar
  Then user can see the newly selected date in the form

  Scenario: User can edit instructor
  
  Given user is on the Calendar page
  * user has previously added a driving session for a student
  When user clicks on the session item
  * user clicks on the instructor name
  * user selects another instructor from the list
  Then user can see the selected instructor in the form
  * session is not visible in the calendar after submitting the form
  * session is visible if the calendar of the selected instructor is opened

  Scenario: User can edit start time
  
  Given user is on the Calendar page
  * user has previously added a driving session for a student
  When user clicks on the session item
  * user clicks on the start time field
  * user selects a new start time from the dropdown
  Then user can see the newly selected start time in the form

  Scenario: User can navigate to training
  
  Given user is on the Calendar page
  * user has previously added a driving session for a student
  When user clicks on the session item
  * user clicks on the settings icon next to the student name
  Then user is redirected to the training page of the student

  Scenario: User can select another pickup location
  
  Given user is on the Calendar page
  * user has previously added a driving session for a student
  * user has added a pickup location to the session
  When user clicks on the session item
  * user clicks on the pickup location field
  * user selects another pickup location from the list
  Then user can see the newly selected pickup location in the form

  Scenario: User can submit form after editing session
  
  Given user is on the Calendar page
  * user has previously added a driving session for a student
  When user clicks on the session item
  * user edits the session details
  * user clicks on the "Save" button
  Then user can see the updated session in the calendar

  Scenario: User can switch to Exam mode
  
  Given user is on the Calendar page
  * user has previously added a driving session for a student
  When user clicks on the session item
  * user turns on the "Exam mode" switcher
  * user submits the form
  Then session is marked as an exam session in the calendar
