Feature: User can navigate back and forth in the info pages

Scenario: User can navigate back and forth in the info pages

Given user is on one of the info pages in the onboarding process
  When user is on the second info page
  Then user sees only "Next" button
  * user does not see "Back" button
  * user can not navigate back to the previous info page
