Feature: User can overwrite existing account

Scenario: User can overwrite existing account

Given user has no recovery email address
When user selects the option to "Create new account"
Then user is redirected to the start page
* user can proceed with the creation of the new account
* old account is overwritten and can't be retrieved anymore
