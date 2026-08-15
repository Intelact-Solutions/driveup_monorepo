Feature: Invited user sees invitation upon authentication

Scenario: Invited user sees invitation upon authentication

Given user has deleted his last profile 
* user is logged out 
* user has pending invitation 
When user logs in
Then user sees invitation in the Empty Account page
* user can proceed with onboarding if he accepts the invitation
But user can reject invitation
