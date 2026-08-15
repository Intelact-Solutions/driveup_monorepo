Feature: Show list of team members

  Scenario: User can see list of deleted team members
  
  Given user is on admin page
  * user has invited new team members, who have not accepted the invitation
  When user clicks Team Management in the page menu
  Then user sees list of all active members in the driving school
  * list of active members is shown on top
  * for each team member, the following elements are shown
  |Profile picture|Role|Name|Phone number|Deletion date| status | "Reinstate" button  | Name of inviter

  Scenario: User see list of invited team members
  
  Given user is on admin page
  * user has invited new team members, who have not accepted the invitation
  When user clicks Team Management in the page menu
  Then user sees list of all active members in the driving school
  * list of active members is shown on top
  * for each team member, the following elements are shown
  |Profile picture|Role|Name|Phone number|Invitation date| status | Cancel Invitation button  | Name of inviter |

  Scenario: User sees list of active team members
  
  Given user is on admin page
  * user has active team members
  When user clicks Team Management in the page menu
  Then user sees list of all active members in the driving school
  * list of active members is shown on top
  * for each team member, the following elements are shown
  |Profile picture|Role|Name|Phone number|start date|number of trainings for which user is in charge |

  Scenario: User sees no Reinstate button for former team member who have deleted their driveUp account
  
  Given user is on the team management page
  * user has previously deleted a team member
  * team member has deleted his driveUp account
  When user scrolls to the team member card
  Then no "Reinstate" button is shown
  * user sees info message "The user has deleted their driveUp account an cannot be re-instated. You have to invite the user as a new team member."

  Scenario: User sees three different categories of team members
  
  Given user is on admin page
  When user clicks Team Management in the page menu
  Then user sees the list of team members
  * list is divided into Active, Pending and Deleted
  * categories are hidden if they have no members
