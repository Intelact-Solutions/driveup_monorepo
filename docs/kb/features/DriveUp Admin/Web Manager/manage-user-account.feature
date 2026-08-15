Feature: Manage user account

  Scenario: Color of the initials is shown randomly in every list
  
  Given user has no profile picture
  When a page is opened in which the user profile picture is to be shown
  Then profile picture shows user initials
  * color of the initials is selected randomly from the available color palette

  Scenario: Initials are seen for user without profile picture
  
  Given user is authenticated
  When user completes onboarding without adding a profile picture
  Then user profile picture is always shown with initials
