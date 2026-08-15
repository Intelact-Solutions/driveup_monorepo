Feature: Invite new team member

  Scenario: Onboarding info pages are skipped for additional invited user profiles
  
  Given user has a driveUp profile as an instructor
  * user receives another invitation as an instructor
  * user sees the invitation on his own Account Settings page
  When user accepts the invitation
  Then no onboarding is triggered
  * user remains on the Account Settings page

  Scenario: User can cancel invitation
  
  Given user is on the team management page
  * user has invited a new team member
  When user clicks "Cancel invitation"
  Then invitation for the user is cancelled
  * and user receives an SMS informing about the cancellation
  * invited user is removed from the list
  * if invited user was previously deleted and then reinstated, he is moved back to the list of "Deleted" users

  Scenario: User can invite new team member
  
  Given user is on the team management page
  When user clicks "Add team member"
  * user adds name and phone number
  * user selects role
  * user submits the form by clicking "Send invitation"
  Then new team member is added to the list
  * status of the new team member is "Pending"
  * team member is shown in the "Pending" section
  * team member receives an invitation SMS to join the company on driveUp
  * if team member already has a driveUp account, the invitation is visible on his "Account settings" page and as a hyperlink on the start pag

  Scenario: User can not reinstate a deleted team member if the team member has deleted the driveUp account
  
  Given user is on the team management page
  * user has previously deleted a team member
  * team member has deleted his driveUp account
  When user scrolls to the team member card
  Then no "Reinstate" button is shown
  * user sees info message "The user has deleted their driveUp account an cannot be re-instated. You have to invite the user as a new team member."

  Scenario: User can reinstate a deleted team member if the team member still has driveUp account
  
  Given user is on the team management page
  * user has previously deleted a team member
  * team member maintains his driveUp account
  When user clicks on the "Re-instate" button
  Then the "Add team member" overlay is shown
  * fields "Name" and "Phone number" are pre-filled and read-only
  * user can select role "Manager" or "Instructor"
  * user can send invitation
  * team member is shown under the category "Pending" after the invitation
