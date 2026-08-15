Feature: User can edit settings of a profile

Scenario: User can edit settings of a profile

Given user has multiple profiles in driveUp
* user is on the Profile Settings page
When user clicks on profile instructor
Then user is redirected to the settings page of the corresponding profile
* user can edit the settings for instructor
* user sees Working hours and days, Days-off, Calendar Link, Notification Settings, Delete Account button
