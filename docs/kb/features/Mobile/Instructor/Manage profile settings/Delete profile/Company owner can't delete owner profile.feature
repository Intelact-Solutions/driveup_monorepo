Feature: Company owner can't delete owner profile

Scenario: Company owner can't delete owner profile

Given user is on the driving school profile settings page
* user is company owner
* user has no other profile
When user scrolls to the bottom of the profile
Then user sees a deactivated "Delete profile" button
* user sees an info note that company owner can't delete the owner profile
