Feature: Edit tasks

  Scenario: Calendar item type switcher is not visible
  
  Given user is on the Calendar page
  * user has a task
  When user clicks on the task
  Then user sees the task details
  But user does not see the calendar item type switcher

  Scenario: User can change task to all-day
  
  Given user is on the Calendar page
  * user has a task which is not "all-day"
  When user clicks on the task
  * user activates "all-day" switcher
  Then start and end time fields are hidden
  * after submitting, user sees the updated task pinned to the top of the calendar

  Scenario: User can deactivate all-day switcher
  
  Given user is on the Calendar page
  * user has an "all-day" task
  When user clicks on the task
  * user deactivates "all-day" switcher
  * user clicks on the "Save" button
  Then user sees the updated task with time slots
  * task is not pinned to the top of the calendar
  * in the task details, start and end time fields are visible

  Scenario: User can delete past tasks
  
  Given user is on the Calendar page
  * user has a past task
  When user clicks on the task
  Then "Delete" button is visible
  * user can delete the task

  Scenario: User can delete upcoming tasks
  
  Given user is on the Calendar page
  * user has an upcoming task
  When user clicks on the task
  * user clicks on the "Delete" button
  * user confirms deletion
  Then task is removed from the calendar

  Scenario: User can edit date
  
  Given user is on the Calendar page
  * user has a task
  When user clicks on the task
  * user edits task date
  * user clicks on the "Save" button
  Then user sees the updated task with new date

  Scenario: User can edit end time
  
  Given user is on the Calendar page
  * user has a task
  When user clicks on the task
  * user edits task end time
  Then task start time remains unchanged
  * after submitting, user sees the updated task with new end time

  Scenario: User can edit start time
  
  Given user is on the Calendar page
  * user has a task
  When user clicks on the task
  * user edits task start time
  Then task end time is updated accordingly to maintain the same duration
  * after submitting, user sees the updated task with new start time

  Scenario: User can edit task title
  
  Given user is on the Calendar page
  * user has a task
  When user clicks on the task
  * user edits task title
  * user clicks on the "Save" button
  Then user sees the updated task with new title

  Scenario: User can reassign task to another instructor
  
  Given user is on the Calendar page
  * user has a task
  When user clicks on the task
  * user selects a new instructor from the list
  * user clicks on the "Save" button
  Then task is not visible in the current view of the calendar
  * task is visible in the calendar of the new instructor

  Scenario: User can reassign to an instructor with Busy label
  
  Given user is on the Calendar page
  * user has a task
  When user clicks on the task
  * user selects an instructor with "Busy" label from the list
  * user clicks on the "Save" button
  Then task is not visible in the current view of the calendar
  * task is visible in the calendar of the new instructor

  Scenario: User can submit form if all mandatory fields are filled-out
  
  Given user is on the Calendar page
  * user has a task
  When user clicks on the task
  * user edits task details
  * no mandatory fields are empty
  * user clicks on the "Save" button
  Then user sees the updated task with all changes applied

  Scenario: User can't edit past tasks
  
  Given user is on the Calendar page
  * user has a past task
  When user clicks on the task
  Then the form is read-only
  * user can't edit task details

  Scenario: User can't submit form if task title is deleted
  
  Given user is on the Calendar page
  * user has a task
  When user clicks on the task
  * user deletes task title
  * user clicks on the "Save" button
  Then user sees the error message "Task title is required"
  * user can't submit the form
