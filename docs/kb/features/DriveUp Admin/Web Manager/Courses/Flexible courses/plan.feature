Feature: Plan

  Scenario: Clicking an empty slot triggers new apppointment popup
  
  Given user is on the "Course Planning" tab for flexible courses
  * user has added a part
  * user sees calendar on the part detailed view
  When user clicks on an empty slot
  Then "Add new appointment" popup is shown
  * user sees read-only course name and part name
  * user sees read-only date 
  * user sees editable instructor field, with in-charge course instructor as default selection
  * user sees editable start and end time with pre-filled values
  * user sees collapsed "Repeat" section

  Scenario: Edited appointment of a series is overwritten if instructor is changed at an earlier point
  
  Given user has a series of daily appointment assigned to instructor 1
  * user has edited the instructor of the appointment on Thursday to instructor 2
  When user edits the series 
  * user edits the instructor to instructor 3 on Monday
  Then Thursday appointment is also assigned to instructor 3

  Scenario: Edited appointment of a series is overwritten if instructor is changed at an earlier point
  
  Given user has a series of daily appointment assigned to instructor 1
  * user has edited the instructor of the appointment on Thursday to instructor 2
  When user edits the series 
  * user edits the instructor to instructor 3 on Monday
  Then Thursday appointment is also assigned to instructor 3

  Scenario: Edited appointment of a series is overwritten if time changed at an earlier point
  
  Given user has a series of daily appointment in a week at 9 am
  * user has edited the time of the appointment on Thursday to 11 am
  When user edits the series
  * user sets time to 12 am
  Then Thursday appointment is also changed to 12 am

  Scenario: Edited appointment removed if repetition logic changes
  
  Given user has an appointment series with a weekly repetition on Mo, Wed and Fr
  * user has changed the Wednesday appointment time and instructor
  When user edits series repetition logic
  * Wednesday is removed from the repetition pattern
  Then the appointment on Wednesday is deleted
  * all participants are notified for the cancellation

  Scenario: Edited appointment removed if repetition logic changes
  
  Given user has an appointment series with a weekly repetition on Mo, Wed and Fr
  * user has changed the Wednesday appointment time and instructor
  When user edits series repetition logic
  * Wednesday is removed from the repetition pattern
  Then the appointment on Wednesday is deleted
  * all participants are notified for the cancellation

  Scenario: Series ignores company holidays and times-off
  
  Given user is on the calendar of a flexible course part
  * user has previously added company holidays, days-off, working hours or personal holiday
  When user adds a new course appointment series with a certain repetition logic
  Then series ignores the blocked times
  * appointments are added also in blocked slots based on the repetition logic
  But warning is shown on the Course Info page, if appointment collides with company holiday

  Scenario: Show edit form for single appointment of a series
  
  Given user is on the Course Planing tab of a flexible course
  * user has a series appointment for a course part
  When user clicks on the appointment
  * user sees read-only date
  * user sees editable instructor field
  * user sees number of registered students
  * user can expand list of registered students
  * user sees editable start and end time field
  * user sees "Edit series" button

  Scenario: Show edit form for single appointment
  
  Given user is on the Course Planing tab of a flexible course
  * user has a single appointment for a course part
  When user clicks on the appointment
  * user sees read-only date
  * user sees editable instructor field
  * user sees number of registered students
  * user can expand list of registered students
  * user sees editable start and end time field
  * user sees "Add repetition" button
  * user sees "Delete" button

  Scenario: User can add flexible course series
  
  Given user is on the calendar of a flexible course part
  * user has clicked on an empty slot to add new appointment
  * user has expanded the "Repeat" section
  When user selects instructor
  * user enters start and end time
  * user selects days for the repetition logic
  * user sets a deadline for the repetition
  * user clicks "Save"
  Then new appointment series based on the repetition logic is added
  * when course published, students can register themselves for the appointment

  Scenario: User can add new part
  
  Given user is on the "Course Planning" tab of a flexibel course
  When user clicks on "Add part"
  Then detailed view of a new part is shown on the right side
  * "New Part" is automatically added as part name
  * user sees calendar, in which a new appointment or series can be added

  Scenario: User can add new single appointment
  
  Given user is on the calendar of a flexible course part
  * user has clicked on an empty slot to add new appointment
  When user selects instructor
  * user enters start and end time
  * user clicks "Save"
  Then new appointment is added to calendar
  * when course is published, appointment is visible for all students
  * students can join the appoinment

  Scenario: User can change the sort of course parts
  
  Given user has a flexible course
  * user has added multiple parts
  When user opens the "Course planing" tab of the course detailed view
  Then user sees all course parts
  * user can change the sorting of the course parts by drag and drop

  Scenario: User can delete all upcoming appointments in a flexible course series
  
  Given user has an appointment series for a course part
  When user clicks on one of the appointments of the series
  * user clicks "Edit series"
  * user clicks the delete button
  * user confirms deletion on dialog with course name, part name and number of registered students
  Then all upcoming appointments are deleted
  * students are notified with a single notification for all the cancelled appointments

  Scenario: User can delete appointment of a series
  
  Given user is on the Course Planing view
  * user has added a series of appointments for a course part
  When user opens the detailed view of one appointment in the series
  * user clicks "Delete"
  * user confirms deletion
  Then appointment is deleted
  * any registered students are notified about the cancellation
  * for the deleted day in the series, no appointment can be added even if the repetition logic is updated to include it

  Scenario: User can delete course part
  
  Given user has an appointment series for a course part
  When user clicks on delete button for the course part
  * user confirms the deletion
  Then course part is deleted
  * all future appointments of the course part are deleted
  * all registered students are notified for the appointment cancellation

  Scenario: User can delete single flexible course appointment
  
  Given user is on the Course Planing view
  * user has added a single appointment for a course part
  When user opens the detailed view of the appointment
  * user clicks "Delete"
  * user confirms deletion
  Then appointment is deleted
  * any registered students are notified about the cancellation

  Scenario: User can edit an appointment of a series
  
  Given user is on the Course Planing tab of a flexible course
  * user has a series appointment for a course part
  When user clicks on the appointment
  * user clicks on field <field>
  * user edits the field
  * user saves the change
  Then the change is valid only for the appointment and not the series
  * the appointment becomes an exception in the series
  
  Examples:
  |field|
  |instructor|
  |start time|
  |end-time|

  Scenario: User can edit deadline of repetition
  
  Given user has an appointment series for a course part
  * repetition deadline is set to current day
  When user clicks on the "Repeat until" button
  * user adds a new date which is in 3 months from current date
  * user saves the form
  Then series is extended by 3 months
  * appointments are added with the same pattern for another 3 months

  Scenario: User can edit default instructor of series
  
  Given user has an appointment series for a course part
  When user clicks on one of the appointments
  * user clicks "Edit series"
  * user changes the instructor
  Then the instructor is changed for all upcoming appointments which come after the edited appointment
  * instructor is changed also for previously edited single appointment of a series

  Scenario: User can edit repetition pattern of a series
  
  Given user has an appointment series for a course part
  * repetition logic is Mo, Wed, Friday
  When user clicks on the appointment on Wed
  * user clicks "Edit series"
  * user changes the weekly repetition pattern by removing Fr
  Then the repetition pattern changes immediately
  * future appointments on Fridays are removed
  * the changes affects the current week as well

  Scenario: User can edit single appointment of a series
  
  Given user is on the Course Planing tab of a flexible course
  * user has an appointment for a course part
  When user clicks on the appointment
  * user clicks on field <field>
  * user edits the field
  * user saves the changes
  Then changes are saved
  * changes are visible on the calendar
  
  Examples:
  |field|
  |instructor|
  |start time|
  |end time|

  Scenario: User can edit start time and end time in repetition logic
  
  Given user has an appointment series for a course part
  When user clicks on one of the appointments
  * user clicks "Edit series"
  * user changes the start and end time
  Then the start and end time is changed the selected appointment and all upcoming appointments
  * start and endt time is changed also for upcoming exception appointments

  Scenario: User can expand Repeat section to create a new series
  
  Given user is on the calendar of a flexible course part
  * user has clicked on an empty slot to add new appointment
  When user clicks on the header "Repeat"
  Then a section for creating series is shown
  * user can create a series of appointments with a repetition logic

  Scenario: User can switch to edit view for a series
  
  Given user has an appointment which is part of a series
  When user clicks on the appointment
  * user clicks "Edit series"
  Then view is changed to "Edit series" view
  * user sees read-only start date
  * user sees editable "Series instructor" field, with initially set default instructor
  * user does not see field "registered students"
  * user sees editable start and end time
  * user sees repetition logic

  Scenario: User can transform single appointment to series
  
  Given user is on the Course Planing tab of a flexible course
  * user has an appointment for a course part
  When user clicks on the appointment
  * user clicks the "Add repetition" button
  Then "Repeat" area is shown
  * user can select days for a weekly repetition pattern
  * user can define deadline of the repetition pattern

  Scenario: User can view course plan
  
  Given user has a flexible course
  * user has added at least one part
  When user opens the "Course planing" tab of the course detailed view
  Then user sees all course parts
  * parts are ordered chronologically, with earliest added on top
  * for every part, user sees the following elements
  |part number|part name| delete icon |

  Scenario: User can't delete ongoing or complete appointments
  
  Given user is on the Course Planing view
  * user has course appointments which are completed
  When user opens the detailed view of one appointment in the series
  Then "Delete" button is not shown

  Scenario: User sees detailed course info on the confirmation dialog
  
  Given user is on the Course Planing view
  * user has a course appointment
  When user opens the detailed view of one appointment in the series
  * user clicks "Delete"
  Then user sees detailed description of the appointment as part of the confirmation
  |Course name|Part name|Date|Number of registered students|
  * user can confirm the deletion
  * user can dismiss the dialog

  Scenario: User sees placeholder if no part is added
  
  Given user a flexible course
  * course has no parts
  When user clicks on the "Course Planing" tab
  Then user sees a placeholder message with the hint to add a new part
