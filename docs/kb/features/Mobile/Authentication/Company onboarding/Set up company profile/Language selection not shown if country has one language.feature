Feature: Language selection not shown if country has one language

Scenario: Language selection not shown if country has one language

Given user has not previously registered for the app
* has entered phone number for a country with a single language (e.g. Germany)
* user is on the sign up page
When user selects profile type
Then user does not see the language selection screen
* user directly proceeds with the corresponding next page
