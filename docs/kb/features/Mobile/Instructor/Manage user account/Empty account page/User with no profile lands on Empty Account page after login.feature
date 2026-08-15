Feature: User with no profile lands on Empty Account page after login

Scenario: User with no profile lands on Empty Account page after login

Given user has deleted his last profile 
* user is logged out 
* user has no pending invitation 
When user logs in 
Then user lands on the Empty Account page
