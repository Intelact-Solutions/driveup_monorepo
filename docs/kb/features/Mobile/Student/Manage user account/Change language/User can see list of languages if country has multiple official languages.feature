Feature: User can see list of languages if country has multiple official languages

Scenario: User can see list of languages if country has multiple official languages

Given user is in a country with multiple official languages (e.g. Switzerland)
When user opens the account settings page
Then user sees the item "Languages" 
* user can click item "Languages"
* user can see the list of supported languages
