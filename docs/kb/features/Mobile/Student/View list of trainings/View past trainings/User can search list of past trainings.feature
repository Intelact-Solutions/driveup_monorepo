Feature: User can search list of past trainings

Scenario: User can search list of past trainings

Given user is registered as student
* user has multiple past trainings
When user is on the home page
* user enters search item in the field
Then user filters list of past trainings based on the search string
