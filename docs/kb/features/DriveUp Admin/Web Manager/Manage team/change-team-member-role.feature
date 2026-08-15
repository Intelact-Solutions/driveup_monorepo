Feature: Change team member role

  Scenario: User can change team member role to instructor
  
  Given user is on the team management page
  * user has a team member with role "Manager"
  When user clicks "Change role"
  * user selects "Instructor"
  Then team member role is changed to "Instructor"
  * team member can't use the back office on the web
  * team member can't see the manager handover view on the mobile

  Scenario: User can change team member role to manager
  
  Given user is on the team management page
  * user has a team member with role "Instructor"
  When user clicks "Change role"
  * user selects "Manager"
  Then team member role is changed to "Manager"
  * team member can use the back office on the web
  * team member can see the manager handover view on the mobile

  Scenario: User cannot change hisher own role
  
  Given user is on the team management page
  * user opens his/her own profile
  When user clicks "Change role"
  Then user receives error message "You cannot change your own role"
