Feature: Add task

  Scenario: Busy switcher is turned on by default in the add task form
  
  Given user is on the calendar page
  When user opens the the "Add task" form
  Then "Busy" switcher is turned on by default
  * adding a task will block the time slot for sessions added by students

  Scenario: Default task title is My Task
  
  Given user is on the calendar page
  * user has triggered form for adding new session
  When user switches to type "Task"
  Then the title is automatically filled-out with the placeholder title "My Task"

  Scenario: End time can't be before start time
  
  Given user is on the calendar page
  * user is on the "Add task" form
  When user selects an end time before the start time
  Then error message is shown
  * user can't submit the form

  Scenario: Instructor is pre-selected and not editable in popup
  
  Given user is on the calendar page
  * user has triggered form for adding new session
  When user changes type to "Task"
  Then instructor is pre-selected and not editable

  Scenario: User can add end time
  
  Given user is on the calendar page
  * user is on the "Add task" form
  When user clicks on the end time field
  * user selects an end time from the time-picker
  Then end time is selected
  * end time is shown in the form

  Scenario: User can add start time
  
  Given user is on the calendar page
  * user is on the "Add task" form
  When user clicks on the start time field
  * user selects a start time from the time-picker
  Then start time is selected
  * start time is shown in the form

  Scenario: User can change task to all day
  
  Given user is on the calendar page
  * user is on the "Add task" form    
  When user clicks on the "All day" checkbox
  Then start time and date time are hidden in the form
  * after being added, task is shown pinned at the top of the day

  Scenario: User can deactivate Busy switcher
  
  Given user is on the calendar page
  * user is on the "Add task" form
  * "Busy" switcher is turned on by default
  When user clicks on the "Busy" switcher
  Then "Busy" switcher is turned off
  * adding a task will not block the time slot for sessions added by students

  Scenario: User can edit task title
  
  Given user is on the calendar page
  * user is in the edit form for task
  * user sees placeholder title "My Task"
  When user clicks on the field
  * user updates values
  * Then task name is updated

  Scenario: User can select date
  
  Given user is on the calendar page
  * user is on the "Add task" form
  When user clicks on the date field
  * user selects a date from the date-picker
  Then date is selected
  * date is shown in the form

  Scenario: User can submit form if all mandatory fields are filled-out
  
  Given user is on the calendar page
  * user is on the "Add task" form
  When user enters task title
  * user selects a date from the date-picker
  * user selects a start time from the time-picker
  * user selects an end time from the time-picker
  * user submits the form
  Then task is added to the calendar

  Scenario: User can switch to Task mode
  
  Given user is on the calendar page
  * user has triggered form for adding new session
  When user changes type to "Task"
  Then user is in "Task" mode
  * user can add task details

  Scenario: User can't submit form if a mandatory field is empty
  
  Given user is on the calendar page
  * user is on the "Add task" form
  When user leaves <field> empty
  * user tries to submit the form
  Then error message is shown
  * user can't submit the form
  
  Examples:
  | field      |
  | task title |
  | date       |
  | start time |
  | end time   |
