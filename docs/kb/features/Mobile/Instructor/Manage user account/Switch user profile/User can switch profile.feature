Feature: User can switch profile

Scenario: User can switch profile

Given user is on the Home screen
* user has multiple profiles
When user clicks on his own profile picture
* user clicks on another profile
Then user lands on the start page of the selected profile
