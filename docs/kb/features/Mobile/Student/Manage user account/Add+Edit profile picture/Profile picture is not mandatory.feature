Feature: Profile picture is not mandatory

Scenario: Profile picture is not mandatory

Given user is on the profile page
When user removes the profile picture
* user has all other mandatory data
Then user can proceed with work
