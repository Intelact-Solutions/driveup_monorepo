Feature: User can select user type Student

Scenario: User can select user type Student

Given user is on the "Welcome" screen
When user clicks on user type card "Student"
Then the user sees a loading screen while the account is being set up
* user moves to the first screen of the studenonboarding process
