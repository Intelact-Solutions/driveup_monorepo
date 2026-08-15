Feature: Manage

  Scenario: Course status tab is hidden when course has Draft status
  
  Given user has created a draft course
  When user opens the course page
  Then user sees only "Course info" and "Course planing" tabs
  * "Course status" tab is shown only after the course has been published

  Scenario: Maximum number of student must be higher than zero
  
  Given user is on the detailed view of a draft course
  When user edits max. number of students
  * user has the number 1
  Then the minus (-) button is deactivated
  * user can't reduce the number to zero

  Scenario: Updated price is valid only for students who join after the price update
  
  Given user has a fixed course
  * user is on the course info view
  When user updates price
  Then already registered students retain the same price
  * newly registered students are charged the new price

  Scenario: User can add in-charge instructor
  
  Given user has a draft course
  When user opens the "Course info" page
  Then current user is added automatically as "in-charge instructor"
  * user can edit "in-charge instructor" by clicking on the field and selecting member
  * selected in-charge instructor is the default assignee when adding a new part
  * if a team member with appointments is removed, remaining appointments are assigned per default to the in-charge instructor

  Scenario: User can add location
  
  Given user is on the detailed view of a draft course
  When user clicks on the "Location" field
  * user enters location
  * user clicks the save button
  Then new location is added
  * location is visible on the appointments for both instructors and students

  Scenario: User can create new course draft
  
  Given user is on the list of courses
  When user clicks on "Add Course"
  Then a new draft course is created
  * draft course name is "New Course"
  * user lands on the "Course info" tab of the course detailed view

  Scenario: User can delete draft
  
  Given user has a course
  * course has status "Draft"
  When user clicks on "Delete draft"
  Then the course is deleted
  * user lands on the list of courses

  Scenario: User can edit course info
  
  Given user has published a course
  * user is on the detailed view
  When user edits field <field>
  * user confirms editing
  Then field is updated
  * change is visible on all course instances
  
  Examples:
  |field|
  |In-charge instructor|
  |Course name|
  |Description|
  |Price|
  |Number of students|
  |Location|

  Scenario: User can edit course name and description
  
  Given user is on the detailed view of a draft course
  When user does inline editing for <detail>
  * user clicks the save button on inline edit
  Then new <detail> is saved
  
  Examples:
  |detail|
  |course name| 
  |course description|

  Scenario: User can edit course price
  
  Given user is on the detailed view of a draft course
  When user edits course price on inline edit
  * user clicks save button
  Then new course price is saved
  * every new course training added will add the amount to a student as generated cost

  Scenario: User can edit draft
  
  Given user has created a draft course
  When user opens the course
  Then user can edit all course details
  * user can delete the draft

  Scenario: User can edit max. number of students
  
  Given user is on the detailed view of a draft course
  When user edits max. number of students
  Then new number is saved
  * user can't add more students to the course than the number defined
  * user sees "no more seats" alert, as soon as this number is reached

  Scenario: User can publish course without optional fields
  
  Given user has created a draft course
  When user adds course details
  * user does not add <optional_field>
  Then user can publish the draft
  * course is visible with the status "Published"
  * Course Status tab is visible
  * students can be added to the course
  
  Examples:
  |optional_field|
  |location|
  |description|

  Scenario: User can publish draft
  
  Given user has created a draft course
  When user adds course details
  * course has parts
  * no mandatory fields are missing
  Then user can publish the draft
  * course is visible with the status "Published"
  * Course Status tab is visible
  * students can be added to the course

  Scenario: User can remove end date of flexible course
  
  Given user has a flexible course
  * user has added an end date
  When user clicks on "Change End Date"
  * user clicks on "Remove End Date"
  * end date is removed
  * user sees success message "Course End Date is Removed"
  * user can again add appointments and series without any limitation

  Scenario: User can set end date to flexible course
  
  Given user has a flexible course
  * user has not added an end date
  When user clicks on "End Course"
  * user adds end date
  * user submits the form
  Then the course is added an end date
  * after this date, the course will have the status "Finished"
  * user can't add any appointments or series which stretch beyond the set end date
  * all course appointments after the date will be cancelled
  * all students will be notified about cancelled appointments

  Scenario: User can trigger End Course dialog for flexible course
  
  Given user has a flexible course
  * user has not added an end date
  When user clicks on "End Course"
  Then users sees "End date" dialog
  * user sees text with the date of the last appointment with registered students
  * date of the last appointment with registered students is pre-selected in the date-picker

  Scenario: User can update end date of flexible course
  
  Given user has a flexible course
  * user has added an end date
  When user clicks on "End Course"
  Then user sees info box that end date has been added
  * user can update the end date and submit the form
  * all course appointments after the selected date will be cancelled
  * all students will be notified about cancelled appointments

  Scenario: User can't publish if course has no parts
  
  Given user has created a draft course
  When user adds course details
  * no mandatory fields are missing
  * user adds no part to the course
  Then user can't publish the draft
  * user sees error message "Your course must have at least one part"

  Scenario: User sees info about cancelled appointments and incomplete student trainings
  
  Given user has a flexible course
  * user has not added an end date
  When user clicks on "End Course"
  * user adds end date which is earlier than last appointment with students
  Then user sees number of students appointments which will be cancelled
  * user sees number of students who would not be able to complete their course without this part

  Scenario: User sees read-only preview of course name
  
  Given user has a draft course
  When user opens the detailed view
  * user is on the "Course info" tab
  Then user sees a read-only preview of the course name
  * preview is updated the moment the user updates course name

  Scenario: User sees warning message if appointment series collides with company holidays
  
  Given user has a flexible course
  When user adds a new appointment series for a course part
  * series collides with company holidays
  Then user sees warning on the course info page
  * warning text is as follows "You have one or more course appointments which coincide with your company holidays. Please remove course appointment on company holidays to avoid complications with your students."
  * warning is visible as long as the conflict is not resolved
  * user can not remove warning
  * user can navigate to part settings by clicking "Go to part settings"

  Scenario: User sees warning message when all appointments of a part are full
  
  Given user has a flexible course
  When all no available places are left in the appointments of a course part
  Then user sees warning on the course info page
  * warning is visible as long as the issue is not resolved
  * user can not remove warning

  Scenario: User sees warning message when there is no further appointment for a part
  
  Given user has a flexible course
  When all appointment for a course part have been completed
  * there is no upcoming appointment for the given part
  Then user sees warning on the course info page
  * warning is visible as long as the issue is not resolved
  * user can not remove warning
  * user can navigate to part settings by clicking "Go to part settings"
