Feature: Instructor with in-charge training can't delete profile

Scenario: Instructor with in-charge training can't delete profile

Given user is on the driving school profile settings page
* user is not company owner
* user has no other profile
When user clicks on "Delete Profile"
Then user is blocked
* user sees hint to assign own trainings to other instructors
