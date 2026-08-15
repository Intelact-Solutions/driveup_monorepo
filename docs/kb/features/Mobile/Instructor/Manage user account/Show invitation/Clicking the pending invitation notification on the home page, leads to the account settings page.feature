Feature: Clicking the pending invitation notification on the home page, leads to the account settings page

Scenario: Clicking the pending invitation notification on the home page, leads to the account settings page

Given user has a profile
* user has received a new invitation
When user opens the Home page
* and user clicks on the notification for the new invitation
Then user is redirected to the Account Settings page
* user sees the invitation on the Account Settings page
