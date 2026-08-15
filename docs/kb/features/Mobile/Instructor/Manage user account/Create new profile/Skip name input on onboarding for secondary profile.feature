Feature: Skip name input on onboarding for secondary profile

Scenario: Skip name input on onboarding for secondary profile

Given user has an instructor profile
* user is on the Account Settings page
* user has received an invitation for a second profile with another role
When user accepts the invitation
Then user can select the new role
* user does not sees the personal data page
* user lands directly on the info pages for the new profile
