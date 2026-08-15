Feature: Switch profile

  Scenario: User can move to profile settings
  
  Given user is on the Home screen
  When user clicks on his own profile picture
  * user clicks on "Account settings"
  Then user lands on the account settings page

  Scenario: User can switch profile
  
  Given user is on the Home screen
  * user has multiple profiles
  When user clicks on his own profile picture
  * user clicks on another profile
  Then user lands on the start page of the selected profile

  Scenario: User can view available profiles
  
  Given user is on the Home screen
  * user has multiple profiles
  When user clicks on his own profile picture
  Then user sees a bottom overlay with the list of existing account
  * each instructor profile shows also the company name and the logo
