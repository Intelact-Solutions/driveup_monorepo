Feature: User can view sign up screen

Scenario: User can view sign up screen

Given user has no account
When use start the app
And user is authenticated
Then user lands on the Sign up screen
* user sees "Sign up" label and hint to select user type
* user sees all available user types as selectable cards
