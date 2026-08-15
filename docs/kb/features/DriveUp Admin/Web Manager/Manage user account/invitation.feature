Feature: Invitation

  Scenario: Clicking the pending invitation notification on the home page, leads to the account settings page
  
  Given user has a profile
  * user has received a new invitation
  When user opens the Home page
  * and user clicks on the notification for the new invitation
  Then user is redirected to the Account Settings page
  * user sees the invitation on the Account Settings page

  Scenario: User can accept invitation
  
  Given user has a profile
  * user has received a new invitation from a company
  When user clicks "Accept"
  Then new profile is added to the list of profiles
  * user sees success message
  * user remains on the accounts settings page

  Scenario: User can reject invitation
  
  Given user has a profile
  * user has received a new invitation from a company
  When user clicks "Reject"
  Then no new profile is added
  * invitation disappears from the list
  * user remains on the accounts settings page

  Scenario: User sees invitation on account settings page
  
  Given user has a profile
  When user receives a new invitation from a company
  Then user sees the invitation as a card on the account settings page
