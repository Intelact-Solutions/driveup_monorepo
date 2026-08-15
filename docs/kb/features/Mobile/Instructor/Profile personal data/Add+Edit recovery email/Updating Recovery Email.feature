Feature: Updating Recovery Email

Scenario: Updating Recovery Email

Given user is on the Profile Settings page
When user clicks on the Recovery Email field
* user updates their email address
* user enters confirmation code received per email
Then the updated email address should be displayed on the Profile Settings page
