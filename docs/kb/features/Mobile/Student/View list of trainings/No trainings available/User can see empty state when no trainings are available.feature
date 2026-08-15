Feature: User can see empty state when no trainings are available

Scenario: User can see empty state when no trainings are available

Given user is registered as student
* user has no trainings
When student starts app 
Then user sees an empty state
