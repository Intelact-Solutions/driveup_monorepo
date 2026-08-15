Feature: User can delete one of multiple profiles

Scenario: User can delete one of multiple profiles

Given user is on the driving school profile settings page
* user is student
* user has multiple profiles
When user opens settings page for the student profile
* user clicks on "Delete Profile"
* user confirms the deletion
Then profile is deleted
* user lands on the Home screen of his other existing profile
