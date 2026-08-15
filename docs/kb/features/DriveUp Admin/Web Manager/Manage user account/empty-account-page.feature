Feature: Empty account page

  Scenario: Invited user sees invitation upon authentication
  
  Given user has deleted his last profile 
  * user is logged out 
  * user has pending invitation 
  When user logs in
  Then user sees invitation page and not the Empty Account page
  * user can proceed with onboarding if he accepts the invitation
  But user can reject invitation and land on the Empty Account page

  Scenario: User can accept invitation
  
  Given user has only one active profile 
  * user has a pending invitation 
  When user deletes the profile 
  Then user lands on the Empty Account page 
  * user sees the pending invitation 
  * user can accept the invitation 
  * user can proceed with onboarding

  Scenario: User can create new profile
  
  Given user is on the Empty Account page 
  When user clicks on "Create profile"
  Then user lands on the Sign up page
  * new profile can be created

  Scenario: User can delete account
  
  Given user is on the Empty Account page 
  When user clicks on "Delete Account" 
  * user confirms the deletion 
  Then user is logged out of the app 
  * user account is deleted

  Scenario: User can log out
  
  Given user is on the Empty Account page 
  When user clicks on "Log out" 
  Then user is logged out of the app 
  * user is on the Start page

  Scenario: User can reject invitation
  
  Given user has only one active profile 
  * user has a pending invitation 
  When user deletes the profile 
  Then user lands on the Empty Account page 
  * user sees the pending invitation 
  * user can reject the invitation 
  * invitation card is not shown

  Scenario: User can view & edit account settings
  
  Given user has only one profile 
  When user deletes the profile 
  Then user lands on the Empty Account page 
  * user sees his own account settings 
  * user can edit account settings

  Scenario: User with no profile lands on Empty Account page after login
  
  Given user has deleted his last profile 
  * user is logged out 
  * user has no pending invitation 
  When user logs in 
  Then user lands on the Empty Account page
