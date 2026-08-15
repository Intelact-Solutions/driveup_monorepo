Feature: User can complete onboarding by passing through all info pages

Scenario: User can complete onboarding by passing through all info pages

Given user has entered mandatory data and is on the info page section of the onboarding process
  When user views each info page about the features of the app
  * user clicks the "Next" button on each info page
  Then user completes the onboarding process
  And user lands on the Home screen
