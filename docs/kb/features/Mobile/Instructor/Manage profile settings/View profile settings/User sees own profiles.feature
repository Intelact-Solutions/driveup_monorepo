Feature: User sees own profiles

Scenario: User sees own profiles

Given user has multiple profiles in driveUp
When user opens the Profile Settings page
Then user sees all available profiles
* and for each profile, user can see the affiliated driving school
* current profile is highlighted
