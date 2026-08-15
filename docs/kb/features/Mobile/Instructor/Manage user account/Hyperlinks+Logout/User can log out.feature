Feature: User can log out

Scenario: User can log out

Given user is on the Profile Settings page
    When user clicks on the Logout button
    Then user should be logged out of the application
    * the should be redirected to the Start page
