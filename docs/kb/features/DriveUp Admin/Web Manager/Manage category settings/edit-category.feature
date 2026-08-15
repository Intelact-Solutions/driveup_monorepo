Feature: Edit category

  Scenario: User can apply changes to existing trainings
  
  Given user is logged in to driveUp admin
  * user is on the "Category settings" page
  * user has an active category
  When user clicks on category edit icon to open sidebar
  * user changes price or session duration
  * user checks the checkbox "Apply changes to existing ongoing trainings"
  Then the changes are applied to upcoming appointments of ongoing trainings
  * completed appointments are not affected

  Scenario: User can edit price or administration fee of active category
  
  Given user is logged in to driveUp admin
  * user is on the "Category settings" page
  * user has an active category
  When user clicks on category edit icon to open sidebar 
  * user edits price or administration fee of the active category
  Then price is changed
  * appointments of newly added trainings will be calculated with the new price

  Scenario: User can edit session duration of active category
  
  Given user is logged in to driveUp admin
  * user is on the "Category settings" page
  * user has an active category
  When user clicks on categoriy edit icon to open sidebar 
  * user edits session duration of the active category by moving the slider
  * user saves the form
  Then duration is changed
  * appointments of newly added trainings will be added with the new duration

  Scenario: User can't edit inactive category
  
  Given user is logged in to driveUp admin
  When user opens the "Category settings" page
  Then all inactive categories are greyed out
  * user can't edit an inactive category
