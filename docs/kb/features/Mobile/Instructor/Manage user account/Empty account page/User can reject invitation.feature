Feature: User can reject invitation

Scenario: User can reject invitation

Given user has only one active profile 
* user has a pending invitation 
When user deletes the profile 
Then user lands on the Empty Account page 
* user sees the pending invitation 
* user can reject the invitation 
* invitation card is not shown
