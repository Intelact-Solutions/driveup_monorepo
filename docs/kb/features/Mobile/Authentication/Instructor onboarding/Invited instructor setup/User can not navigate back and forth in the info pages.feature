Feature: User can not navigate back and forth in the info pages

Scenario: User can not navigate back and forth in the info pages

Given user is on one of the info pages in the onboarding process
  When user is on the second info page
  Then user does not see the back button
  * user sees only Next button
  * user can not navigate back to the previous info page
