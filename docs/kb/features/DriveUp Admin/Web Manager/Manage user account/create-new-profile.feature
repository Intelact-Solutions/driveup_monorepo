Feature: Create new profile

  Scenario: Adding a New Profile
  
  Given user is on the Profile Settings page
  When user clicks on "Add New Account"
  Then user is redirected to the "Sign up" screen
  * user can create a new profile
  * the new profile is visible on the Profile settings page

  Scenario: Student or Agent can't create a second profile of the same type
  
  Given user is on Profile Settings page
  * user has a profile of the type <type>
  When user clicks "Add new profile"
  Then user sees list of profile types
  * and profile type <type> is deactivated
  * user can select any other available profile type
  
  Examples:
  |type|
  |Student|
  |Agent|
