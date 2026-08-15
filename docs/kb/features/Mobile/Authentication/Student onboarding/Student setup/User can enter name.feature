Feature: User can enter name

Scenario: User can enter name

Given user is on the "Personal Data" page of the onboarding process
  When user enters a valid name in the name field
  Then name is displayed in the input field
  * user can proceed to the next step
