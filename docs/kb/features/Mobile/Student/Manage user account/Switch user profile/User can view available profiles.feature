Feature: User can view available profiles

Scenario: User can view available profiles

Given user is on the Home screen
* user has multiple profiles
When user clicks on his own profile picture
Then user sees a bottom overlay with the list of existing account
* current profile is highlighted
* each instructor profile shows also the company name and the logo
