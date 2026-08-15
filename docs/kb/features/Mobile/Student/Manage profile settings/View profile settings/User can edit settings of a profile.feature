Feature: User can edit settings of a profile

Scenario: User can edit settings of a profile

Given user has multiple profiles in driveUp
* user is on the Profile Settings page
When user clicks on profile for student
Then user is redirected to the settings page of the corresponding profile
* user can edit the settings for student
* user sees Notification settings, Delete Account button
