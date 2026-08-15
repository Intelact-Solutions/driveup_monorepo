Feature: Company owner can delete a secondary profile

Scenario: Company owner can delete a secondary profile

Given user is company owner
* user has multiple profiles
* user is on the profile settings page of a secondary profile
When user clicks on "Delete Profile"
* user confirms the deletion
Then profile is deleted
* user lands on the Home screen of the owner profile
