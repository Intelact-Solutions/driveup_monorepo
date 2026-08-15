Feature: User can select user type Marketing Agent

Scenario: User can select user type Marketing Agent

Given user is on the "Welcome" screen
When user clicks on user type card "Marketing Agent"
Then the user sees a loading screen while the account is being set up
* user moves to the first screen of the agent onboarding process
