Feature: Language selection shown for countries with multiple official languages

Scenario: Language selection shown for countries with multiple official languages

Given user has not previously registered for the app
* has entered phone number for a country with multiple languages (e.g. Switzerland)
* user is on the sign up page
When user selects profile type
Then user sees the language selection screen
* user can't skip the screen
