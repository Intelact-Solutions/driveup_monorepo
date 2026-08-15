Feature: User can not proceed without a selection

Scenario: User can not proceed without a selection

Given user is authenticated
* user is on the "Select services" page
When user does not select any category
Then Next button is disabled
* user can't proceed with the onboarding
