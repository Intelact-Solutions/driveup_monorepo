Feature: User can delete hisher only profile

Scenario: User can delete hisher only profile

Given user is on the driving school profile settings page
* user is not company owner
* user has no other profile
When user clicks on "Delete Profile"
* user confirms the deletion
Then profile is deleted
* user lands on Empty Account page
