Feature: User can view & edit account settings

Scenario: User can view & edit account settings

Given user has only one profile 
When user deletes the profile 
Then user lands on the Empty Account page 
* user sees his own account settings 
* user can edit account settings
