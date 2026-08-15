Feature: User sees language dropdown if a country with multiple official languages is selected

Scenario: User sees language dropdown if a country with multiple official languages is selected

Given the user is on the personal data page
  When the user selects a country code for a country with multiple official languages
  Then a language selection dropdown appears
  * the user sees all official languages listed in the dropdown
