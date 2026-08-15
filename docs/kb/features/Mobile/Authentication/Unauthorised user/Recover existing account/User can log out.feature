Feature: User can log out

Scenario: User can log out

Given user is on the "Authentication required" screen
When user clicks "Logout"
Then user is logged
* user returns to the Start page
