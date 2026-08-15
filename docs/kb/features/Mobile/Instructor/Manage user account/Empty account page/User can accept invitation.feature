Feature: User can accept invitation

Scenario: User can accept invitation

Given user has only one active profile 
* user has a pending invitation 
When user deletes the profile 
Then user lands on the Empty Account page 
* user sees the pending invitation 
* user can accept the invitation 
* user proceeds with onboarding
