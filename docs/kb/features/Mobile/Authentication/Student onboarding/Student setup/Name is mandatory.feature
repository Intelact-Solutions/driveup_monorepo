Feature: Name is mandatory

Scenario: Name is mandatory

Given user is on the "Personal Data" page of the onboarding process
  When user leaves the name field empty
  * user attempts to proceed to the next step
  Then an error message appears saying "Name is mandatory"
  * user cannot proceed to the next step until the name is entered
