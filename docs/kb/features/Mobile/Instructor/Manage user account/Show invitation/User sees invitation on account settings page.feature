Feature: User sees invitation on account settings page

Scenario: User sees invitation on account settings page

Given user has a profile
When user receives a new invitation from a company
Then user sees the invitation as a card on the account settings page
* clicking the card leads to the onboarding process for the new invitation
