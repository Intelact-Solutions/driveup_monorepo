Feature: Adding a New Profile

Scenario: Adding a New Profile

Given user is on the Profile Settings page
    When user clicks on "Add New Account"
    Then user is redirected to the "Sign up" screen
    * user can create a new profile
    * user can switch between profiles
    * the new profile is visible on the Profile settings page
