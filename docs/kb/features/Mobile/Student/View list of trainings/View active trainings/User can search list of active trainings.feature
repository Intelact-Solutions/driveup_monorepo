Feature: User can search list of active trainings

Scenario: User can search list of active trainings

Given user is registered as student
* user has multiple active trainings
When user is on the home page
* user enters search item in the field
Then user filters list of trainings based on the search string
