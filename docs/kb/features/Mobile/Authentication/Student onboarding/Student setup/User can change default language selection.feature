Feature: User can change default language selection

Scenario: User can change default language selection

Given the user is on the personal data page
  * the language dropdown is displayed
  When the user selects a different language from the dropdown
  Then the selected language is selected
  * the app content updates to reflect the new language selection
