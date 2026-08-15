Feature: User can delete account

Scenario: User can delete account

Given user is on the Empty Account page 
When user clicks on "Delete Account" 
* user confirms the deletion 
Then user is logged out of the app 
* user account is deleted
