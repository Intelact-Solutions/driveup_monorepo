Feature: User can change UI language

Scenario: User can change UI language

Given user is in a country with multiple official languages (e.g. Switzerland)
* user is on the Languages page
When user selects another language from the initially selected
Then the UI of the application instantly changes to the selected language
