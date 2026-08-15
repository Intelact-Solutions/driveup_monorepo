Feature: First language selected per default in the language dropdown

Scenario: First language selected per default in the language dropdown

Given the user is on the personal data page
  * the language dropdown is displayed
  When the user views the dropdown
  Then the first language in the list is selected by default
