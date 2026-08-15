Feature: Instructor with no in-charge training can delete own profile

Scenario: Instructor with no in-charge training can delete own profile

Given user is on the driving school profile settings page
* user is not company owner
When user clicks on "Delete Profile"
Then user can confirm the deletion
* user lands on the Empty Account page
