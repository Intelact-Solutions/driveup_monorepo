Feature: Delete team member

  Scenario: Former team member with deleted driveUp account displays info message
  
  Given user is on the team management page
  * user has previously deleted a team member
  * team member has deleted his driveUp account
  When user scrolls to the team member card
  Then no "Reinstate" button is shown
  * user sees info message "The user has deleted their driveUp account an cannot be re-instated. You have to invite the user as a new team member."

  Scenario: User can delete instructormanager with no in-charge trainings
  
  Given user is on the Team management page
  * user has at least one team member who is not in-charge instructor for a training
  When user clicks "Delete"
  Then user sees a confirmation dialog
  * user sees info text that all appointments will be assigned to the corresponding in-charge instructors
  * user can confirm the deletion
  * team member is listed afterwards in the list of "Deleted" members

  Scenario: User can't delete instructormanager with in-charge trainings
  
  Given user is on the Team management page
  * user has at least one team member who is in-charge instructor for a training
  When user clicks "Delete"
  Then user sees a blocker screen
  * user sees info message that the team member can't be deleted due to active trainings, of which he is in charge
  * user sees number of trainings and courses, for which the team member is in charge
