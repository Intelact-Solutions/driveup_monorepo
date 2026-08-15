Feature: Show team member profile

  Scenario: User can open team member profile for active members
  
  Given user is on the team management page
  * user has active team members
  When user clicks on the card of a team member
  Then user sees the profile of the team member pop up as a side overlay
  * user sees personal details of the team member
  * user sees list of active driving and course trainings
  * user sees action buttons for deleting member and changing his role

  Scenario: User can't open team member profile for pendingdeleted members
  
  Given user is on the team management page
  * user has invited or deleted team members
  When user clicks on the card of an invited or deleted team member
  * no profile is opened
