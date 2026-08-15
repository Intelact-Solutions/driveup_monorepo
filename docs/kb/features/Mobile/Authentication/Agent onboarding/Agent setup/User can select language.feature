Feature: User can select language

Scenario: User can select language

Given user has not previously registered for the app
* has entered phone number for a country with multiple languages (e.g. Switzerland)
* user is on the sign up page
When user selects profile type
* user selects a language
*  user clicks "Next"
* user lands on the first page of the onboarding process
